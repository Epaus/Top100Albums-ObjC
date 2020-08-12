//
//  TableViewDelegate.h
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/11/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol ViewControllerDelegate
-(void)selectedCellAtIndex:(NSInteger)index;
@end

@interface TableViewDelegate: NSObject < UITableViewDelegate >

@end
