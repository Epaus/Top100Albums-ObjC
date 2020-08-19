//
//  Networking.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "Networking.h"
#import "AlbumModel.h"
#import "UIKit/UIKit.h"
#import "Utilities.h"

@interface Networking()


@end

@implementation Networking
NSURL * theURL;
NSInteger timeOutInterval;
NSURLSessionDataTask *task;

-(void)makeRequest: (void (^)(NSArray* ))completion {
    __block NSArray *models;
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
        models = [self parseResponse:responseDictionary];
      }
      else
      {
        NSLog(@"Error");
      }
     completion(models);
    }];
    [dataTask resume];
  
    
}

-(NSArray *)parseResponse: (NSDictionary *)dict {
   NSMutableArray *models = [[NSMutableArray alloc] init];
    NSDictionary *feed = dict[@"feed"];
    NSDictionary *results = feed[@"results"];
     for (id obj in results ) {
         NSString *releaseDateText = [obj objectForKey:@"releaseDate"];
         NSDate *releaseDate = [Utilities simpleDateFromString:releaseDateText];
         
         NSDictionary *genreText = [obj objectForKey: @""];
         NSArray *genres = [self genreArrayFromJson:genreText];
         
         AlbumModel *model = [[AlbumModel alloc] initWwithArtistName:[obj objectForKey:@"artistName"] albumId:[obj objectForKey:@"albumId"] releaseDate:releaseDate name:[obj objectForKey: @"name"] url:[obj objectForKey:@"url"] genres:genres copyright:[obj objectForKey:@"copyright"] artworkUrl100:[obj objectForKey:@"artworkUrl100"]];
         [models addObject:model];
     }
    
    return models;
}



-(NSArray *) genreArrayFromJson:(NSDictionary *)jsonGenres {
    NSMutableArray *genres = [[NSMutableArray alloc] init];
    for (id genre in jsonGenres) {
        NSString *name = [genre objectForKey: @"name"];
        if (![name isEqualToString:@"Music"]) {
            [genres addObject:name];
        }
    }
    return [genres copy];
}

@end
