//
//  DMGlobal.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/20.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import <Foundation/Foundation.h>

void showToast(NSString *msg);

void showLoadingDialog(void);

void dismissLoadingDialog(void);

#pragma mark - parse Object
NSString *parseStringFromObject(id obj);
NSDictionary *parseDictionaryFromObject(id obj);
NSArray *parseArrayFromObject(id obj);
NSNumber *parseNumberFromObject(id obj);
