//
//  WPWPPlanTripTableViewCell.m
//  Pilgrim
//
//  Created by 王鹏 on 16/5/17.
//  Copyright © 2016年 Pilgrim. All rights reserved.
//

#import "WPPlanTripStepSpotCell.h"
#import <Masonry/Masonry.h>


@interface WPPlanTripStepSpotCell()
{
    UIView *_backView;
}
@property (strong, nonatomic) UIImageView *poiImageView;

@property (strong, nonatomic) UILabel *poiLabel;

@property (strong, nonatomic) UILabel *timeLabel;

@end

@implementation WPPlanTripStepSpotCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
//        self.contentView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupUI];
	}
	return self;
}

- (void)setupUI{
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.masksToBounds = YES;
    
    
    
	_backView = [UIView new];
	[self.contentView addSubview:_backView];
	_backView.backgroundColor = [UIColor whiteColor];

    _poiImageView = [[UIImageView alloc] init];
    _poiImageView.layer.cornerRadius = 1;
    _poiImageView.layer.masksToBounds = YES;
    [_backView addSubview:_poiImageView];
    
    _poiLabel = [[UILabel alloc] init];
    _poiLabel.textAlignment = NSTextAlignmentLeft;
//    _poiLabel.font = [UIFont smallFont];
    [_backView addSubview:_poiLabel];
    
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.textAlignment = NSTextAlignmentRight;
//    _timeLabel.font = [UIFont smallFont];
    _timeLabel.textColor = [UIColor darkGrayColor];

    [_backView addSubview:_timeLabel];
	UIImageView *rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.9Arrow2"]];

	[_backView addSubview:rightImage];
	[_backView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(4);
		make.top.mas_equalTo(self.contentView);
		make.bottom.mas_equalTo(-8);
		make.right.mas_equalTo(self.contentView);
	}];
	[rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.mas_equalTo(-8);
		make.centerY.mas_equalTo(_backView);
		make.size.mas_equalTo(CGSizeMake(6, 11));
	}];
	[_poiImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(4);
		make.top.mas_equalTo(4);
		make.bottom.mas_equalTo(-40);
		make.width.mas_equalTo(48);
		make.height.mas_equalTo(36);
	 }];


	[_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.mas_equalTo(rightImage.mas_left).offset(-4);
		make.centerY.mas_equalTo(_backView);
        
	}];
	[_poiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(_backView);
		make.left.equalTo(_poiImageView.mas_right).offset(9);
		make.right.mas_equalTo(_timeLabel.mas_left).offset(-10).priorityHigh();
	}];
//	self.backgroundColor = [UIColor wp_LightLightGrayColor];
//	[_backView jm_setCornerRadius:5 withBackgroundColor:[UIColor whiteColor]];

	_poiLabel.text = @"mas_makeConstraintsmas_makeConstraintsmas_makeConstraintsmas_makeConstraintsmas_makeConstraints";
	_timeLabel.text = @" mas_makeConstraintsmas_makeConstraintsmas_makeConstraintsmas_makeConstraintsmas_makeConstraintsmas_makeConstraints";
//	[self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
//		[self.delegate WPPlanTripTableViewCellSelect:self];
//	}]];
}




@end

