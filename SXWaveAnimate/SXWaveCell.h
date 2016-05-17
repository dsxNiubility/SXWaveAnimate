//
//  SXWaveCell.h
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/6/2.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXViewAdditions.h"

@interface SXWaveCell : UITableViewCell

@property(nonatomic,assign)int precent;

@property(nonatomic,strong)UIImageView *bigImg;

@property(nonatomic,assign)CGFloat alpha;

@property(nonatomic,strong)UIColor *textColor;

@property(nonatomic,assign)int type;

@property(nonatomic,assign,getter=isEndless)BOOL endless;

+ (instancetype)cell;

- (void)addAnimateWithType:(int)type;

- (void)setPrecent:(int)precent textColor:(UIColor *)tcolor type:(int)type alpha:(CGFloat)alpha;

@end

