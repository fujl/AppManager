//
//  AMLinearViewController.h
//  AppManager
//
//  Created by fujl-mac on 2017/12/19.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "AMBaseViewController.h"

/**
 * UIView 增加边距
 */
@interface UIView (AMLinearViewControllerMargin)

@property(nonatomic) CGFloat lcTopMargin; // 顶部边距
@property(nonatomic) CGFloat lcLeftMargin; // 左边距
@property(nonatomic) CGFloat lcRightMargin; // 有边距
@property(nonatomic) CGFloat lcBottomMargin; // 底边距

@end

@interface UIView (AMLinearViewControllerSize)

@property(nonatomic) CGFloat lcHeight; // 高度 默认-1，不添加约束
@property(nonatomic) CGFloat lcWidth; // 宽度 默认-1 不添加约束å

@end

/**
 * 布局对齐方式
 */
typedef NS_ENUM(NSInteger, AMLinearViewControllerGravity) {
    AMLinearViewControllerGravityStart,    //头
    AMLinearViewControllerGravityEnd,      //尾部对齐
    AMLinearViewControllerGravityCenter,   //居中
    AMLinearViewControllerGravityFit,      //充满
};

@interface AMLinearViewController : AMBaseViewController

/** 对齐方式 */
@property(nonatomic) AMLinearViewControllerGravity gravity;

@property(nonatomic, readonly) NSMutableArray<__kindof UIView *> *childViewList;

@property(nonatomic, strong) UIScrollView *scrollView;

/**
 * 获取子View
 * @param index view索引
 * @return view
 */
- (__kindof UIView *)getChildViewAtIndex:(NSUInteger)index;

- (NSUInteger)childViewCount;

- (void)removeChildViewAtIndex:(NSUInteger)index;

- (void)addChildView:(UIView *)child;

- (void)addChildView:(UIView *)child atIndex:(NSUInteger)index;

- (void)addChildViews:(NSArray<__kindof UIView *> *)views;

- (void)setChildViews:(NSArray<__kindof UIView *> *)views;

- (void)reloadViews;

@end
