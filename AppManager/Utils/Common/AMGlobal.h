//
//  AMGlobal.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

void showToast(NSString *msg);

MBProgressHUD *showLoadingDialog();

void dismissLoadingDialog();

#pragma mark - parse Object
NSString *parseStringFromObject(id obj);
NSDictionary *parseDictionaryFromObject(id obj);
NSArray *parseArrayFromObject(id obj);
NSNumber *parseNumberFromObject(id obj);
