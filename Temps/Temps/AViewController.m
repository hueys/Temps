//
//  AViewController.m
//  Temps
//
//  Created by Steven Huey on 5/6/13.
//  Copyright (c) 2013 Art & Logic. All rights reserved.
//

#import "AViewController.h"

#import "Forecastr.h"

@interface AViewController ()
- (double)latitude;
- (double)longitude;
- (void)setForecastWithResponse:(id)JSON;
@end

@implementation AViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
   [super viewDidLoad];

   [[Forecastr sharedManager] getForecastForLatitude:[self latitude]
                                           longitude:[self longitude]
                                                time:nil
                                          exclusions:nil success:^(id JSON) {
                                             [self setForecastWithResponse:JSON];
                                          } failure:^(NSError *error, id response) {
                                             NSLog(@"Error while retrieving forecast: %@", [[Forecastr sharedManager] messageForError:error withResponse:response]);
                                          }];
}

#pragma mark - Private

- (double)latitude
{
   return 37.331741;
}

- (double)longitude
{
   return -122.030333;
}

- (void)setForecastWithResponse:(id)JSON
{
   NSDictionary* response = (NSDictionary*)JSON;
   
   if (response)
   {
      NSDictionary* currently = [response valueForKey:@"currently"];
      
      if (currently)
      {
         self.temp.text = [NSString stringWithFormat:@"%@°", [currently valueForKey:@"temperature"]];
         self.conditions.text = [currently valueForKey:@"summary"];
      }
   }
}

@end
