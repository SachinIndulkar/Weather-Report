//
//  WeatherResultView.m
//  Weather-Report
//
//  Created by Sachin on 17/05/15.
//  Copyright (c) 2015 Sachin. All rights reserved.
//

#import "WeatherResultView.h"
#import "AppDelegate.h"


@interface WeatherResultView ()
{
    AppDelegate *appDelegate;
}

@end

@implementation WeatherResultView

- (void)viewDidLoad {
    appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    int kelvin = 272;
    
    self.contValue =[appDelegate.cityDetails valueForKey:@"name"];
    
    self.cntryValue = [appDelegate.cityDetails  valueForKey:@"country"];
    
    self.discripationValue = [[[appDelegate.selectedDay valueForKey:@"weather"] objectAtIndex:0]  valueForKeyPath:@"description"];

    
    self.maxTemp = [[[appDelegate.selectedDay valueForKey:@"temp"] valueForKey:@"max"] intValue];
    self.maxTemp = self.maxTemp - kelvin;
    
    self.minTemp = [[[appDelegate.selectedDay valueForKey:@"temp"] valueForKey:@"min"] intValue];
    self.minTemp = self.minTemp - kelvin;
    
    self.pressureValue = [[appDelegate.selectedDay  valueForKey:@"pressure"] intValue];
    self.humidityValue = [[appDelegate.selectedDay  valueForKey:@"humidity"] intValue];
    
#pragma mark setting background image
    
    
    if ([self.discripationValue isEqualToString:@"Sky is Clear"] )
    {
        self.backGroundImage.image = [UIImage imageNamed:@"clear sky"];
    }
    else if ([self.discripationValue isEqualToString:@"scattered clouds"])
    {
        self.backGroundImage.image = [UIImage imageNamed:@"scattered_clouds"];
    }
    else if ([self.discripationValue isEqualToString:@"light rain"])
    {
        self.backGroundImage.image = [UIImage imageNamed:@"light_rain"];
    }
    else if ([self.discripationValue isEqualToString:@"moderate rain"])
    {
        self.backGroundImage.image = [UIImage imageNamed:@"light_rain"];
    }
    else
    {
        self.backGroundImage.image = [UIImage imageNamed:@"clear sky"];
    }
    
    
#pragma mark setting values to lables
    
    self.countryNmaeLab.text = self.cntryValue;
    self.cityNameLab.text = self.contValue;
    self.descriptLab.text = self.discripationValue;
    self.maxLab.text= [[NSString alloc] initWithFormat:@"%d", self.maxTemp];
    self.minLab.text = [[NSString alloc] initWithFormat:@"%d", self.minTemp];
    self.perssureLab.text = [[NSString alloc] initWithFormat:@"%d", self.pressureValue];
    self.humidityLab.text = [[NSString alloc] initWithFormat:@"%d", self.humidityValue];
    
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
