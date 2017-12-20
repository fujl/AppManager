//
//  UIColor+AMDefine.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AMDefine)

+ (UIColor *)colorWithRGB:(NSUInteger)rgbValue;

+ (UIColor *)colorWithARGB:(NSUInteger)rgbValue;

+ (UIColor *)colorWithGrayColor:(NSUInteger)value;

+ (UIColor *)colorWithRGB:(NSUInteger)rgbValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
/**
 程序背景色
 */
+ (UIColor *)appBackground;

@end
