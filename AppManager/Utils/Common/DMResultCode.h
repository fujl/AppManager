//
//  DMResultCode.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl. All rights reserved.
//

#ifndef AMResultCode_h
#define AMResultCode_h

typedef NS_ENUM(NSInteger, DMResultCode) {
    ResultCodeOK                        = 2,                // 请求成功
    ResultCodeFailed                    = -1,               // 请求失败
    ResultCodeTimeOut                   = -2,               // 请求超时
    ResultCodeNetError                  = -3,               // 请求无网络
    ResultCodeAuthenticationFailure     = 10005,            // 鉴权失败
};

#endif /* AMResultCode_h */
