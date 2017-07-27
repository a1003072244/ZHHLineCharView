//
//  ViewController.m
//  ZHHLineCharView
//
//  Created by apple on 2017/7/27.
//  Copyright © 2017年 ZhangHaohao. All rights reserved.
//

#import "ViewController.h"
#import "ZHHLinChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:[ZHHLinChartView zhhLineCharViewWithFrame:CGRectMake(50, 100, 250, 200) YLine:@[@"100",@"200", @"300",@"400",@"500"] XLine:@[@"周一", @"周二", @"周三"] YUnit:@"ml" XUnit:@"" points:@[@[@"12", @"76"],@[@"67", @"100"],@[@"80", @"300"],@[@"165", @"530"],@[@"180", @"11"],@[@"210", @"389"],@[@"211", @"421"],@[@"268", @"321"],@[@"300", @"123"],@[@"333", @"456"],@[@"360", @"434"]] maxXValue:365.0 maxYValue:600.0]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
