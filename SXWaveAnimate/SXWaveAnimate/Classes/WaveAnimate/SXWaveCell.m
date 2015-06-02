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

- (void)awakeFromNib {
    _alpha = 1;
}

+ (instancetype)cell{
    return [[NSBundle mainBundle]loadNibNamed:@"SXWaveCell" owner:nil options:nil][0];
}

- (void)setAlpha:(CGFloat)alpha{
    _alpha = alpha;
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
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

@end