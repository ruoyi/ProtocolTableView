//
//  RYTableBuilder.h
//  ProtocolTableView
//
//  Created by ruoyi on 2018/4/28.
//  Copyright © 2018年 若懿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableItemProtocol.h"

@interface RYTableSectionModel : NSObject

@property (nonatomic, copy, nullable) NSArray *cellDataArr;

@property (nonatomic, strong, nullable) id headerData;

@property (nonatomic, strong, nullable) id footerData;

+ (nonnull instancetype)sectionWithHeaderData:(nullable id)headerData
                                  footerData:(nullable id)footerData
                                    cellData:(nullable NSArray *)cellDataArr;
@end


@interface RYTableBuilder : NSObject

@property (nonatomic, nullable, readonly, strong) UITableView *tableView;

@property (nonatomic, nullable, readonly, strong) NSMutableArray<RYTableSectionModel *> *dataArr;

+ (nonnull instancetype)builderWithStyle:(UITableViewStyle)style
                    actionHandler:(id)handler
                   modelMatchCell:(NSDictionary<NSString *, NSString *> *)matchCellDic
            modelMatchSectionView:(NSDictionary<NSString *, NSString *> *)matchSectionViewDic;


@end
