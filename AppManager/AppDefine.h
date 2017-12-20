//
//  AppDefine.h
//  AppFramework
//
//  Created by fujl-mac on 2017/12/15.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#ifndef AppDefine_h
#define AppDefine_h

// UI线程断言
#define NSAssertMainThread NSAssert([NSThread currentThread] == [NSThread mainThread], @"请在UI线程调用方法！")

// 获取程序Manager
#define getManager(arg) [[UIApplication sharedApplication] getManager:[arg class]]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define kAppBackground UIColorFromRGB(0xF2F2F2)

//定义屏幕获取屏幕宽高
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define AppWindow [UIApplication sharedApplication].delegate.window
#define AppRootViewController AppWindow.rootViewController

#endif /* AppDefine_h */
