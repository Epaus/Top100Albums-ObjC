//
//  Networking.h
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Networking: NSObject

-(void)makeRequest: (void (^)(NSArray* results))completion;


@end
