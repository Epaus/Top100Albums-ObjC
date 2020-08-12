//
//  Utilities.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/11/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilities.h"

@interface Utilities()

@end

@implementation Utilities

+(NSDate*) simpleDateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *formatString = [NSString stringWithFormat:@"YYYY-mm-dd"];
    [dateFormatter setDateFormat:formatString];
    return [dateFormatter dateFromString:dateString];
}

@end
