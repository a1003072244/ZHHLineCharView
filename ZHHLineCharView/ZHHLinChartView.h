//
//  ZHHLinChartView.h
//  BluetoothTest
//
//  Created by apple on 2017/7/26.
//  Copyright © 2017年 Zhangzhongjing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kYLineColor [UIColor blackColor]
#define kXlineColor [UIColor blackColor]
#define kYlineWith 1.0
#define kXlineWith 1.0
#define kLabelTextColor [UIColor grayColor]

#define KbackColor [UIColor whiteColor]

#define kLineColor [UIColor blueColor]
#define kFillColor [UIColor colorWithRed:0.1 green:0.2 blue:0.3 alpha:0.3]  //不需要填充色 改为clearColor即可
#define kLineWith 1.0

@interface ZHHLinChartView : UIView

//YLine;//!<y轴显示的数值坐标
//XLine;//!<x轴显示的数值坐标

//YUnit;//!<y轴单位
//XUnit;//!<x轴单位




+ (ZHHLinChartView *)zhhLineCharViewWithFrame:(CGRect)frame YLine:(NSArray *)YLine XLine:(NSArray *)XLine YUnit:(NSString *)Yunit XUnit:(NSString *)Xunit points:(NSArray <NSArray<NSString *>*>*)points maxXValue:(CGFloat)maxX maxYValue:(CGFloat)maxY;


+ (ZHHLinChartView *)zhhLineCharViewWithFrame:(CGRect)frame YLine:(NSArray *)YLine XLine:(NSArray *)XLine YUnit:(NSString *)Yunit XUnit:(NSString *)Xunit maxXValue:(CGFloat)maxX maxYValue:(CGFloat)maxY;

- (void)setAllPoints:(NSArray <NSArray<NSString *>*>*)points;

- (void)addNewPoint:(NSArray<NSString *>*)newPoint;

@end
