//
//  ViewController.m
//  ProtocolTableView
//
//  Created by 若懿 on 16/12/29.
//  Copyright © 2016年 若懿. All rights reserved.
//

#import "ViewController.h"
#import "RYCelldata.h"
#import "WPPlanTripStepSpotCell.h"
#import "UITableView+RYExtension.h"

@interface ViewController ()<TableConfigProtocol>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    self.tableConfigDelegate = self;
    self.table.modelMatchCell = @{
                                  NSStringFromClass([RYCelldata class]):NSStringFromClass([WPPlanTripStepSpotCell class])
                                  };
    
    RYTableDataManger *manger = [RYTableDataManger mangerWithHeaderData:nil footerData:nil cellData:@[[RYCelldata new],[RYCelldata new],[RYCelldata new],[RYCelldata new],[RYCelldata new],[RYCelldata new],[RYCelldata new],]];
    self.dataArr = @[manger,manger,manger,manger,manger];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
