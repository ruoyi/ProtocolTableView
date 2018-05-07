//
//  ViewController.m
//  ProtocolTableView
//
//  Created by 若懿 on 16/12/29.
//  Copyright © 2016年 若懿. All rights reserved.
//

#import "ViewController.h"
#import "RYCelldata.h"
#import "RYTableBuilder.h"
#import "WPPlanTripStepCityCell.h"
#import "WPPlanTripStepSpotCell.h"
#import "RYTextTableCell.h"

@interface ViewController ()

@property RYTableBuilder *builder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.builder = [RYTableBuilder builderWithStyle:UITableViewStyleGrouped
                                      actionHandler:self
                                     modelMatchCell:@{NSStringFromClass(RYCelldata.class): NSStringFromClass(RYTextTableCell.class)}
                              modelMatchSectionView:@{}];
    
    [self.view addSubview:self.builder.tableView];
    self.builder.tableView.frame = self.view.bounds;
    [self.builder.dataArr addObject: [RYTableSectionModel sectionWithHeaderData:nil
                                                                     footerData:nil
                                                                       cellData: [self getItemData]]];

}

- (NSArray<RYCelldata *> *)getItemData {
    NSString *newsStr = @"This press release contains forward-looking statements, within the meaning of the Private Securities Litigation Reform Act of 1995. These forward-looking statements include without limitation those about the Company’s estimated revenue, gross margin, operating expenses, other income/(expense), tax rate, and plans for return of capital. These statements involve risks and uncertainties, and actual results may differ. Risks and uncertainties include without limitation: the effect of global and regional economic conditions on the Company's business, including effects on purchasing decisions by consumers and businesses; the ability of the Company to compete in markets that are highly competitive and subject to rapid technological change; the ability of the Company to manage frequent product introductions and transitions, including delivering to the marketplace, and stimulating customer demand for, new products, services and technological innovations on a timely basis; the effect that product introductions and transitions, changes in product pricing and product mix, and increases in component and other costs could have on the Company’s gross margin; the dependency of the Company on the performance of distributors of the Company's products, including cellular network carriers and other resellers; the inventory and other asset risks associated with the Company’s need to order, or commit to order, product components in advance of customer orders; the continued availability on acceptable terms, or at all, of certain components, services and new technologies essential to the Company's business, including components and technologies that may only be available from sole or limited sources; the dependency of the Company on manufacturing and logistics services provided by third parties, many of which are located outside of the US and which may affect the quality, quantity or cost of products manufactured or services rendered to the Company; the effect of product and service quality problems on the Company’s financial performance and reputation; the dependency of the Company on third-party intellectual property and digital content, which may not be available to the Company on commercially reasonable terms or at all; the dependency of the Company on support from third-party software developers to develop and maintain software applications and services for the Company’s products; the impact of unfavorable legal proceedings, such as a potential finding that the Company has infringed on the intellectual property rights of others; the impact of changes to laws and regulations that affect the Company’s activities, including the Company’s ability to offer products or services to customers in different regions; the ability of the Company to manage risks associated with its international activities, including complying with laws and regulations affecting the Company’s international operations; the ability of the Company to manage risks associated with the Company’s retail stores; the ability of the Company to manage risks associated with the Company’s investments in new business strategies and acquisitions; the impact on the Company's business and reputation from information technology system failures, network disruptions or losses or unauthorized access to, or release of, confidential information; the ability of the Company to comply with laws and regulations regarding data protection; the continued service and availability of key executives and employees; war, terrorism, public health issues, natural disasters, and other business interruptions that could disrupt supply or delivery of, or demand for, the Company’s products; financial risks, including risks relating to currency fluctuations, credit risks and fluctuations in the market value of the Company’s investment portfolio; and changes in tax rates and exposure to additional tax liabilities. More information on these risks and other potential factors that could affect the Company’s financial results is included in the Company’s filings with the SEC, including in the “Risk Factors” and “Management’s Discussion and Analysis of Financial Condition and Results of Operations” sections of the Company’s most recently filed periodic reports on Form 10-K and Form 10-Q and subsequent filings. The Company assumes no obligation to update any forward-looking statements or information, which speak as of their respective dates.";
    NSMutableArray * itemsArr = [[NSMutableArray alloc] init];
    for (NSString *lineStr in [newsStr componentsSeparatedByString:@"; "]) {
        RYCelldata *item = [[RYCelldata alloc]init];
        item.text = lineStr;
        [itemsArr addObject:item];
    }
    
    return itemsArr;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
