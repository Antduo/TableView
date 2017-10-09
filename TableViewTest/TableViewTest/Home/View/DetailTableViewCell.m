//
//  DetailTableViewCell.m
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/8.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ICUtilsMacro.h"

@implementation DetailTableViewCell

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
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.spu_img]];
    self.titleLab.text = model.spu_name;
}

@end
