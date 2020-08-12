//
//  TableViewDelegate.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/11/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "TableViewDelegate.h"




@interface TableViewDelegate()

@end

@implementation TableViewDelegate
id <ViewControllerDelegate> delegate;


-(instancetype)initWithDelegate:(id *)delegate {
    self = [super init];
       if (self) {
           delegate = delegate;
       }
       return self;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    [delegate selectedCellAtIndex: indexPath.row];
}




@end
