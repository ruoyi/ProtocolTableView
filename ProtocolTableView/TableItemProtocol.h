//
//  TableItemProtocol.h
//  ProtocolTableView
//
//  Created by ruoyi on 2018/4/28.
//  Copyright © 2018年 若懿. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TableItemProtocol <NSObject>

@required

@property (nonatomic, strong, nullable) id contentData;

@property (nonatomic, weak, nullable) id delegate;

@end
