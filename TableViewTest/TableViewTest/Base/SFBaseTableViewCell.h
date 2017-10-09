//
//  SFBaseTableViewCell.h
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/8.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFBaseTableViewCell : UITableViewCell
- (void)setupViews;
- (void)setupLayout;
- (void)configCellWithModel:(id)model;

@end
