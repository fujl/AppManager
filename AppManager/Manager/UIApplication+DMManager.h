//
//  UIApplication+DMManager.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/15.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppBaseManager.h"
#import "UIApplicationManagerDelegate.h"

@interface UIApplication (DMManager)

/**
 获取程序管理器，程序所有的管理器通过此方法获取实例

 @param cls 管理器class
 @return 管理器
 */
- (__kindof AppBaseManager *)getManager:(Class)cls;

/**
 获取所有的管理类

 @return 获取所有的管理类
 */
- (NSArray<__kindof AppBaseManager *> *)allManager;

/**
 控制管理器生命周期
 */
- (void)setupManager;

- (void)windowCreated;

- (void)applicationDidEnterBackground;

- (void)applicationWillEnterForeground;


/**
 添加代理

 @param managersDelegate 应用管理类
 */
- (void)addManagersDelegate:(id <UIApplicationManagerDelegate>)managersDelegate;

/**
 移除代理
 
 @param managersDelegate 应用管理类
 */
- (void)removeManagersDelegate:(id <UIApplicationManagerDelegate>)managersDelegate;

@end
