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

#endif /* AppDefine_h */
