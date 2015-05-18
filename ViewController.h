//
//  ViewController.h
//  Weather-Report
//
//  Created by Sachin on 17/05/15.
//  Copyright (c) 2015 Sachin. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<UITextFieldDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *locationManger;
    CLLocation *newLocation;
}

- (IBAction)myLocationbtn:(id)sender;
- (IBAction)searchBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *cityTxtfield;
@property(nonatomic,retain)NSMutableData *mydata;
@property(nonatomic,retain)UIActivityIndicatorView *activityView;



@end

