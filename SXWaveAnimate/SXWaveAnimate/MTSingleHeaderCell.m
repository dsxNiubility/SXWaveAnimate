//
//  MTSingleHeaderCell.m
//  iMerchant
//
//  Created by dongshangxian on 15/5/6.
//  Copyright (c) 2015年 dantesx. All rights reserved.
//

#import "MTSingleHeaderCell.h"
#import "UIViewAdditions.h"

@implementation MTSingleHeaderCell

- (void)awakeFromNib {
    // Initialization code
    _alpha = 1;
}

+ (instancetype)cell
{
//    static NSString *ID = @"SingleHeaderCell";
    
   return [[NSBundle mainBundle]loadNibNamed:@"MTSingleHeaderCell" owner:nil options:nil][0];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAlpha:(CGFloat)alpha
{
    _alpha = alpha;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
}

- (void)setPrecent:(int)precent
{
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
