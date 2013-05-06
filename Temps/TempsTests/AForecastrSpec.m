//
//  AForecastrSpec.m
//  Temps
//
//  Created by Steven Huey on 5/6/13.
//  Copyright (c) 2013 Art & Logic. All rights reserved.
//

#import "Forecastr.h"
#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "AForecastIO.h"

SpecBegin(AForecastrSpec)

describe(@"Forecastr", ^{
   __block Forecastr* forecastr;
   
   beforeAll(^{
      forecastr = [Forecastr sharedManager];
      forecastr.apiKey = kForecastIoAPIKey;
   });
   
   it(@"should have a shared manager", ^{
      expect(forecastr).notTo.beNil;
   });
   
   it(@"should have the current forecast", ^{
      [forecastr getForecastForLatitude:37.808588
                              longitude:-122.477017
                                   time:nil
                             exclusions:nil
                                success:^(id JSON) {
                                   NSDictionary* forecast = (NSDictionary*)JSON;
                                   NSDictionary* currentForecast = [forecast valueForKey:@"currently"];
                                   
                                   expect(currentForecast).notTo.beNil;
                                }
                                failure:^(NSError *error, id response) {
                                   NSLog(@"Error while retrieving forecast: %@", [forecastr messageForError:error withResponse:response]);
                                   expect(nil).notTo.beNil; // fail!
                                }];
      
   });
   
});

SpecEnd