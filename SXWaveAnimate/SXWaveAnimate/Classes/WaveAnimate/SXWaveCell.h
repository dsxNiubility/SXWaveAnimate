//
//  SXWaveCell.h
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/6/2.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXWaveCell : UITableViewCell

@property(nonatomic,assign)int precent;

+ (instancetype)cell;

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIImageView *rotateImg;
@property (weak, nonatomic) IBOutlet UILabel *avgScoreLbl;
@property (weak, nonatomic) IBOutlet UILabel *discriptionLbl;

@property(nonatomic,strong)UIImageView *bigImg;

@property(nonatomic,assign)CGFloat alpha;

@property(nonatomic,strong)UIColor *textColor;

@end

