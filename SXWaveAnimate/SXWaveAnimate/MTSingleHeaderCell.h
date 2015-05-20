//
//  MTSingleHeaderCell.h
//  iMerchant
//
//  Created by dongshangxian on 15/5/6.
//  Copyright (c) 2015年 dantesx. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark - **************** 单门店首页的顶部Cell

@interface MTSingleHeaderCell : UITableViewCell

@property(nonatomic,assign)int precent;

+ (instancetype)cell;

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIImageView *rotateImg;
@property (weak, nonatomic) IBOutlet UILabel *avgScoreLbl;

@property(nonatomic,strong)UIImageView *bigImg;

@property(nonatomic,assign)CGFloat alpha;

@end
