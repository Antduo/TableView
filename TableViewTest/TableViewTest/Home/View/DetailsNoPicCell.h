//
//  DetailsNoPicCell.h
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/9.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFBaseTableViewCell.h"
#import "DetailModel.h"

@interface DetailsNoPicCell : SFBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

- (void)configCellWithModel:(DetailModel *)model;

@end
