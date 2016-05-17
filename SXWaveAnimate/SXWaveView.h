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

/*

 precent        默认值是 0.0
 alpha          默认值是 1.0
 textColor      默认值是 redColor
 bgColor        默认值是 blackColor
 waterColor     默认值是 whiteColor
 endless        默认值是 YES
 descriptionTxt 默认值是 SXWaterWave
 type           默认值是 0（正常）
 half           默认值是 NO
 updating       默认值是 NO
 
*/

@property (nonatomic,assign) CGFloat precent;
@property (nonatomic,assign) CGFloat alpha;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *bgColor;
@property (nonatomic,strong) UIColor *waterColor;
@property (nonatomic,assign,getter=isEndless) BOOL endless;
@property (nonatomic,copy) NSString *descriptionTxt;
/** 水花动画展示的方式*/
@property (nonatomic,assign) int type;
/** 如果half为yes，就是展示半圆*/
@property (nonatomic,assign) BOOL half;
/** 数字是否随着波纹变化， 只有type=0 或 1才能使用*/
@property (nonatomic,assign) BOOL updating;

/** 开始动画，参数值：0-正常 1-从高而降 2-先升再降*/
- (void)addAnimateWithType:(int)type;

#pragma mark -
#pragma mark 旧接口，不想加deprecated关键字让你们报警告了，可用可不用
/** 百分比+字体颜色+透明度*/
- (void)setPrecent:(CGFloat)precent textColor:(UIColor *)tcolor alpha:(CGFloat)alpha;
/** 百分比+描述+字体颜色+背景颜色+透明度+是否圆角*/
- (void)setPrecent:(CGFloat)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha clips:(BOOL)clips;

#pragma mark -
#pragma mark 新接口，建议使用
/** 最常用的三个属性*/
- (void)setPrecent:(CGFloat)precent description:(NSString *)description textColor:(UIColor *)tcolor;

/** 百分比+描述*/
- (void)setPrecent:(CGFloat)precent description:(NSString *)description;
/** 透明度+是否切除圆角*/
- (void)setAlpha:(CGFloat)alpha clips:(BOOL)clips endless:(BOOL)endless;
/** 颜色设置*/
- (void)setTextColor:(UIColor *)tcolor bgColor:(UIColor *)bColor waterColor:(UIColor *)wColor;

@end
