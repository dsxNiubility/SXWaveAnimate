//
//  UIColor+Separate.m
//  Wonderful
//
//  Created by dongshangxian on 15/11/1.
//  Copyright © 2015年 Sankuai. All rights reserved.
//

#import "UIColor+Separate.h"

@implementation UIColor (Separate)

- (CGColorSpaceModel) colorSpaceModel
{
    return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (NSString *) colorSpaceString
{
    switch ([self colorSpaceModel])
    {
        case kCGColorSpaceModelUnknown:
            return @"kCGColorSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome:
            return @"kCGColorSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGColorSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGColorSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGColorSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGColorSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGColorSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGColorSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (CGFloat) red
{
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    return c[0];
}

- (CGFloat) green
{
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if ([self colorSpaceModel] == kCGColorSpaceModelMonochrome) return c[0];
    return c[1];
}

- (CGFloat) blue
{
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if ([self colorSpaceModel] == kCGColorSpaceModelMonochrome) return c[0];
    return c[2];
}

- (CGFloat) alpha
{
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    return c[CGColorGetNumberOfComponents(self.CGColor)-1];
}

- (UIColor *)reverseColor
{
    float r= 1 - [self red];
    float g= 1 - [self green];
    float b= 1 - [self blue];
    float alpha= [self alpha];
    UIColor *rcolor = [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    return rcolor;
}

- (NSString *)printDetail
{
    float r= [self red];
    float g= [self green];
    float b= [self blue];
    float R= [self red] * 255;
    float G= [self green] *255;
    float B= [self blue] *255;
    float alpha= [self alpha];
    
    NSString *str = [NSString stringWithFormat:@"\nThis Color's Red:%.0f, Green:%.0f, Blue:%.0f, Alpha:%.0f\nDecimal red:%.4f green:%.4f blue:%.4f \nHexadecimal 0x%x%x%x",R,G,B,alpha,r,g,b,(int)R,(int)G,(int)B];
    NSLog(@"%@",str);
    return str;
}

- (UIColor *)up:(SXColorType)type num:(NSInteger)num
{
    float r = [self red] * 255.0;
    float g = [self green] * 255.0;
    float b = [self blue] * 255.0;
    float a = [self alpha];
    
    switch (type) {
        case 1:
            return SXRGBAColor(r+num, g, b, a);
            break;
        case 2:
            return SXRGBAColor(r, g+num, b, a);
            break;
        case 3:
            return SXRGBAColor(r, g, b+num, a);
            break;
        case 4:
            return SXRGBAColor(r, g, b, a+num/255.0);
            break;
        default:
            return self;
            break;
    }
}
- (UIColor *)down:(SXColorType)type num:(NSInteger)num
{
    float r = [self red] * 255.0;
    float g = [self green] * 255.0;
    float b = [self blue] * 255.0;
    float a = [self alpha];
    
    switch (type) {
        case 1:
            return SXRGBAColor(r-num, g, b, a);
            break;
        case 2:
            return SXRGBAColor(r, g-num, b, a);
            break;
        case 3:
            return SXRGBAColor(r, g, b-num, a);
            break;
        case 4:
            return SXRGBAColor(r, g, b, a-num/255.0);
            break;
        default:
            return self;
            break;
    }
}


@end
