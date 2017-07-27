//
//  AppDelegate.h
//  ZHHLineCharView
//
//  Created by apple on 2017/7/27.
//  Copyright © 2017年 ZhangHaohao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

