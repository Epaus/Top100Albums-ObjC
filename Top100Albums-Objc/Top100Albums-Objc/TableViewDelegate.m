//
//  TableViewDelegate.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/11/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "TableViewDelegate.h"



@interface TableViewDelegate()
@property(weak) TableViewDelegate * delegate;

@end

@implementation TableViewDelegate

-(instancetype)initWithDelegate:(TableViewDelegate *)delegate  {
    self = [super init];
       if (self) {
           _delegate = delegate;
       }
       return self;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate selectedCellAtIndex:indexPath.row];
}


@end
