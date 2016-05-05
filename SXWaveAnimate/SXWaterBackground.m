//
//  SXWaterBackground.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 16/5/1.
//  Copyright © 2016年 Sankuai. All rights reserved.
//

#import "SXWaterBackground.h"

#define kBGWidth self.frame.size.width
#define kBGHeight self.frame.size.height
#define kBGMargin (kBGWidth/38)
#define kBGTop -93

@implementation SXWaterBackground

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        SXWaterBackgroundSub *v1 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0, kBGTop, kBGWidth/3, kBGHeight)];
        SXWaterBackgroundSub *v2 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0 + kBGWidth/3 -1, kBGTop, kBGWidth/3, kBGHeight)];
        SXWaterBackgroundSub *v3 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0 + kBGWidth/3*2 -2, kBGTop, kBGWidth/3, kBGHeight)];
        [self addSubview:v1];
        [self addSubview:v2];
        [self addSubview:v3];
    }
    return self;
}

@end

@implementation SXWaterBackgroundSub

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context3 = UIGraphicsGetCurrentContext();
    CGContextAddRect(context3, self.bounds);
    [[UIColor orangeColor] set];
    CGContextFillPath(context3);
    
    CGContextRef context2 = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context2, 0, kBGWidth*0.5+kBGMargin);//设置Path的起点
    CGContextAddCurveToPoint(context2,kBGWidth*(2/8.0)+kBGMargin, kBGWidth*(2.5/6.0)-kBGMargin, kBGWidth*(2/8.0)+kBGMargin, kBGWidth*(3.5/6.0)+kBGMargin, kBGWidth*(1/2.0), kBGWidth*(1/2.0)+kBGMargin);
    CGContextAddCurveToPoint(context2,kBGWidth*(6/8.0)+kBGMargin, kBGWidth*(2.5/6.0)-kBGMargin, kBGWidth*(6/8.0)+kBGMargin, kBGWidth*(3.5/6.0)+kBGMargin, kBGWidth*(1), kBGWidth*(1/2.0)+kBGMargin);
    CGContextAddLineToPoint(context2, kBGWidth, kBGWidth);
    CGContextAddLineToPoint(context2, 0, kBGWidth);
    CGContextAddLineToPoint(context2, 0, kBGWidth+kBGMargin);
    [[UIColor colorWithRed:1 green:1 blue:1 alpha:1]setFill];
    CGContextFillPath(context2);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, kBGWidth*0.5);//设置Path的起点
    CGContextAddCurveToPoint(context,kBGWidth*(2/8.0), kBGWidth*(2.5/6.0), kBGWidth*(2/8.0), kBGWidth*(3.5/6.0), kBGWidth*(1/2.0), kBGWidth*(1/2.0));
    CGContextAddCurveToPoint(context,kBGWidth*(6/8.0), kBGWidth*(2.5/6.0), kBGWidth*(6/8.0), kBGWidth*(3.5/6.0), kBGWidth*(1), kBGWidth*(1/2.0));
    CGContextAddLineToPoint(context, kBGWidth, kBGWidth);
    CGContextAddLineToPoint(context, 0, kBGWidth);
    CGContextAddLineToPoint(context, 0, kBGWidth*0.5);
    [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]setFill];
    CGContextFillPath(context);
}

@end
