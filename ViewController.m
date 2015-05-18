//
//  ViewController.m
//  Weather-Report
//
//  Created by Sachin on 17/05/15.
//  Copyright (c) 2015 Sachin. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DayList.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
{
    AppDelegate *appDelegate;
}

@end

@implementation ViewController
{
    NSString *cityName;
    NSMutableDictionary * responseData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mydata=[[NSMutableData alloc]init];
    
    NSString *version=[[UIDevice currentDevice]systemVersion];
    locationManger=[[CLLocationManager alloc]init];
    locationManger.desiredAccuracy=kCLLocationAccuracyBest;
    
    locationManger.delegate=self;
    if([version floatValue]>=8.0)
        
    {
        
        [locationManger requestAlwaysAuthorization];
        
    }
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark cityLabel
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [ textField resignFirstResponder];
    return YES;
}

- (IBAction)myLocationbtn:(id)sender
{
    [locationManger startUpdatingLocation];
}


- (IBAction)searchBtn:(id)sender
{
    [self.cityTxtfield resignFirstResponder];
    if ([self.cityTxtfield.text isEqualToString:@""])
    {
        UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter city name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
        [alertMessage show];
    }
    else
    {
        NSString *nurl;
        cityName = self.cityTxtfield.text;  //USER ENTERD CITY NAME
        
        nurl = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=14&APPID=1bfa41600361ce7e484713c8b4e5a3cb",cityName];
        
        NSURL *url = [NSURL URLWithString:nurl];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [NSURLConnection connectionWithRequest:request delegate:self];

        
        //START ACTIVITY INDICATOR
         self.activityView= [[UIActivityIndicatorView alloc]
                                                 initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.activityView.center=self.view.center;
        [self.activityView startAnimating];
        [self.view addSubview:self.activityView];
    }

}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.mydata setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.mydata appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    responseData = [NSJSONSerialization JSONObjectWithData:self.mydata
                                                       options:0
                                                         error:NULL];
        
    //STOP ACTIVITY INDICATOR
    [self.activityView stopAnimating];
    
        DayList *cityInfo = [self.storyboard instantiateViewControllerWithIdentifier:@"DayList"];
        cityInfo.city=self.cityTxtfield.text;
    
        appDelegate.cityDetails=[responseData valueForKey:@"city"];
        appDelegate.dayList=[responseData valueForKey:@"list"];
    
    //NSLog(@"day list ::%@",appDelegate.dayList);
       // NSLog(@"day list ::%@",appDelegate.cityDetails);
    
    [self.navigationController pushViewController:cityInfo animated:YES];
    
}
#pragma locationManager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations

{
    
    
    
    CLGeocoder *geocoder1 = [[CLGeocoder alloc] init];
    
    self.activityView= [[UIActivityIndicatorView alloc]
                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityView.center=self.view.center;
    [self.activityView startAnimating];
    [self.view addSubview:self.activityView];
    
    
    newLocation = [[CLLocation alloc]initWithLatitude:locationManger.location.coordinate.latitude longitude:locationManger.location.coordinate.longitude];
    
    
    
    [geocoder1 reverseGeocodeLocation:newLocation
     
                    completionHandler:^(NSArray *placemarks, NSError *error) {
                        
                        
                        if (placemarks && placemarks.count > 0)
                            
                        {
                            
                            CLPlacemark *placemark = placemarks[0];
                            
                            NSDictionary *addressDictionary =placemark.addressDictionary;
                            
                            self.cityTxtfield.text=[addressDictionary valueForKey:@"City"];
                            [self.activityView stopAnimating];
                            //[self.activityView removeFromSuperview];
                            
                        }
                        
                        ;
                        
                        ;
                        
                    }];
    [locationManger stopUpdatingLocation];
    
}
@end
