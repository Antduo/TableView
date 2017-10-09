//
//  DetailTableViewCell.h
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/8.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFBaseTableViewCell.h"
#import "DetailModel.h"

@interface DetailTableViewCell : SFBaseTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

- (void)configCellWithModel:(DetailModel *)model;

@end
