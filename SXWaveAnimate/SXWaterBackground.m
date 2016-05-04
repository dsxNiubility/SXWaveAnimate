//
//  SXWaterBackground.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 16/5/1.
//  Copyright © 2016年 Sankuai. All rights reserved.
//

#import "SXWaterBackground.h"

#define www self.frame.size.width
#define mmm 4

@implementation SXWaterBackground

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        SXWaterBackgroundSub *v1 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0, -60, www/3, self.frame.size.height)];
        SXWaterBackgroundSub *v2 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0 + www/3 -1, -60, www/3, self.frame.size.height)];
        SXWaterBackgroundSub *v3 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0 + www/3*2 -2, -60, www/3, self.frame.size.height)];
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
    CGContextMoveToPoint(context2, 0, www*0.5+mmm);//设置Path的起点
    CGContextAddCurveToPoint(context2,www*(2/8.0)+mmm, www*(2.5/6.0)-mmm, www*(2/8.0)+mmm, www*(3.5/6.0)+mmm, www*(1/2.0), www*(1/2.0)+mmm);
    CGContextAddCurveToPoint(context2,www*(6/8.0)+mmm, www*(2.5/6.0)-mmm, www*(6/8.0)+mmm, www*(3.5/6.0)+mmm, www*(1), www*(1/2.0)+mmm);
    CGContextAddLineToPoint(context2, www, www);
    CGContextAddLineToPoint(context2, 0, www);
    CGContextAddLineToPoint(context2, 0, www+mmm);
    [[UIColor colorWithRed:1 green:1 blue:1 alpha:1]setFill];
    CGContextFillPath(context2);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, www*0.5);//设置Path的起点
    CGContextAddCurveToPoint(context,www*(2/8.0), www*(2.5/6.0), www*(2/8.0), www*(3.5/6.0), www*(1/2.0), www*(1/2.0));
    CGContextAddCurveToPoint(context,www*(6/8.0), www*(2.5/6.0), www*(6/8.0), www*(3.5/6.0), www*(1), www*(1/2.0));
    CGContextAddLineToPoint(context, www, www);
    CGContextAddLineToPoint(context, 0, www);
    CGContextAddLineToPoint(context, 0, www*0.5);
    [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]setFill];
    CGContextFillPath(context);
}

@end
