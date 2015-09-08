//
//  SXHalfWaveView.h
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/28.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXHalfWaveView : UIView

- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha;

/** 参数值：0-正常 1-从高而降 2-先升再降*/
- (void)addAnimateWithType:(int)type;

@end
