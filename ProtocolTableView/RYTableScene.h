//
//  NSObject+ProtocolTable.h
//  ProtocolTableView
//
//  Created by 若懿 on 16/12/29.
//  Copyright © 2016年 若懿. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Table Protocol

@protocol TableViewContentProtocol <NSObject>

@required

@property (nonatomic, strong, nullable) id contentData;

@property (nonatomic, weak, nullable) id delegate;

@optional
// for section view must implement protocol
+ (CGFloat )sectionHeight;

@end

@class RYTableDataManger;
@protocol TableConfigProtocol <NSObject>

@required

@property (nonatomic, nullable, copy) NSArray<RYTableDataManger *> *dataArr;

@optional

- (void)tableViewDidConfig:(nonnull UITableViewCell<TableViewContentProtocol> *)cell atIndexPath:(nonnull NSIndexPath *)indexPath;

@end

@interface RYTableDataManger : NSObject

@property (nonatomic, copy, nullable) NSArray *cellData;

@property (nonatomic, strong, nullable) id headerData;

@property (nonatomic, strong, nullable) id footerData;

+ (nonnull instancetype)mangerWithHeaderData:(nullable id)headerData footerData:(nullable id)footerData cellData:(nullable NSArray *)cellData;

@end


@interface RYTableScene: UIViewController

@property (nonatomic, strong, nullable) UITableView *table;

@property (nonatomic, weak, nullable) id<TableConfigProtocol> tableConfigDelegate;

//Subclass should to rewrite
- (UITableViewStyle)tableStyle;

@end
