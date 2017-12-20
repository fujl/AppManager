//
//  NSString+DMFont.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DMFont)

- (CGFloat)widthOfFont:(UIFont *)font height:(CGFloat)height;

- (CGFloat)heightOfFont:(UIFont *)font width:(CGFloat)width;

@end
