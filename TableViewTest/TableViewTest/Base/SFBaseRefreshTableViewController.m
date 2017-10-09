//
//  SFBaseRefreshTableViewController.m
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/8.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "SFBaseRefreshTableViewController.h"
#import "SFBaseTableViewCell.h"
#import <MJRefresh.h>
#import "ICUtilsMacro.h"

@interface SFBaseRefreshTableViewController ()

@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, strong) NSArray *registerCellClasses;

@end

@implementation SFBaseRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.offset = 0;
    
    self.dataSourceArr = [NSMutableArray new];
    [self.view addSubview:self.myTableView];
    
    UIView *footer = [UIView new];
    self.myTableView.tableFooterView = footer;
    
    [self setHeaderRefreshView];
    
    [self setFooterRefreshView];
    
}

- (void)setRegisterCellClasses:(NSArray *)registerCellClasses
{
    _registerCellClasses = registerCellClasses;
    
    //注册cell
    for (Class objClass in registerCellClasses) {
        if ([objClass isSubclassOfClass:[SFBaseTableViewCell class]]) {
//            [self.myTableView registerClass:objClass forCellReuseIdentifier:NSStringFromClass(objClass)];
            [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass(objClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(objClass)];
        }
    }
}

- (void)setupEstimatedRowHeight:(CGFloat)height cellClasses:(NSArray *)cellClasses
{
    self.myTableView.estimatedRowHeight = height;
    self.registerCellClasses = cellClasses;
}

- (void)setHeaderRefreshView
{
    // 下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(beginRefresh)];
//    header.lastUpdatedTimeLabel.hidden = YES;
//    header.stateLabel.hidden = YES;
    self.myTableView.mj_header = header;
    
    [self.myTableView.mj_header beginRefreshing];
}

- (void)beginRefresh
{
    WeakSelf
    [self.myTableView.mj_footer endRefreshing];
    [self getListDataSuccess:^(BOOL isNoMoreData) {
        StrongSelf
        [self.myTableView.mj_header endRefreshing];
        if (isNoMoreData) {
            //无数据
            [self.myTableView.mj_footer endRefreshingWithNoMoreData];
            //               [XJEmptyView addEmptyWithStyle:XJEmptyViewStyleCommon onView:self.view position:XJEmptyViewPositionCenter clickCallBack:nil];
        }else{
            [self.myTableView.mj_footer resetNoMoreData];
        }
        [self.myTableView reloadData];
    } failure:^(NSString *msg) {
        StrongSelf
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];
        //            [XJNetworkManager sharedInstance].isNetworkNotReachability = YES;
    } isRefresh:YES];
}

- (void)setFooterRefreshView
{
    WeakSelf
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    self.myTableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新  MJRefreshBackNormalFooter
    self.myTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        StrongSelf
        [self.myTableView.mj_header endRefreshing];
        [self getListDataSuccess:^(BOOL isNoMoreData) {
            StrongSelf
            if (isNoMoreData) {
                [self.myTableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [self.myTableView.mj_footer endRefreshing];
                [self.myTableView reloadData];
            }
        } failure:^(NSString *msg) {
            StrongSelf
            [self.myTableView.mj_header endRefreshing];
            [self.myTableView.mj_footer endRefreshing];
            //            [AZNotification showNotificationWithTitle:msg controller:self notificationType:AZNotificationTypeError];
        } isRefresh:NO];
    }];
    self.myTableView.mj_footer.automaticallyChangeAlpha = YES;
    self.myTableView.mj_footer.automaticallyHidden = YES;
    
    
}

- (UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.backgroundColor = [UIColor clearColor];
        _myTableView.estimatedRowHeight = 60;//根据需要重写
        _myTableView.rowHeight = UITableViewAutomaticDimension;
        
        //此方法TableView的分割线顶边
        if ([self.myTableView respondsToSelector:@selector(setSeparatorInset:)])
        {
            [self.myTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([self.myTableView respondsToSelector:@selector(setLayoutMargins:)])
        {
            [self.myTableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return _myTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SFBaseTableViewCell *cell;
    for (Class objClass in self.registerCellClasses) {
        if ([objClass isSubclassOfClass:[SFBaseTableViewCell class]]) {
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(objClass)];
            if (indexPath.row < self.dataSourceArr.count) {
                [cell configCellWithModel:self.dataSourceArr[indexPath.row]];
                [self configCellSubViewsCallback:cell indexPath:indexPath];
            }
        }
    }
    return cell;
}


- (void)getListDataSuccess:(void (^)(BOOL isNoMoreData))success
                   failure:(void (^)(NSString *msg))failure
                 isRefresh:(BOOL)isRefresh
{
    if (isRefresh) {
        self.offset = 0;
    }
    
    
    [self requestDataWithOffset:self.offset success:^(NSArray *dataArr) {
        //当连续调用两次刷新时,如果这里没有删除数组,会重复出现数据
        if (isRefresh) {
            @synchronized (@"isRefresh") {
                [self.dataSourceArr removeAllObjects];
            }
            
        }
        NSLog(@"====数据数量===%lu",(unsigned long)dataArr.count);

        if (!IsEmpty(dataArr)) {
            
            @synchronized (@"addObjectsFromArray") {
                [self.dataSourceArr addObjectsFromArray:dataArr];
//                self.offset = self.dataSourceArr.count;
                self.offset++;
            }
            
        }
        if (success) {
            success(IsEmpty(dataArr)?YES:NO);
        }
        
    } failure:failure];
}

- (void)configCellSubViewsCallback:(SFBaseTableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    
    
}

//数据请求
- (void)requestDataWithOffset:(NSInteger)offset
                      success:(void (^)(NSArray *dataArr))success
                      failure:(void (^)(NSString *msg))failure
{
    
}

//此方法TableView的分割线顶边
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
