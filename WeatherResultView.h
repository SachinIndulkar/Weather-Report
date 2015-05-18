//
//  WeatherResultView.h
//  Weather-Report
//
//  Created by Sachin on 17/05/15.
//  Copyright (c) 2015 Sachin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherResultView : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *cityNameLab;
@property (weak, nonatomic) IBOutlet UILabel *descriptLab;
@property (weak, nonatomic) IBOutlet UILabel *countryNmaeLab;
@property (weak, nonatomic) IBOutlet UILabel *minLab;
@property (weak, nonatomic) IBOutlet UILabel *maxLab;
@property (weak, nonatomic) IBOutlet UILabel *perssureLab;
@property (weak, nonatomic) IBOutlet UILabel *humidityLab;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImage;
@property (weak, nonatomic) IBOutlet UILabel *tempLab;

@property (nonatomic,strong) NSString *contValue;
@property (nonatomic,strong) NSString *cntryValue;
@property (nonatomic,strong) NSString *discripationValue;
@property (nonatomic,assign) int tempValue;
@property (nonatomic,assign) int maxTemp;
@property (nonatomic,assign) int minTemp;
@property (nonatomic,assign) int pressureValue;
@property (nonatomic,assign) int humidityValue;


@end;


