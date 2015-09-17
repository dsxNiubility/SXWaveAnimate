//
//  SXWaveView.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/23.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXWaveView.h"
#define W self.bounds.size.width

@interface SXWaveView ()

@property(nonatomic,assign)CGRect rect;
@property(nonatomic,assign)BOOL clips;
@end
@implementation SXWaveView

#pragma mark - **************** 构造方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIView *bgView = [[UIView alloc]initWithFrame:frame];
        [self addSubview:bgView];
        bgView.top = 0;
        bgView.left = 0;
        
        UIImageView *rotateImg = [[UIImageView alloc]initWithFrame:frame];
        rotateImg.contentMode = UIViewContentModeScaleAspectFit;
        rotateImg.image = [UIImage imageNamed:@"fb_rotation.png"];
        UIView * leftView = [[UIView alloc]init];

        [bgView addSubview:leftView];
        leftView.width = bgView.width - W/12.5;
        leftView.height = bgView.height - W/12.5;
        leftView.centerx = bgView.centerx;
        leftView.centery = bgView.centery;

        
        leftView.top = W/25;
        [bgView addSubview:rotateImg];
        rotateImg.top = 0;
        rotateImg.left = 0;
        
        UILabel *avgScoreLbl = [[UILabel alloc]init];
        avgScoreLbl.width = W / 2;
        avgScoreLbl.height = W/4;
        avgScoreLbl.centerx = rotateImg.centerx;
        avgScoreLbl.centery = rotateImg.centery;
        avgScoreLbl.font = [UIFont fontWithName:@"DIN Alternate" size:30*W/125];
        avgScoreLbl.text = @"56%";
        avgScoreLbl.textAlignment = NSTextAlignmentCenter;
        
       
        
        UILabel *descriptionLbl = [[UILabel alloc]init];
        descriptionLbl.width = W / 2;
        descriptionLbl.height = W/6;
        descriptionLbl.centerx = rotateImg.centerx;
        descriptionLbl.centery = rotateImg.centery + 25*W/125;
        descriptionLbl.font = [UIFont systemFontOfSize:13*W/125];
        descriptionLbl.text = @"总评分";
        descriptionLbl.textAlignment = NSTextAlignmentCenter;
        
        [bgView addSubview:avgScoreLbl];
        [bgView addSubview:descriptionLbl];
        
        self.leftView = leftView;
        self.avgScoreLbl = avgScoreLbl;
        self.descriptionLbl = descriptionLbl;
        self.rotateImg = rotateImg;
        
        _alpha = 1;
        _endless = NO;
        UIImageView *bigImg = [[UIImageView alloc]init];
        bigImg.image = [UIImage imageNamed:@"fb_wave.png"];
        self.bigImg = bigImg;
        [self.leftView addSubview:bigImg];
        self.backgroundColor = [UIColor colorWithRed:42/255.0 green:178/255.0 blue:163/255.0 alpha:1];
        
        self.leftView.layer.cornerRadius = self.leftView.bounds.size.width/2.0;
        self.leftView.clipsToBounds = YES;
        
        self.bigImg.frame = CGRectMake(0, 0, 6*W, 3*W);
        
        self.bigImg.top = W;
        self.bigImg.left = -5*W;
    
    }
    return self;
}


- (instancetype)initWithPrecent:(int)precent{
    [self setPrecent:precent];
    self.type = 2;
    self.avgScoreLbl.text = [NSString stringWithFormat:@"%d%%",precent];
    return [[NSBundle mainBundle]loadNibNamed:@"SXWaveView" owner:nil options:nil][0];
}

#pragma mark - **************** 赋值方法
- (void)setPrecent:(int)precent{
    _precent = precent;
    self.avgScoreLbl.text = [NSString stringWithFormat:@"%d%%",precent];
}

- (void)setPrecent:(int)precent textColor:(UIColor *)tcolor alpha:(CGFloat)alpha
{
    [self setAlpha:alpha];
    [self setTextColor:tcolor];
    [self setPrecent:precent];
}
- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha clips:(BOOL)clips{
    [self setAlpha:alpha];
    [self setPrecent:precent];
    [self setClips:clips];
    
    if (description) {
        [self setDescriptionTxt:description];
    }
    if (tcolor) {
        [self setTextColor:tcolor];
    }
    if (bColor) {
        [self setBgColor:bColor];
    }
    
}

- (void)setClips:(BOOL)clips
{
    _clips = clips;
    if (_clips == YES) {
        self.layer.cornerRadius = self.width/2;
        self.clipsToBounds = YES;
    }
}

- (void)setAlpha:(CGFloat)alpha{
    _alpha = alpha;
    self.bigImg.alpha = _alpha;
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.avgScoreLbl.textColor = _textColor;
    self.descriptionLbl.textColor = _textColor;
}

- (void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    self.backgroundColor = _bgColor;
}

- (void)setDescriptionTxt:(NSString *)descriptionTxt{
    _descriptionTxt = descriptionTxt;
    self.descriptionLbl.text = _descriptionTxt;
}

- (void)setHalf:(BOOL)half{
    _half = half;
    if (_half == YES) {
        self.avgScoreLbl.centerx = self.width*0.72;
        self.descriptionLbl.centerx = self.width*0.72;
    }
}

#pragma mark - **************** 动画设置
NSString * viewRotationKey = @"rotationAnimation";
NSString * viewMoveKey = @"waveMoveAnimation";

- (void)addAnimateWithType:(int)type
{
    CABasicAnimation * transformRoate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    transformRoate.byValue = [NSNumber numberWithDouble:(2 * M_PI)];
    transformRoate.duration = 2;
    transformRoate.repeatCount = self.isEndless == YES ? MAXFLOAT : 2;
    [self.rotateImg.layer addAnimation:transformRoate forKey:viewRotationKey];
    
    if (type == 0) {
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            self.bigImg.top = W - ((avgScore/100.0) * W);
            if (avgScore == 100) {
                self.bigImg.top = -20;
            }
            self.bigImg.left = 0;
        }];
    }else if (type == 1){
        CGFloat avgScore = self.precent;
        self.bigImg.top = -20;
        self.bigImg.left = -5*W;
        [UIView animateWithDuration:4.0 animations:^{
            self.bigImg.top = W - ((avgScore/100.0) * W);
            if (avgScore == 100) {
                self.bigImg.top = -20;
            }
            self.bigImg.left = 0;
        }];
    }else if (type == 2){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:2.0 animations:^{
            self.bigImg.top = -20;
            self.bigImg.left = -3*W;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0 animations:^{
                self.bigImg.top = W - ((avgScore/100.0) * W);
                if (avgScore == 100) {
                    self.bigImg.top = -20;
                }
                self.bigImg.left = 0;
            }];
        }];
    }
}

-(void)dealloc{
    [self.bigImg.layer removeAnimationForKey:viewRotationKey];
    [self.bigImg.layer removeAnimationForKey:viewMoveKey];
}

@end
