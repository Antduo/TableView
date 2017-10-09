//
//  SFBaseViewController.m
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/8.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "SFBaseViewController.h"
#import "UIImage+JKColor.h"
#import "ICUtilsMacro.h"
#import "ICUIConstValueMacro.h"
#import "UIViewController+CustomNavigationBarItem.h"
#import "WRNavigationBar.h"

@interface SFBaseViewController ()

@end

@implementation SFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColorFromHex(kColorBG);

    // 设置导航栏默认的背景颜色
//    [UIColor wr_setDefaultNavBarBarTintColor:KBLUECOLOR];
    // 设置导航栏所有按钮的默认颜色
    [UIColor wr_setDefaultNavBarTintColor:[UIColor blackColor]];
    // 设置导航栏标题默认颜色
    [UIColor wr_setDefaultNavBarTitleColor:[UIColor blackColor]];
    // 统一设置状态栏样式
    [UIColor wr_setDefaultStatusBarStyle:UIStatusBarStyleDefault];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
//    [UIColor wr_setDefaultNavBarShadowImageHidden:YES];
    
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:UIImageWithName(@"left_arrow") style:UIBarButtonItemStylePlain target:self action:@selector(backItemClick)];
        
//        [self setNavLeftItemWithImage:UIImageWithName(@"left_arrow") highlightImg:nil];
    }
    if (self.tabBarController == nil && kKeyWindow.rootViewController != self.navigationController) {
//        [self setNavLeftItemWithImage:UIImageWithName(@"left_arrow") highlightImg:nil];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:UIImageWithName(@"left_arrow") style:UIBarButtonItemStylePlain target:self action:@selector(backItemClick)];
    }
    
    //防止自定义返回按钮后返回手势失效
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
}

- (void)backItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
