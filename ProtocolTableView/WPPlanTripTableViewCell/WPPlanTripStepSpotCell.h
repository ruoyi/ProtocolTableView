 //
//  WPWPPlanTripTableViewCell.h
//  Pilgrim
//
//  Created by 王鹏 on 16/5/17.
//  Copyright © 2016年 Pilgrim. All rights reserved.
//

#import <UIKit/UIKit.h>



@class WPPlanTripStepSpotCell;

@protocol WPPlanTripTableViewCellDelegate <NSObject>

- (void)WPPlanTripTableViewCellSelect:(nullable WPPlanTripStepSpotCell *)planTripHeader;

@end


@interface WPPlanTripStepSpotCell : UITableViewCell

@property (nonatomic, weak, nullable) id<WPPlanTripTableViewCellDelegate> delegate;

@property (nonatomic, strong, nullable) id contentData;

@end
