//
//  ZHHLinChartView.m
//  BluetoothTest
//
//  Created by apple on 2017/7/26.
//  Copyright © 2017年 Zhangzhongjing. All rights reserved.
//

#import "ZHHLinChartView.h"

@interface ZHHLinChartView()

@property (nonatomic, strong)UIBezierPath *path;//!<
@property (nonatomic, strong)CAShapeLayer *shapelayer;//!<

@property (nonatomic, assign)CGFloat Xscale;//!<
@property (nonatomic, assign)CGFloat Yscale;//!<

@end

static NSInteger YlabelWidth = 30;
static NSInteger YlabelHeight = 8;
static NSInteger YlabelLineSpace = 2;
static NSInteger XlabelLineSpace = 4;


@implementation ZHHLinChartView

+ (ZHHLinChartView *)zhhLineCharViewWithFrame:(CGRect)frame YLine:(NSArray *)YLine XLine:(NSArray *)XLine YUnit:(NSString *)Yunit XUnit:(NSString *)Xunit points:(NSArray <NSArray<NSString *>*>*)points maxXValue:(CGFloat)maxX maxYValue:(CGFloat)maxY {
    ZHHLinChartView *lineChartView = [ZHHLinChartView zhhLineCharViewWithFrame:frame YLine:YLine XLine:XLine YUnit:Yunit XUnit:Xunit maxXValue:maxX maxYValue:maxY];
    [lineChartView setAllPoints:points];
    
    
    return lineChartView;
}


+ (ZHHLinChartView *)zhhLineCharViewWithFrame:(CGRect)frame YLine:(NSArray *)YLine XLine:(NSArray *)XLine YUnit:(NSString *)Yunit XUnit:(NSString *)Xunit maxXValue:(CGFloat)maxX maxYValue:(CGFloat)maxY{
    ZHHLinChartView *lineCharView = [ZHHLinChartView new];
    lineCharView.frame = frame;
    lineCharView.backgroundColor = KbackColor;
    
    lineCharView.path = [UIBezierPath bezierPath];
    lineCharView.shapelayer = [CAShapeLayer layer];
    lineCharView.shapelayer.strokeColor = kLineColor.CGColor;
    lineCharView.shapelayer.fillColor = kFillColor.CGColor;
    lineCharView.shapelayer.lineWidth = kLineWith;
    [lineCharView.layer addSublayer:lineCharView.shapelayer];
    
    lineCharView.Xscale = (frame.size.width - YlabelWidth)/maxX;
    lineCharView.Yscale = (frame.size.height - YlabelHeight)/maxY;
    
    //坐标系及文字显示
    CGFloat XlabelHeight = YlabelHeight;
    UIFont  *Xfont = [UIFont systemFontOfSize:XlabelHeight];
    UIFont  *Yfont = [UIFont systemFontOfSize:YlabelHeight];
    CGFloat XLabelSpace = (frame.size.width-15)/(XLine.count+1);
    CGFloat YLabelSpace = (frame.size.height-XlabelHeight)/(YLine.count+1);
    
    UIView *xView = [[UIView alloc] initWithFrame:CGRectMake(YlabelWidth, frame.size.height-XlabelHeight, frame.size.width-YlabelWidth, kXlineWith)];
    xView.backgroundColor = kXlineColor;
    [lineCharView addSubview:xView];
    
    UIView *yView = [[UIView alloc] initWithFrame:CGRectMake(YlabelWidth, XlabelHeight, kYlineWith, frame.size.height-XlabelHeight*2)];
    yView.backgroundColor = kXlineColor;
    [lineCharView addSubview:yView];
    
    for (int a = 0; a < XLine.count; a++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(YlabelWidth+XLabelSpace*a, frame.size.height-XlabelHeight+XlabelLineSpace, XLabelSpace, XlabelHeight-XlabelLineSpace)];
        label.font = Xfont;
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = kLabelTextColor;
        label.text = [NSString stringWithFormat:@"%@%@", XLine[a], Xunit];
        [lineCharView addSubview:label];
    }
    
    for (int a = 0; a < YLine.count; a++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-XlabelHeight-YLabelSpace*(a+1)-YlabelHeight/2, YlabelWidth-YlabelLineSpace, YlabelHeight)];
        label.font = Yfont;
//        label.layer.borderColor = [UIColor blackColor].CGColor;
//        label.layer.borderWidth = 1;
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = kLabelTextColor;
        label.text = [NSString stringWithFormat:@"%@%@", YLine[a], Yunit];
        [lineCharView addSubview:label];
    }
    

    return lineCharView;
}

- (void)setAllPoints:(NSArray <NSArray<NSString *>*>*)points {

    [points enumerateObjectsUsingBlock:^(NSArray<NSString *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addNewPoint:obj];
    }];
    if (![kFillColor isEqual:[UIColor clearColor]]) {
        [self.path addLineToPoint:CGPointMake(YlabelWidth+[points.lastObject.firstObject floatValue]*self.Xscale, self.frame.size.height-YlabelHeight)];
    }
    self.shapelayer.path = self.path.CGPath;
}

- (void)addNewPoint:(NSArray<NSString *>*)newPoint {
    CGFloat x = [[newPoint firstObject] floatValue];
    CGFloat y = [[newPoint lastObject] floatValue];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([kFillColor isEqual:[UIColor clearColor]]) {
            [self.path moveToPoint:CGPointMake(YlabelWidth+x*self.Xscale, self.frame.size.height-y*self.Yscale-YlabelHeight)];
        } else {
            [self.path moveToPoint:CGPointMake(YlabelWidth+x*self.Xscale, self.frame.size.height-YlabelHeight)];
        }
    });
    [self.path addLineToPoint:CGPointMake(YlabelWidth+x*self.Xscale, self.frame.size.height-y*self.Yscale-YlabelHeight)];

}

//- (void)addNewPoint:(NSArray<NSString *>*)newPoint {
//    CGFloat x = [[newPoint firstObject] floatValue];
//    CGFloat y = [[newPoint lastObject] floatValue];
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [self.path moveToPoint:CGPointMake(YlabelWidth+x*self.Xscale, self.frame.size.height-y*self.Yscale)];
//    });
//    [self.path addLineToPoint:CGPointMake(YlabelWidth+x*self.Xscale, self.frame.size.height-y*self.Yscale)];
//    
//    self.shapelayer.path = self.path.CGPath;
//
//}


@end
