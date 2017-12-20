//
//  AppBaseManager.m
//  AppManager
//
//  Created by fujl-mac on 2017/12/15.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "AppBaseManager.h"
#import <UIKit/UIKit.h>
#import "UIApplication+DMManager.h"

static NSMutableSet *baseManagerInstanceMark;

@implementation AppBaseManager

- (instancetype)init {
    self = [super init];
    if (self) {
        if (!baseManagerInstanceMark) {
            baseManagerInstanceMark = [[NSMutableSet alloc] init];
        }
        
        NSString *claseName = NSStringFromClass([self class]);
        if ([baseManagerInstanceMark containsObject:claseName]) {
            @throw [NSException exceptionWithName:NSGenericException reason:@"管理器已经初始化，请调用getManager获取实例" userInfo:nil];
        } else {
            [baseManagerInstanceMark addObject:claseName];
        }
    }
    return self;
}

- (void)allManagerCreated {
    
}

- (void)windowCreated {
    
}

- (void)applicationDidEnterBackground {
    
}

- (void)applicationWillEnterForeground {
    
}

- (__kindof AppBaseManager *)getManager:(Class)cls {
    return getManager(cls);
}

@end
