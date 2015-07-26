//
//  SXWaveView.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/23.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXWaveView.h"

@implementation SXWaveView

- (void)awakeFromNib
{
    _alpha = 1;
    _endless = NO;
    
    self.leftView.layer.cornerRadius = self.leftView.bounds.size.width/2.0;
    self.leftView.frame = self.bounds;
    self.leftView.clipsToBounds = YES;
    UIImageView *bigImg = [[UIImageView alloc]init];
    bigImg.image = [UIImage imageNamed:@"fb_wave"];
    self.bigImg = bigImg;
    [self.leftView addSubview:bigImg];
    bigImg.frame = CGRectMake(0, 0, 450, 300);

    bigImg.top = 115;
    bigImg.left = -370;
    
    self.backgroundColor = [UIColor colorWithRed:42/255.0 green:178/255.0 blue:163/255.0 alpha:1];
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
    self.discriptionLbl.textColor = _textColor;
}

- (void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    self.backgroundColor = _bgColor;
}

- (void)setDescriptionTxt:(NSString *)descriptionTxt{
    _descriptionTxt = descriptionTxt;
    self.discriptionLbl.text = _descriptionTxt;
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
    
    __weak __typeof(&*self)weakSelf = self;
    void(^acallBack)(CGFloat start) = ^(CGFloat start) {
        CAKeyframeAnimation * moveAction = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        moveAction.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:-60],[NSNumber numberWithFloat:start],nil];
        moveAction.duration = 4;
        // moveAction.autoreverses = YES;
        moveAction.repeatCount = MAXFLOAT;
        [weakSelf.bigImg.layer addAnimation:moveAction forKey:viewMoveKey];
    };
    
    if (type == 0) {
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            self.bigImg.top = 115 - ((avgScore/100.0) * 115);
            if (avgScore == 100) {
                self.bigImg.top = -20;
            }
            self.bigImg.left = 0;
        } completion:^(BOOL finished) {
            if (self.endless == YES) {
                acallBack(self.bigImg.layer.position.x);
            }
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
        }completion:^(BOOL finished) {
            if (self.endless == YES) {
                acallBack(self.bigImg.layer.position.x);
            }
        }];
    }else if (type == 2){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:1.5 animations:^{
            self.bigImg.top = -20;
            self.bigImg.left = -200;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0 animations:^{
                self.bigImg.top = 115 - ((avgScore/100.0) * 115);
                if (avgScore == 100) {
                    self.bigImg.top = -20;
                }
                self.bigImg.left = 0;
            } completion:^(BOOL finished) {
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
