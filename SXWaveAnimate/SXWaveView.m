//
//  SXWaveView.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/23.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXWaveView.h"
#import "SXWaterBackground.h"

#define W self.bounds.size.width
#define kBigImgTopMargin -20
#define kWaterAnimateDuration 4.0

@interface SXWaveView ()

@property (nonatomic,strong) SXWaterBackground *bigImg;
@property(nonatomic,assign)CGRect rect;
@property(nonatomic,assign)BOOL clips;
@property (weak, nonatomic) UIView *leftView;
@property (weak, nonatomic) UIImageView *rotateImg;
@property (weak, nonatomic) UILabel *avgScoreLbl;
@property (weak, nonatomic) UILabel *descriptionLbl;
@property(nonatomic,strong)UIView *waterBackground;

@end
@implementation SXWaveView

#pragma mark -
#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        NSLog(@"%f",frame.size.width);
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

        self.bigImg  = [[SXWaterBackground alloc]initWithFrame:CGRectMake(-5*W, W, 6*W, 3*W)];
        [self.leftView addSubview:self.bigImg];
        
        self.backgroundColor = [UIColor colorWithRed:42/255.0 green:178/255.0 blue:163/255.0 alpha:1];
        self.leftView.layer.cornerRadius = self.leftView.bounds.size.width/2.0;
        self.leftView.clipsToBounds = YES;
        
        self.alpha = 1.0;
        self.endless = NO;
        self.bgColor = [UIColor blackColor];
        self.waterColor = [UIColor whiteColor];
        self.textColor = [UIColor redColor];
        self.type = 0;
        self.endless = NO;
        self.descriptionTxt = @"SXWaterWave";
        self.precent = 0;
    }
    return self;
}

#pragma mark -
#pragma mark 赋值方法
- (void)setPrecent:(int)precent description:(NSString *)description
{
    [self setPrecent:precent];
    if (description) {
        [self setDescriptionTxt:description];
    }
}

- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor{
    [self setPrecent:precent description:description];
    [self setTextColor:tcolor];
}

- (void)setAlpha:(CGFloat)alpha clips:(BOOL)clips endless:(BOOL)endless{
    [self setAlpha:alpha];
    [self setClips:clips];
    [self setEndless:endless];
}

- (void)setTextColor:(UIColor *)tcolor bgColor:(UIColor *)bColor waterColor:(UIColor *)wColor{
    if (tcolor) {
        [self setTextColor:tcolor];
    }
    if (bColor) {
        [self setBgColor:bColor];
    }
    if (wColor) {
        [self setWaterColor:wColor];
    }
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

- (void)setWaterColor:(UIColor *)waterColor
{
    _waterColor = waterColor;
    self.bigImg.waterColor = waterColor;
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.avgScoreLbl.textColor = _textColor;
    self.descriptionLbl.textColor = _textColor;
}

- (void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    self.backgroundColor = _bgColor;
    self.bigImg.bgColor = bgColor;
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

#pragma mark -
#pragma mark 动画设置
NSString * viewRotationKey = @"rotationAnimation";
NSString * viewMoveKey = @"waveMoveAnimation";

- (void)addAnimateWithType:(int)type
{
    CABasicAnimation * transformRoate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    transformRoate.byValue = [NSNumber numberWithDouble:(2 * M_PI)];
    transformRoate.duration = kWaterAnimateDuration/2;
    transformRoate.repeatCount = self.isEndless == YES ? MAXFLOAT : 2;
    [self.rotateImg.layer addAnimation:transformRoate forKey:viewRotationKey];
    
    __weak __typeof(&*self)weakSelf = self;
    void(^acallBack)(CGFloat start) = ^(CGFloat start) {
        CAKeyframeAnimation * moveAction = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        moveAction.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:-weakSelf.frame.size.width],[NSNumber numberWithFloat:start],nil];
        moveAction.duration = 4;
        // moveAction.autoreverses = YES;
        moveAction.repeatCount = MAXFLOAT;
        [weakSelf.bigImg.layer addAnimation:moveAction forKey:viewMoveKey];
    };
    

    CGFloat avgScore = self.precent;
    if (type == 0) {
        
        [UIView animateWithDuration:kWaterAnimateDuration animations:^{
            self.bigImg.top = W - ((avgScore/100.0) * W);
            if (avgScore == 100) {
                self.bigImg.top = kBigImgTopMargin;
            }
            self.bigImg.left = 0;
        } completion:^(BOOL finished) {
            if (self.endless == YES) {
                acallBack(self.bigImg.layer.position.x);
            }
        }];
    }else if (type == 1){
        
        self.bigImg.top = kBigImgTopMargin;
        self.bigImg.left = -5*W;
        [UIView animateWithDuration:kWaterAnimateDuration animations:^{
            self.bigImg.top = W - ((avgScore/100.0) * W);
            if (avgScore == 100) {
                self.bigImg.top = kBigImgTopMargin;
            }
            self.bigImg.left = 0;
        }completion:^(BOOL finished) {
            if (self.endless == YES) {
                acallBack(self.bigImg.layer.position.x);
            }
        }];
    }else if (type == 2){
        
        [UIView animateWithDuration:kWaterAnimateDuration/2 animations:^{
            self.bigImg.top = kBigImgTopMargin;
            self.bigImg.left = -3*W;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:kWaterAnimateDuration/2 animations:^{
                self.bigImg.top = W - ((avgScore/100.0) * W);
                if (avgScore == 100) {
                    self.bigImg.top = kBigImgTopMargin;
                }
                self.bigImg.left = 0;
            }completion:^(BOOL finished) {
                if (self.endless == YES) {
                    acallBack(self.bigImg.layer.position.x);
                }
            }];
        }];
    }
}

-(void)dealloc{
    [self.bigImg.layer removeAnimationForKey:viewRotationKey];
    [self.bigImg.layer removeAnimationForKey:viewMoveKey];
}

@end
