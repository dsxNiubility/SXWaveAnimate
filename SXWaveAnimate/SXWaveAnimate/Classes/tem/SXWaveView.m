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
@end
@implementation SXWaveView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIView *bgView = [[UIView alloc]initWithFrame:frame];
        bgView.backgroundColor = [UIColor grayColor];
        [self addSubview:bgView];
        bgView.top = 0;
        
        UIImageView *rotateImg = [[UIImageView alloc]initWithFrame:frame];
        rotateImg.contentMode = UIViewContentModeScaleAspectFit;
        rotateImg.image = [UIImage imageNamed:@"fb_rotation"];
        UIView * leftView = [[UIView alloc]init];

        [bgView addSubview:leftView];
        leftView.width = bgView.width - W/12.5;
        leftView.height = bgView.height - W/12.5;
        leftView.centerx = bgView.centerx;
        leftView.centery = bgView.centery;

        
//        leftView.backgroundColor = [UIColor grayColor];
        leftView.top = W/25;
        [bgView addSubview:rotateImg];
        rotateImg.top = 0;
        
        UILabel *avgScoreLbl = [[UILabel alloc]init];
        avgScoreLbl.width = W / 2;
        avgScoreLbl.height = W/4;
        avgScoreLbl.centerx = rotateImg.centerx;
        avgScoreLbl.centery = rotateImg.centery;
        avgScoreLbl.font = [UIFont systemFontOfSize:16];
        avgScoreLbl.text = @"56%";
        avgScoreLbl.textAlignment = NSTextAlignmentCenter;
        
       
        
        UILabel *descriptionLbl = [[UILabel alloc]init];
        
        descriptionLbl.font = [UIFont systemFontOfSize:14];
        descriptionLbl.text = @"总评分";
        
        [bgView addSubview:avgScoreLbl];
        [bgView addSubview:descriptionLbl];
        
        self.leftView = leftView;
        self.avgScoreLbl = avgScoreLbl;
        self.descriptionLbl = descriptionLbl;
        self.rotateImg = rotateImg;
        
        _alpha = 1;
        _endless = NO;
        UIImageView *bigImg = [[UIImageView alloc]init];
        bigImg.image = [UIImage imageNamed:@"fb_wave"];
        self.bigImg = bigImg;
        [self.leftView addSubview:bigImg];
        self.backgroundColor = [UIColor colorWithRed:42/255.0 green:178/255.0 blue:163/255.0 alpha:1];
        
        self.leftView.layer.cornerRadius = self.leftView.bounds.size.width/2.0;
        //    self.leftView.frame = self.bounds;
        self.leftView.clipsToBounds = YES;
        
        self.bigImg.frame = CGRectMake(0, 0, 6*W, 3*W);
        
        NSLog(@"%f",W);
        self.bigImg.top = W;
        self.bigImg.left = -5*W;
    
    }
    return self;
}

- (instancetype)view{
    return [[NSBundle mainBundle]loadNibNamed:@"SXWaveView" owner:nil options:nil][0];
}

+ (instancetype)view{
    return [[NSBundle mainBundle]loadNibNamed:@"SXWaveView" owner:nil options:nil][0];
}

// ------一些便利构造和赋值方法
- (instancetype)initWithPrecent:(int)precent{
    [self setPrecent:precent];
    self.type = 2;
    self.avgScoreLbl.text = [NSString stringWithFormat:@"%d%%",precent];
    return [[NSBundle mainBundle]loadNibNamed:@"SXWaveView" owner:nil options:nil][0];
}

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
- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha endless:(BOOL)endless{
    [self setAlpha:alpha];
    [self setPrecent:precent];
    [self setEndless:endless];
    
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
            self.bigImg.top = 115 - ((avgScore/100.0) * 115);
            if (avgScore == 100) {
                self.bigImg.top = -20;
            }
            self.bigImg.left = 0;
        }];
    }else if (type == 1){
        CGFloat avgScore = self.precent;
        self.bigImg.top = -20;
        self.bigImg.left = -300;
        [UIView animateWithDuration:4.0 animations:^{
            self.bigImg.top = 115 - ((avgScore/100.0) * 115);
            if (avgScore == 100) {
                self.bigImg.top = -20;
            }
            self.bigImg.left = 0;
        }];
    }else if (type == 2){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:2.0 animations:^{
            self.bigImg.top = -20;
            self.bigImg.left = -2*W;
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
