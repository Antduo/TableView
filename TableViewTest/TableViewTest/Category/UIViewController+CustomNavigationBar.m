//
//  UIViewController+CustomNavigationBar.m
//  ichezhidao
//
//  Created by figo on 16/7/27.
//  Copyright © 2016年 figo. All rights reserved.
//

#import "UIViewController+CustomNavigationBar.h"
#import "UIViewController+CustomNavigationBarItem.h"
#import "UIImage+color.h"

@implementation UIViewController (CustomNavigationBar)

-(void)reviseNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xEEBA05) size:CGSizeMake(kScreenWidth, kNavBarHeight)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
   
    NSDictionary * attriBute = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
    [self.navigationController.navigationBar setTitleTextAttributes:attriBute];
    
    [self setNavLeftItemWithImage:UIImageWithName(@"nav_btn_black_w") highlightImg:nil];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self setNeedsStatusBarAppearanceUpdate];

}
-(void)resumeNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xffffff) size:CGSizeMake(kScreenWidth, kNavBarHeight)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:UIColorFromHex(kColorLine) size:CGSizeMake(kScreenWidth, kOnePixel)]];
    
    NSDictionary * attriBute = @{NSForegroundColorAttributeName:UIColorFromHex(0x030303),NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
    [self.navigationController.navigationBar setTitleTextAttributes:attriBute];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self setNeedsStatusBarAppearanceUpdate];
}


- (void)reviseHomePageNavigationBar
{
    //    UIImage *image = [UIImage gradientColorImageFromColors:@[[UIColor blackColor],[UIColor whiteColor]] gradientType:GradientTypeTopToBottom imgSize:CGSizeMake(kScreenWidth, kNavBarHeight)];
    //    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(kScreenWidth, kNavBarHeight)] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)resumeHomePageNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(kScreenWidth, kNavBarHeight)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:UIColorFromHex(kColorLine) size:CGSizeMake(kScreenWidth, kOnePixel)]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)reviseUserNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(kScreenWidth, kNavBarHeight)] forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(kScreenWidth, kNavBarHeight)]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)resumeUserNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0x90d244) size:CGSizeMake(kScreenWidth, kNavBarHeight)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:UIColorFromHex(kColorLine) size:CGSizeMake(kScreenWidth, kOnePixel)]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self setNeedsStatusBarAppearanceUpdate];
    
}

@end
