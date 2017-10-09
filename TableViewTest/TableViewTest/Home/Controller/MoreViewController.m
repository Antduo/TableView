//
//  MoreViewController.m
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/9.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "MoreViewController.h"
#import "DetailTableViewCell.h"
#import "DetailsNoPicCell.h"
#import "HYBNetworking.h"
#import "MJExtension.h"
#import "DetailModel.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupEstimatedRowHeight:44 cellClasses:@[[DetailTableViewCell class],[DetailsNoPicCell class]]];
    
    
    [self beginRefresh];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row%2 == 1){
        
        DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailTableViewCell"];
        [cell configCellWithModel:self.dataSourceArr[indexPath.row]];
        
        return cell;
    }
    
    DetailsNoPicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailsNoPicCell"];
    [cell configCellWithModel:self.dataSourceArr[indexPath.row]];
    
    return cell;
}

- (void)requestDataWithOffset:(NSInteger)offset success:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure
{
    
    [HYBNetworking getWithUrl:[NSString stringWithFormat:@"http://app.pppcar.com/v2.1/pp/search?currentPage=%ld&pageSize=20",offset+1] refreshCache:YES success:^(id response) {
        
        NSArray *datas = [DetailModel mj_objectArrayWithKeyValuesArray:response[@"data"][@"data"][@"products"]];
        
        success(datas);
        
    } fail:^(NSError *error) {
        
    }];
    
}

@end
