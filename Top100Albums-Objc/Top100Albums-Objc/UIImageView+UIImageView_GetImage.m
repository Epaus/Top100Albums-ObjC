//
//  UIImageView+UIImageView_GetImage.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/12/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "UIImageView+UIImageView_GetImage.h"

NSCache *imageCache;
@implementation UIImageView (UIImageView_GetImage)


-(void)downloadImageWithUrlString:(NSString *)urlString {
    
    UIImage *imageFromCache = [imageCache objectForKey:urlString];
    if (imageFromCache != nil) {
        return;
    }
   
     NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:urlString]];
     NSURLSession *session = [NSURLSession sharedSession];
     
     NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                       {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         if(httpResponse.statusCode == 200)
         {
             UIImage *image = [[UIImage alloc] initWithData:data];
             dispatch_async(dispatch_get_main_queue(), ^{
                 UIImage *imageToCache = image;
                 self.image = imageToCache;
                 [imageCache setObject:imageToCache forKey:urlString];
             });
             
         }
         else
         {
             NSLog(@"Error");
         }
     }];
     [dataTask resume];
}


@end
