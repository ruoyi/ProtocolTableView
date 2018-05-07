//
//  RYTableBuilder.m
//  ProtocolTableView
//
//  Created by ruoyi on 2018/4/28.
//  Copyright © 2018年 若懿. All rights reserved.
//

#import "RYTableBuilder.h"
#import "UITableView+FDTemplateLayoutCell.h"


@implementation RYTableSectionModel

+ (nonnull instancetype)sectionWithHeaderData:(nullable id)headerData
                                   footerData:(nullable id)footerData
                                     cellData:(nullable NSArray *)cellDataArr{
    RYTableSectionModel *manger = [[RYTableSectionModel alloc] init];
    manger.headerData = headerData;
    manger.cellDataArr = cellDataArr;
    manger.footerData = headerData;
    return manger;
}

@end

@interface RYTableBuilder() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, nullable, strong) UITableView *tableView;

@property (nonatomic, nullable, weak) id actionHandler;

@property (nonatomic, assign) UITableViewStyle style;

@property (nonatomic, nullable, strong) NSDictionary<NSString *, NSString *> *matchCellDic;

@property (nonatomic, nullable, strong) NSDictionary<NSString *, NSString *> *matchSectionViewDic;

@property (nonatomic, nullable, strong) NSMutableArray<RYTableSectionModel *> *dataArr;

@end


@implementation RYTableBuilder

+ (nonnull instancetype)builderWithStyle:(UITableViewStyle)style
                    actionHandler:(id)handler
                   modelMatchCell:(NSDictionary<NSString *, NSString *> *)matchCellDic
            modelMatchSectionView:(NSDictionary<NSString *, NSString *> *)matchSectionViewDic {
    RYTableBuilder *builder = [[RYTableBuilder alloc] init];
    builder.style = style;
    builder.matchCellDic = matchCellDic;
    builder.matchSectionViewDic = matchSectionViewDic;
    builder.actionHandler = handler;
    for (NSString *key in matchCellDic) {
        [builder.tableView registerClass:NSClassFromString(matchCellDic[key]) forCellReuseIdentifier:matchCellDic[key]];
    }
    return builder;
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        NSAssert(YES, @"Cannot initialize data with this method");
//    }
//    return self;
//}

#pragma mark - Section Count

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

#pragma mark - Row Count In Section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArr objectAtIndex:section].cellDataArr.count;
}

#pragma mark - Table Cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self _config:tableView cell:nil atIndexPath:indexPath];
}

#pragma mark - Set Cell Data

- (UITableViewCell<TableItemProtocol> *)_config:(UITableView *)tableView cell:(UITableViewCell<TableItemProtocol> *)cell atIndexPath:(NSIndexPath *)indexPath{
    RYTableSectionModel *sectionManger = [self.dataArr objectAtIndex:indexPath.section];
    NSObject *cellData = [sectionManger.cellDataArr objectAtIndex:indexPath.row];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:[self.matchCellDic objectForKey: NSStringFromClass([cellData class])]];
    }
    
    cell.delegate = self.actionHandler;
    cell.contentData = cellData;
    return cell;
}

#pragma mark - Cell Height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RYTableSectionModel *sectionManger = [self.dataArr objectAtIndex:indexPath.section];
    NSObject *cellData = [sectionManger.cellDataArr objectAtIndex:indexPath.row];
    NSString *cellClassName = [self.matchCellDic objectForKey:NSStringFromClass([cellData class])];
    return [tableView fd_heightForCellWithIdentifier:cellClassName cacheByIndexPath:indexPath configuration:^(id cell) {
        [self _config:tableView cell:cell atIndexPath:indexPath];
    }];
}

#pragma mark - Section Header View

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self _getSectionView:tableView section:section isHeader:YES];
}

#pragma mark - Section Header height

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self _getSectionHeight:tableView section:section isHeader:YES];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self _getSectionView:tableView section:section isHeader:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self _getSectionHeight:tableView section:section isHeader:NO];
}

- (CGFloat)_getSectionHeight:(UITableView *)tableView section:(NSInteger)section isHeader:(BOOL )isheader {
    id sectionData = [self _getSectionDataWith:section isHeader:isheader];
    NSString *sectionClassName = [self.matchSectionViewDic objectForKey:NSStringFromClass([sectionData class])];
    
    Class<TableItemProtocol> sectionClass = NSClassFromString(sectionClassName);
    if (!sectionClass) {
        return 0.0001;
    }
    return  1;
}

- (id)_getSectionDataWith:(NSInteger)section isHeader:(BOOL )isheader{
    RYTableSectionModel *sectionManger = [self.dataArr objectAtIndex:section];
    id sectionData;
    if (isheader) {
        sectionData = sectionManger.headerData;
    }else {
        sectionData = sectionManger.footerData;
    }
    return sectionData;
}

- (UIView *)_getSectionView:(UITableView *)tableView section:(NSInteger)section isHeader:(BOOL )isheader {
    NSObject *sectionData = [self _getSectionDataWith:section isHeader:isheader];
    NSString *sectionClassName = [self.matchSectionViewDic objectForKey:NSStringFromClass([sectionData class])];
    UITableViewHeaderFooterView<TableItemProtocol> *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionClassName];
    view.contentData = sectionData;
    view.delegate = self.actionHandler;
    return view;
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.style];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray<RYTableSectionModel *> *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    
    return _dataArr;
}

@end

