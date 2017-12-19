//
//  AMBaseViewController.m
//  AppManager
//
//  Created by fujl-mac on 2017/12/19.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "AMBaseViewController.h"
#import "AMNetworkManager.h"
#import "AppDefine.h"
#import "UIApplication+AMManager.h"

CGFloat itemSize = 44;

@interface AMBaseViewController ()

@end

@implementation AMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.translatesAutoresizingMaskIntoConstraints = YES;
    self.view.backgroundColor = kAppBackground;
    
    NSArray<__kindof UIViewController *> *viewControllers = self.navigationController.viewControllers;
    if(viewControllers.count > 1){
        UIViewController *lastController = [viewControllers lastObject];
        NSString *lastControllerTitle = [NSString stringWithFormat:@"%@", lastController.title];
        UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
        if(lastControllerTitle.length > 3){
            backBtn.title = NSLocalizedString(@"goback", @"返回");
        } else {
            backBtn.title = lastControllerTitle;
        }
        self.navigationItem.backBarButtonItem = backBtn;
        self.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController.navigationBar setShadowImage:[self imageWithColor:UIColorFromRGB(0xebebeb) size:CGSizeMake(SCREEN_WIDTH, 0.5f)]];
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:UIColorFromRGB(0xefefef) size:CGSizeMake(SCREEN_WIDTH, 64.0f)] forBarMetrics:UIBarMetricsDefault];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

// 判断是否有网络
- (BOOL)hasNetwork {
    AMNetworkManager *networkManager = getManager(AMNetworkManager);
    return [networkManager hasNet];
}

- (void)addNavRightItem:(SEL)selector andTitle:(NSString *)title{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)addNavLeftItem:(SEL)selector andTitle:(NSString *)title{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (UIBarButtonItem *)createItem:(SEL)selector andTitle:(NSString *)title{
    UIButton *itemBtn = [[UIButton alloc] init];
    itemBtn.frame = CGRectMake(0, 0, 30, 44);
    [itemBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [itemBtn setTitle:title forState:UIControlStateNormal];
    UIColor *color = UIColorFromRGB(0x333333);
    [itemBtn setTitleColor:color forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    return item;
}

- (void)addNavBackItemAndLetfItems:(SEL)selector andTitle:(NSArray *)titleArr{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    UIBarButtonItem *backItem = [self createBackItemBtn:selector];
    backItem.tag = 1;
    [arr addObject:backItem];
    
    NSInteger tag = 2;
    for (NSString *title in titleArr) {
        UIBarButtonItem *item = [self createItem:selector andTitle:title];
        item.tag = tag++;
        [arr addObject:item];
    }
    self.navigationItem.leftBarButtonItems = arr;
}

- (void)addNavBackItemAndLetfItems:(SEL)selector andImageArr:(NSArray *)imageArr{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    UIBarButtonItem *backItem = [self createBackItemBtn:selector];
    [arr addObject:backItem];
    
    NSInteger tag = 2;
    for (NSString *imageName in imageArr) {
        UIBarButtonItem *item = [self createItemBtn:selector image:imageName andTag:tag++ edg:UIEdgeInsetsZero];
        [arr addObject:item];
    }
    self.navigationItem.leftBarButtonItems = arr;
    
}

- (UIBarButtonItem *)createItemBtn:(SEL)selector image:(NSString *)imageName andTag:(NSInteger )tag edg:(UIEdgeInsets )edg{
    UIButton *itemBtn = [[UIButton alloc] init];
    itemBtn.imageView.contentMode = UIViewContentModeCenter;
    [itemBtn setImageEdgeInsets:edg];
    UIImage *itemImg = [UIImage imageNamed:imageName];
    [itemBtn setImage:itemImg forState:UIControlStateNormal];
    itemBtn.frame = CGRectMake(0, 0, 20, itemSize);
    itemBtn.tag = tag;
    [itemBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    return backItem;
}

- (void)addNavBackItem:(SEL)selector{
    self.navigationItem.leftBarButtonItem = [self createBackItemBtn:selector];
}

- (UIBarButtonItem *)createBackItemBtn:(SEL)selector {
    return [self createItemBtn:selector image:@"GoBack" andTag:1 edg:UIEdgeInsetsMake(0, 0, 0, 5)];
}

@end