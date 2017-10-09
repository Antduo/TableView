//
//  DetailsNoPicCell.m
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/9.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "DetailsNoPicCell.h"
#import "ICUtilsMacro.h"

@implementation DetailsNoPicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithModel:(DetailModel *)model
{
    if (IsEmpty(model)) {
        return;
    }
    
    self.titleLab.text = model.spu_name;
    
}

@end
