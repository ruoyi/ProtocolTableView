//
//  WPPlanTripTableViewCellHeader.m
//  Pilgrim
//
//  Created by 王鹏 on 16/5/13.
//  Copyright © 2016年 Pilgrim. All rights reserved.
//

#import "WPPlanTripStepCityCell.h"
#import <Masonry/Masonry.h>


@interface WPPlanTripStepCityCell () {
	UIButton *_backView;
	UIButton *stateBtn;
}

@end

@implementation WPPlanTripStepCityCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//		self.selectionStyle = UITableViewCellSelectionStyleNone;
//        [self setupUI];
//    }
//    return self;
//
//}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupUI];
	}
	return self;
}

- (void)setupUI{
//    self.contentView.backgroundColor = [UIColor whiteColor];
	_backView = [UIButton new];
	_backView.backgroundColor = [UIColor whiteColor];
	[self addSubview:_backView];
    _indexLabel = [[UILabel alloc] init];
    _indexLabel.textColor = [UIColor redColor];
//    _indexLabel.font = WPFONTREALSIZE(30);
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.text = @"";

    [_backView addSubview:_indexLabel];
    
    _stopsLabel = [[UILabel alloc] init];
    _stopsLabel.textColor = [UIColor blackColor];
    _stopsLabel.text = @"Florence";
//	_stopsLabel.font = WPFONTREALSIZE(30);
    _stopsLabel.textAlignment = NSTextAlignmentLeft;

    [_backView addSubview:_stopsLabel];

    _timeLabel = [[UILabel alloc] init];
//	_timeLabel.font = WPFONTREALSIZE(30);
    _indexLabel.textColor = [UIColor redColor];

    _timeLabel.textAlignment = NSTextAlignmentRight;
    _timeLabel.text = @"14-15 Oct,2016";

    [_backView addSubview:_timeLabel];
//	self.contentView.backgroundColor = [UIColor wp_LightLightGrayColor];

	stateBtn = [UIButton new];
	[stateBtn setImage:[UIImage imageNamed:@"1.9Arrowdown"] forState:UIControlStateNormal];
	[stateBtn setImage:[UIImage imageNamed:@"1.9Arrowup"] forState:UIControlStateSelected];
//	[stateBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(UIButton* sender) {
//		_cellData.isSelect = !_cellData.isSelect;
//		sender.selected = _cellData.isSelect;
//
//		[self.delegate planTripTableViewCellHeaderDidClickTitleButton:self];
//	}];
	[_backView addSubview:stateBtn];

	[_backView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.top.right.mas_equalTo(self.contentView);
		make.bottom.mas_equalTo(-10);
		make.height.mas_equalTo(50).priorityMedium();
	}];

	[_indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(_backView);
		make.left.mas_equalTo(3);
		make.width.mas_equalTo(40);
	}];

	[_stopsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(_indexLabel.mas_right).offset(0);
		make.centerY.equalTo(_backView);
        make.right.mas_equalTo(_timeLabel.mas_right).offset(-5);
	}];

	[stateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(_backView.mas_right).offset(-8);
		make.centerY.equalTo(_backView);
		make.size.mas_equalTo(CGSizeMake(11 , 6));
	}];

	[_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(stateBtn.mas_left).offset(-4);
		make.centerY.equalTo(_backView);
	}];
	self.backgroundColor = [UIColor clearColor];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//	[super setSelected:selected animated:animated];
//	if (selected) {
//		if ([self.delegate respondsToSelector:@selector(planTripTableViewCellHeaderDidClickTitleButton:)]) {
//			[self.delegate planTripTableViewCellHeaderDidClickTitleButton:self];
//		}
//	}

}




@end
