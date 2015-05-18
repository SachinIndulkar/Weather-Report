//
//  DayList.m
//  Weather-Report
//
//  Created by Sachin on 17/05/15.
//  Copyright (c) 2015 Sachin. All rights reserved.
//

#import "DayList.h"
#import "WeatherResultView.h"
#import "AppDelegate.h"

@interface DayList ()
{
    AppDelegate *appDelegate;
}

@end

@implementation DayList

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cityName.text=self.city;
    self.cityName.text=[appDelegate.cityDetails valueForKey:@"name"];
    appDelegate=(AppDelegate*)[UIApplication sharedApplication].delegate;
   dateArray=[[NSMutableArray alloc]init];
    NSDateComponents *dateComponents;
    NSDate *newDate;
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateFormat=@"dd-MM-yyyy";

    for(int i =0; i<[appDelegate.dayList count];i++)
    {
        dateComponents=[NSDateComponents new];
        dateComponents.day=i;
        newDate=[[NSCalendar currentCalendar]dateByAddingComponents:dateComponents toDate:[NSDate date] options:0] ;
        NSString *dateString=[dateFormat stringFromDate:newDate];
        [dateArray addObject:dateString];
    }

//    NSLog(@"city array::%@",appDelegate.cityDetails);
//        NSLog(@"city array::%@",appDelegate.dayList);
}
#pragma mark table datasource and delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [appDelegate.dayList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      // NSLog(@"array  %@",dateArray);
    
    UITableViewCell *cell1=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Nil];
    if(indexPath.row==0)
    {
     cell1.textLabel.text=@"Today";
    }
    else{
    cell1.textLabel.text=[NSString stringWithFormat:@"%@",[dateArray objectAtIndex:indexPath.row] ];
    }
    return cell1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    appDelegate.selectedDay=[appDelegate.dayList objectAtIndex:indexPath.row];
    WeatherResultView *wrv=[self.storyboard instantiateViewControllerWithIdentifier:@"WeatherResultView"];
    [self.navigationController pushViewController:wrv animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
