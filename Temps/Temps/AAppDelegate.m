//
//  AAppDelegate.m
//  Temps
//
//  Created by Steven Huey on 5/6/13.
//  Copyright (c) 2013 Art & Logic. All rights reserved.
//

#import "AAppDelegate.h"

#import "Forecastr.h"

#import "AForecastIO.h"


@implementation AAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   // Save our API Key for Forecast.IO
   Forecastr* forecastDotIo = [Forecastr sharedManager];
   forecastDotIo.apiKey = kForecastIoAPIKey;

   return YES;
}

@end
