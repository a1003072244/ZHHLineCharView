# ZHHLineCharView
折线图
一个简单数据展示的折线统计图，不包括任何的交互功能。

集成使用只用一行代码就搞定。
 ```object-c
 [self.view addSubview:[ZHHLinChartView zhhLineCharViewWithFrame:CGRectMake(50, 100, 250, 200) YLine:@[@"100",@"200", @"300",@"400",@"500"] XLine:@[@"周一", @"周二", @"周三"] YUnit:@"ml" XUnit:@"" points:@[@[@"12", @"76"],@[@"67", @"100"],@[@"80", @"300"],@[@"165", @"530"],@[@"180", @"11"],@[@"210", @"389"],@[@"211", @"421"],@[@"268", @"321"],@[@"300", @"123"],@[@"333", @"456"],@[@"360", @"434"]] maxXValue:365.0 maxYValue:600.0]];
```
提供 色彩填充 和 单纯的折线效果

效果的开启与否 通过更改 
```object-c 
#define kFillColor [UIColor clearColor] 
```  
即可


![色彩填充效果](https://github.com/a1003072244/ZHHLineCharView/blob/master/有填充色.png)
![单纯的折线效果](https://github.com/a1003072244/ZHHLineCharView/blob/master/无填充色.png)
