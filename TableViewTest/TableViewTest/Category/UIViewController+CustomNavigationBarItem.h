//
//  UIViewController+CustomNavigationBarItem.h
//  haid
//
//  Created by 刘 剑华 on 13-6-9.
//  Copyright (c) 2013年 figo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CustomNavigationBarItem)

// 左返回键
- (void)setNavLeftItemWithImage:(UIImage *)img highlightImg:(UIImage*)himg;

// 右键
- (void)setNavRightItemWithImage:(UIImage *)img highlightImg:(UIImage*)himg;
- (void)setNavRightItemWithImages:(NSArray *)imgs highlightImgs:(NSArray*)himgs space:(CGFloat)space;
- (void)setNavRightItemWithImages:(NSArray *)imgs selectedImgs:(NSArray*)simgs space:(CGFloat)space;
- (void)setNavRightItemWithTitle:(NSString*)title;
- (void)setNavRightItemWithTitle:(NSString*)title titleColor:(UIColor *)color;

- (void)RightBarItemClick:(UIButton*)sender;
- (void)LeftBarItemClick;
- (void)homepageClick;
- (void)BackBarItemClick;

@end
