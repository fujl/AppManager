//
//  UIApplicationManagerDelegate.h
//  AppFramework
//
//  Created by fujl-mac on 2017/12/15.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#ifndef UIApplicationManagerDelegate_h
#define UIApplicationManagerDelegate_h

/**
 应用程序代理
 */
@protocol UIApplicationManagerDelegate <NSObject>

@required
/**
 注册管理类

 @param managers 管理类列表
 */
- (void)registerManager:(NSMutableArray<Class> *)managers;

@end

#endif /* UIApplicationManagerDelegate_h */
