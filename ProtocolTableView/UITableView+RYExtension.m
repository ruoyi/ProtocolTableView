//
//  UITableView+RYExtension.m
//  ProtocolTableView
//
//  Created by 若懿 on 2017/1/5.
//  Copyright © 2017年 若懿. All rights reserved.
//

#import "UITableView+RYExtension.h"
#import <objc/runtime.h>

@implementation UITableView (RYExtension)

- (void)setModelMatchCell:(NSDictionary<NSString *,NSString *> *)modelMatchCell{
    objc_setAssociatedObject(self, @selector(modelMatchCell), modelMatchCell, OBJC_ASSOCIATION_COPY_NONATOMIC);
    for (NSString *cellNameStr in [self.modelMatchCell allValues]) {
        if ([NSClassFromString(cellNameStr) isSubclassOfClass:[UITableViewCell class]]) {
            [self registerClass:NSClassFromString(cellNameStr) forCellReuseIdentifier:cellNameStr];
        }else if ([NSClassFromString(cellNameStr) isSubclassOfClass:[UITableViewCell class]]) {
            [self registerClass:NSClassFromString(cellNameStr) forHeaderFooterViewReuseIdentifier:cellNameStr];
        }
    }
}

- (NSDictionary<NSString *,NSString *> *)modelMatchCell {
    return objc_getAssociatedObject(self, _cmd);
}



@end
