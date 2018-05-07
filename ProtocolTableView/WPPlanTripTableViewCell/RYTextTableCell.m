//
//  RYTextTableCell.m
//  ProtocolTableView
//
//  Created by ruoyi on 2018/5/2.
//  Copyright © 2018年 若懿. All rights reserved.
//

#import "RYTextTableCell.h"
#import <Masonry/Masonry.h>

@implementation RYTextTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}



- (void)setupUI{
    self.showLabel = [[UILabel alloc] init];
    self.showLabel.textAlignment = NSTextAlignmentLeft;
    self.showLabel.numberOfLines = 0;
    [self.contentView addSubview:self.showLabel];
    
    self.alertButton = [[UIButton alloc]init];
    [self.alertButton setTitle:@"弹框" forState:UIControlStateNormal];
    
    [self.alertButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [self.contentView addSubview:self.alertButton];
   
    [self.alertButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(50);
    }];
    [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(65);
    }];
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
}


- (void)setContentData:(RYCelldata *)contentData {
    _contentData = contentData;
    self.showLabel.text = contentData.text;
    [self.contentView layoutIfNeeded];
    
}

@end
