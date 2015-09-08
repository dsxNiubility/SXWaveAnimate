//
//  SXWaveView.h
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/23.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewAdditions.h"

@interface SXWaveView : UIView
@property (weak, nonatomic) UIView *leftView;
@property (weak, nonatomic) UIImageView *rotateImg;
@property (weak, nonatomic) UILabel *avgScoreLbl;
@property (weak, nonatomic) UILabel *descriptionLbl;
@property (nonatomic,assign) int precent;

@property (nonatomic,strong) UIImageView *bigImg;

@property (nonatomic,assign) CGFloat alpha;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *bgColor;
@property (nonatomic,assign) int type;
@property (nonatomic,assign,getter=isEndless) BOOL endless;
@property (nonatomic,copy) NSString *descriptionTxt;
@property (nonatomic,assign) BOOL half;


- (instancetype)initWithPrecent:(int)precent;

/** 参数值：0-正常 1-从高而降 2-先升再降*/
- (void)addAnimateWithType:(int)type;

- (void)setPrecent:(int)precent textColor:(UIColor *)tcolor alpha:(CGFloat)alpha;

- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha clips:(BOOL)clips;


@end
