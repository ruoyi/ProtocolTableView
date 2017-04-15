//
//  WPPlanTripTableViewCellHeader.h
//  Pilgrim
//
//  Created by 王鹏 on 16/5/13.
//  Copyright © 2016年 Pilgrim. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface WPPlanTripStepCityCell : UITableViewHeaderFooterView

@property (nonatomic, strong, nullable) id contentData;

@property (nonatomic, weak, nullable) id delegate;

@property (nonatomic, strong, readonly, nonnull) UILabel *indexLabel;

@property (nonatomic, strong, readonly, nonnull) UILabel *stopsLabel;

@property (nonatomic, strong, readonly, nonnull) UILabel *timeLabel;



@end
