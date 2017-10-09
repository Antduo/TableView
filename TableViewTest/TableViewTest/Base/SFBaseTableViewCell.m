//
//  SFBaseTableViewCell.m
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/8.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "SFBaseTableViewCell.h"

@implementation SFBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self setupViews];
        [self setupLayout];
    }
    return self;
}

- (void)setupViews
{
    
}

- (void)setupLayout
{
    
}

- (void)configCellWithModel:(id)model
{
    
}


@end
