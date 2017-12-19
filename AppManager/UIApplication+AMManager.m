//
//  UIApplication+AMManager.m
//  AppFramework
//
//  Created by fujl-mac on 2017/12/15.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "UIApplication+AMManager.h"
#import "AMNetworkManager.h"

static NSMutableArray<__kindof AppBaseManager *> *managers;
static AMWeakReferencesArray *manageDelegates;// 管理类代理

@implementation UIApplication (AMManager)

- (__kindof AppBaseManager *)getManager:(Class)cls {
    NSAssert([NSThread currentThread] == [NSThread mainThread], @"请在UI线程获取管理类！");
    AppBaseManager *result = nil;
    for (AppBaseManager *manager in managers) {
        if ([manager class] == cls) {
            result = manager;
            break;
        }
    }
    NSAssert(result != nil, @"管理类未初始化，请在registerManager方法中注册！");
    return result;
}

- (NSArray<__kindof AppBaseManager *> *)allManager {
    NSAssertMainThread;
    return managers;
}

- (void)setupManager {
    NSAssert(managers == nil, @"管理器已初始化！");
    
    managers = [NSMutableArray array];
    
    NSMutableArray<Class> *managerClass = [[NSMutableArray alloc] init];
    [self registerManager:managerClass];
    
    for (Class cls in managerClass) {
        AppBaseManager *manager = [[cls alloc] init];
        [managers addObject:manager];
    }
    
    // 通知 所有的管理类创建完成
    for (AppBaseManager *manager in managers) {
        [manager allManagerCreated];
    }
}

- (void)windowCreated {
    NSAssertMainThread;
    
    for (AppBaseManager *manager in managers) {
        [manager windowCreated];
    }
}

- (void)applicationDidEnterBackground {
    NSAssertMainThread;
    
    for (AppBaseManager *manager in managers) {
        [manager applicationDidEnterBackground];
    }
}

- (void)applicationWillEnterForeground {
    NSAssertMainThread;
    
    for (AppBaseManager *manager in managers) {
        [manager applicationWillEnterForeground];
    }
}

// 注册管理类
- (void)registerManager:(NSMutableArray<Class> *)list {
    // 注册公共管理类
    [self registerCommonManager:list];
    for(id <UIApplicationManagerDelegate> managerDelegate in manageDelegates.allObjects){
        if([managerDelegate respondsToSelector:@selector(registerManager:)]){
            [managerDelegate registerManager:list];
        }
    }
}

/**
 注册公共管理类

 @param list 管理类列表
 */
- (void)registerCommonManager:(NSMutableArray<Class> *)list {
    [list addObject:[AMNetworkManager class]]; // 注册网络管理类
}

- (void)addManagersDelegate:(id <UIApplicationManagerDelegate>)managersDelegate {
    if (!manageDelegates) {
        manageDelegates = [[AMWeakReferencesArray alloc] init];
    }
    [manageDelegates addObject:managersDelegate];
}

- (void)removeManagersDelegate:(id <UIApplicationManagerDelegate>)managersDelegate {
    [manageDelegates removeObject:managersDelegate];
}

@end
