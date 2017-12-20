//
//  DMJson.m
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "DMJson.h"

@implementation DMJson

/** 将json对象转换为json字符串 */
+ (NSString *)getJsonStringFromObject:(id)obj {
    NSError *error = nil;
    NSData *result = [NSJSONSerialization dataWithJSONObject:obj options:kNilOptions error:&error];
    if (error != nil) return nil;
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

+ (id)getJsonObjectFormData:(NSData *)data {
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

/** 将json字符串转换为json对象 */
+ (id)getJsonObjectFormString:(NSString *)jsonStr {
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end
