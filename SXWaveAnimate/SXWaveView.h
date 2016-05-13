//
//  SXWaveView.h
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/23.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXViewAdditions.h"

@class SXWaterBackground;
@interface SXWaveView : UIView
@property (weak, nonatomic) UIView *leftView;
@property (weak, nonatomic) UIImageView *rotateImg;
@property (weak, nonatomic) UILabel *avgScoreLbl;
@property (weak, nonatomic) UILabel *descriptionLbl;
@property (nonatomic,assign) int precent;

@property (nonatomic,strong) SXWaterBackground *bigImg;
@property(nonatomic,strong)UIView *waterBackground;

@property (nonatomic,assign) CGFloat alpha;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *bgColor;
@property (nonatomic,strong) UIColor *waterColor;
@property (nonatomic,assign) int type;
@property (nonatomic,assign,getter=isEndless) BOOL endless;
@property (nonatomic,copy) NSString *descriptionTxt;
@property (nonatomic,assign) BOOL half;


- (instancetype)initWithPrecent:(int)precent;

/** 开始动画，参数值：0-正常 1-从高而降 2-先升再降*/
- (void)addAnimateWithType:(int)type;

#pragma mark -
#pragma mark 旧接口，不想加deprecated关键字让你们报警告了，可用可不用
/** 百分比+字体颜色+透明度*/
- (void)setPrecent:(int)precent textColor:(UIColor *)tcolor alpha:(CGFloat)alpha;
/** 百分比+描述+字体颜色+背景颜色+透明度+是否圆角*/
- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha clips:(BOOL)clips;

#pragma mark -
#pragma mark 新接口，建议使用
/** 百分比+描述*/
- (void)setPrecent:(int)precent description:(NSString *)description;
/** 透明度+是否切除圆角*/
- (void)setAlpha:(CGFloat)alpha clips:(BOOL)clips;
/** 颜色设置*/
- (void)setTextColor:(UIColor *)tcolor bgColor:(UIColor *)bColor waterColor:(UIColor *)wColor;

@end
