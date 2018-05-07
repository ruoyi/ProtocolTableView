//
//  RYTextTableCell.h
//  ProtocolTableView
//
//  Created by ruoyi on 2018/5/2.
//  Copyright © 2018年 若懿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableItemProtocol.h"
#import "RYCelldata.h"


@interface RYTextTableCell : UITableViewCell<TableItemProtocol>

@property (nonatomic, strong, nullable) RYCelldata *contentData;

@property (nonatomic, weak, nullable) id delegate;

@property (nonatomic, strong, nullable) UILabel *showLabel;

@property (nonatomic, strong, nullable) UIButton *alertButton;

@end
