//
//  NSString+DMFont.m
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "NSString+DMFont.h"

@implementation NSString (AMFont)

//获取字符串的宽度
- (CGFloat)widthOfFont:(UIFont *)font height:(CGFloat)height {
    CGRect bounds;
    NSDictionary *parameterDict = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    bounds = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:parameterDict context:nil];
    return bounds.size.width;
}

//获取字符串的高度
- (CGFloat)heightOfFont:(UIFont *)font width:(CGFloat)width
{
    if (self.length == 0) {
        return 0;
    }
    CGRect bounds;
    NSDictionary * parameterDict=[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    bounds = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:parameterDict context:nil];
    return bounds.size.height;
}

@end
