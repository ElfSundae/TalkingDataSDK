//
//  AppDelegate.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/5/22.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "AppDelegate.h"
#import "TalkingData.h"

@interface AppDelegate ()

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *appAnalyticsAppId = @"DE40FB8A722D454B8981E2F842E6AAB6";
    NSString *appAnalyticsChannelId = @"AppStore";
    [TalkingData sessionStarted:appAnalyticsAppId withChannelId:appAnalyticsChannelId];
    
    
    
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = 10.0;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f) {
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];
    
    return YES;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"Update location:%@", locations);
}






@end
