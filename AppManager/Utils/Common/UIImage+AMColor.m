//
//  UIImage+AMColor.m
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "UIImage+AMColor.h"

@implementation UIImage (AMColor)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
