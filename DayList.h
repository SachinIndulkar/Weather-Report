//
//  DayList.h
//  Weather-Report
//
//  Created by Sachin on 17/05/15.
//  Copyright (c) 2015 Sachin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayList : UIViewController
{
    NSMutableArray *dateArray;
}
@property (weak, nonatomic) IBOutlet UITableView *datTable;
@property (weak, nonatomic) IBOutlet UILabel *cityName;

@property(strong,nonatomic)NSString *city;

@end
