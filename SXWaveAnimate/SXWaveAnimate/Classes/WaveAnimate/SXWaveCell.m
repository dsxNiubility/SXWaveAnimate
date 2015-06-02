//
//  SXWaveCell.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/6/2.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXWaveCell.h"
#import "UIViewAdditions.h"

@implementation SXWaveCell

- (void)awakeFromNib
{
    _alpha = 1;
}

+ (instancetype)cell{
    return [[NSBundle mainBundle]loadNibNamed:@"SXWaveCell" owner:nil options:nil][0];
}

- (instancetype)initWithPrecent:(int)precent{
    [self setPrecent:precent];
    self.type = 2;
    self.avgScoreLbl.text = [NSString stringWithFormat:@"%d%%",precent];
    return [[NSBundle mainBundle]loadNibNamed:@"SXWaveCell" owner:nil options:nil][0];
}

- (void)setAlpha:(CGFloat)alpha{
    _alpha = alpha;
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
}

- (void)setType:(int)type
{
    _type = type;
//    [self addAnimateWithType:self.type];
}

- (void)setPrecent:(int)precent{
    _precent = precent;
    self.avgScoreLbl.text = [NSString stringWithFormat:@"%d%%",precent];
    
    self.avgScoreLbl.textColor = self.textColor;
    self.discriptionLbl.textColor = self.textColor;
    
    self.leftView.layer.cornerRadius = 115/2.0;
    self.leftView.clipsToBounds = YES;
    UIImageView *bigImg = [[UIImageView alloc]init];
    bigImg.image = [UIImage imageNamed:@"fb_wave"];
    self.bigImg = bigImg;
    bigImg.alpha = self.alpha;
    [self.leftView addSubview:bigImg];
    bigImg.frame = CGRectMake(0, 0, 450, 300);
    
    bigImg.top = 115;
    bigImg.left = -370;
}

- (void)setPrecent:(int)precent textColor:(UIColor *)tcolor type:(int)type alpha:(CGFloat)alpha
{
    [self setAlpha:alpha];
    [self setType:type];
    [self setTextColor:tcolor];
    [self setPrecent:precent];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self addAnimateWithType:self.type];
//}

- (void)addAnimateWithType:(int)type
{
    [UIView animateWithDuration:1 animations:^{
        self.rotateImg.transform = CGAffineTransformRotate(self.rotateImg.transform, 1*M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.rotateImg.transform = CGAffineTransformRotate(self.rotateImg.transform, 1*M_PI);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                self.rotateImg.transform = CGAffineTransformRotate(self.rotateImg.transform, 1*M_PI);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1 animations:^{
                    self.rotateImg.transform = CGAffineTransformRotate(self.rotateImg.transform, 1*M_PI);
                }];
            }];
        }];
    }];
    
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
        [UIView animateWithDuration:4.0 animations:^{
            self.bigImg.top = 115 - ((avgScore/100.0) * 115);
            if (avgScore == 100) {
                self.bigImg.top = -20;
            }
            self.bigImg.left = 0;
        }];
    }else if (type == 2){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:1.0 animations:^{
            self.bigImg.top = 0;
            self.bigImg.left = -200;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3.0 animations:^{
                self.bigImg.top = 115 - ((avgScore/100.0) * 115);
                if (avgScore == 100) {
                    self.bigImg.top = -20;
                }
                self.bigImg.left = 0;
            }];
        }];
    }
}


@end