//
//  MTSingleHeaderCell.m
//  iMerchant
//
//  Created by dongshangxian on 15/5/6.
//  Copyright (c) 2015年 dantesx. All rights reserved.
//

#import "MTSingleHeaderCell.h"

@implementation MTSingleHeaderCell

- (void)awakeFromNib {
    // Initialization code
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





@end
