//
//  AMJson.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMJson : NSObject

/** 将json对象转换为json字符串 */
+ (NSString *)getJsonStringFromObject:(id)obj;

+ (id)getJsonObjectFormData:(NSData *)data;

/** 将json字符串转换为json对象 */
+ (id)getJsonObjectFormString:(NSString *)jsonStr;

@end
