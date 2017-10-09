//
//  SFBaseRefreshTableViewController.h
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/8.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFBaseViewController.h"

@class SFBaseTableViewCell;
/**
 *  使用该类需要注意
 1.继承该类
 2.重写self.myTableView.estimatedRowHeight = ?;
 3.注册cell,--- self.registerCellClasses = @[cellclass1, cellclass2];
 4.手动触发刷新
 5.重写请求方法
 6.当cell里的子控件需要些block回调时重载configCellSubViewsCallback:(ICBaseTableViewCell *)cell indexPath:(NSIndexPath *)indexPath;
 */

@interface SFBaseRefreshTableViewController : SFBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

/**
 *  配置tableview的估算行高和注册的cell
 *
 *  @param height      估算行高
 *  @param cellClasses 注册cell,如 =@[cellclass1, cellclass2];
 */
- (void)setupEstimatedRowHeight:(CGFloat)height cellClasses:(NSArray *)cellClasses;

/**
 *  手动触发刷新
 */
- (void)beginRefresh;

/**
 *  必须重写该方法，请求列表数据
 *
 */
- (void)requestDataWithOffset:(NSInteger)offset
                      success:(void (^)(NSArray *dataArr))success
                      failure:(void (^)(NSString *msg))failure;

/**
 *  当cell里的子控件需要些block回调时重载该方法
 *
 */
- (void)configCellSubViewsCallback:(SFBaseTableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

@end
