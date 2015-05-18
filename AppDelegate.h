//
//  AppDelegate.h
//  Weather-Report
//
//  Created by Sachin on 17/05/15.
//  Copyright (c) 2015 Sachin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic)NSMutableArray *dayList;
@property(strong,nonatomic)NSMutableDictionary *selectedDay;
@property(strong,nonatomic)NSMutableDictionary *cityDetails;



@end

