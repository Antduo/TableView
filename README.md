# TableView
封装tableView

### USED
```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    [self setupEstimatedRowHeight:44 cellClasses:@[[DetailTableViewCell class]]];
    [self beginRefresh];
    
}

- (void)requestDataWithOffset:(NSInteger)offset success:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure
{
    
    [HYBNetworking getWithUrl:[NSString stringWithFormat:@"http://app.pppcar.com/v2.1/pp/search?currentPage=%ld&pageSize=20",offset+1] refreshCache:YES success:^(id response) {
        
        NSArray *datas = [DetailModel mj_objectArrayWithKeyValuesArray:response[@"data"][@"data"][@"products"]];
        
        success(datas);
        
    } fail:^(NSError *error) {
        
    }];
    
}
```
