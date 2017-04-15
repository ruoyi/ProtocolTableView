//
//  NSObject+ProtocolTable.m
//  ProtocolTableView
//
//  Created by 若懿 on 16/12/29.
//  Copyright © 2016年 若懿. All rights reserved.
//

#import "RYTableScene.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "UITableView+RYExtension.h"

@implementation RYTableDataManger

+ (nonnull instancetype)mangerWithHeaderData:(nullable id)headerData footerData:(nullable id)footerData cellData:(nullable NSArray *)cellData {
    RYTableDataManger *manger = [[RYTableDataManger alloc] init];
    manger.headerData = headerData;
    manger.cellData = cellData;
    manger.footerData = headerData;
    return manger;
}

@end

@interface RYTableScene ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RYTableScene

#pragma mark - Section Count

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableConfigDelegate.dataArr.count;
}

#pragma mark - Row Count In Section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RYTableDataManger *sectionManger = [self.tableConfigDelegate.dataArr objectAtIndex:section];
    return sectionManger.cellData.count;
}

#pragma mark - Table Cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self _config:tableView cell:nil atIndexPath:indexPath];
}

#pragma mark - Set Cell Data

- (UITableViewCell<TableViewContentProtocol> *)_config:(UITableView *)tableView cell:(UITableViewCell<TableViewContentProtocol> *)cell atIndexPath:(NSIndexPath *)indexPath{
    RYTableDataManger *sectionManger = [self.tableConfigDelegate.dataArr objectAtIndex:indexPath.section];
    NSObject *cellData = [sectionManger.cellData objectAtIndex:indexPath.row];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:[tableView.modelMatchCell objectForKey: NSStringFromClass([cellData class])]];
    }

    cell.delegate = self.tableConfigDelegate;
    cell.contentData = cellData;
    if ([self.tableConfigDelegate respondsToSelector:@selector(tableViewDidConfig:atIndexPath:)]) {
        [self.tableConfigDelegate tableViewDidConfig:cell atIndexPath:indexPath];
    }
    return cell;
}

#pragma mark - Cell Height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RYTableDataManger *sectionManger = [self.tableConfigDelegate.dataArr objectAtIndex:indexPath.section];
    NSObject *cellData = [sectionManger.cellData objectAtIndex:indexPath.row];
    NSString *cellClassName = [tableView.modelMatchCell objectForKey:NSStringFromClass([cellData class])];
    return [tableView fd_heightForCellWithIdentifier:cellClassName cacheByIndexPath:indexPath configuration:^(id cell) {
        [self _config:tableView cell:nil atIndexPath:indexPath];
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
    NSString *sectionClassName = [tableView.modelMatchCell objectForKey:NSStringFromClass([sectionData class])];
    Class<TableViewContentProtocol> sectionClass = NSClassFromString(sectionClassName);
    if (!sectionClass) {
        return 0.0001;
    }
    return  [sectionClass sectionHeight];
}

- (id)_getSectionDataWith:(NSInteger)section isHeader:(BOOL )isheader{
    RYTableDataManger *sectionManger = [self.tableConfigDelegate.dataArr objectAtIndex:section];
    id sectionData;
    if (isheader) {
        sectionData = sectionManger.headerData;
    }else {
        sectionData = sectionManger.footerData;
    }
    return sectionData;
}

- (UIView *)_getSectionView:(UITableView *)tableView section:(NSInteger)section isHeader:(BOOL )isheader {
    id sectionData = [self _getSectionDataWith:section isHeader:isheader];
    NSString *sectionClassName = [tableView.modelMatchCell objectForKey:NSStringFromClass([sectionData class])];
    UITableViewHeaderFooterView<TableViewContentProtocol> *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionClassName];
    view.contentData = sectionData;
    view.delegate = self.tableConfigDelegate;
    return view;
}

- (UITableView *)table {
    if (!_table) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:[self tableStyle]];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table = tableView;
    }
    return _table;
}

- (UITableViewStyle)tableStyle {
    return UITableViewStyleGrouped;
}

@end
