//
//  Networking.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "Networking.h"
#import "UIKit/UIKit.h"



@interface Networking()


@end

@implementation Networking
NSURL * theURL;
NSInteger timeOutInterval;
NSURLSessionDataTask *task;

-(void)makeRequest: (void (^)(NSArray* ))completion {
    NSMutableArray *models = [[NSMutableArray alloc] init];
    NSString *urlString = @"https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json";
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:urlString]];
    NSDictionary *header = [request allHTTPHeaderFields];
    [header setValue:@"application/json" forKey:@"Accept"];
    

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if(httpResponse.statusCode == 200)
      {
        NSError *parseError = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        NSLog(@"The response is - %@",responseDictionary);
        
      }
      else
      {
        NSLog(@"Error");
      }
    }];
    [dataTask resume];
    
}

@end
