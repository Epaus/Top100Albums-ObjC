//
//  ViewController.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDelegate.h"
#import "TableViewDataSource.h"


@interface ViewController ()
@property (nonatomic, strong) Networking *networking;
@property (nonatomic, strong) TableViewDelegate * tableDelegate;
@property (nonatomic, strong) TableViewDataSource *tableDataSource;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
@synthesize tableDelegate, tableDataSource;



- (void)viewDidLoad {
    [super viewDidLoad];
    _networking = [[Networking alloc] init];
    
    self.view.backgroundColor = UIColor.whiteColor;
    NSLog(@"tableView = %@",self.tableView);
   
   
    tableDataSource = [[TableViewDataSource alloc] initWithNetworking:_networking];
    [self refreshData];
    
    tableDelegate = [[TableViewDelegate alloc] init];
    self.tableView.dataSource = self.tableDataSource;
    self.tableView.delegate = self.tableDelegate;
   
   
    
}

-(void)viewWillAppear:(BOOL)animated {
    [self refreshData];
}

-(void)refreshData {
    [self.tableDataSource refreshData:  ^{
  
        dispatch_async(dispatch_get_main_queue(), ^{
                  [self.tableView reloadData];
              });
    }];

   
   
}

- (void)selectedCellAtIndex:(NSInteger)index {
    NSLog(@"cell selected = %ld",(long)index);
}


@end
