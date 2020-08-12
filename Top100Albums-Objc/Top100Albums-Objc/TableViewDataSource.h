//
//  TableViewDataSource.h
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/11/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Networking.h"
#import "AlbumModel.h"

@interface TableViewDataSource: NSObject < UITableViewDataSource >
-(instancetype)initWithNetworking:(Networking *)nw;
-(void)refreshData:(void (^)(void))completion;
@end
