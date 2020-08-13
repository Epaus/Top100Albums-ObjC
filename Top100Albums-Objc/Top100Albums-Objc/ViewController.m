//
//  ViewController.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSource.h"
#import "DetailViewController.h"
#import "MainTableViewCell.h"



@interface ViewController ()
@property (nonatomic, strong) Networking *networking;
@property (nonatomic, strong) TableViewDataSource *tableDataSource;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) DetailViewController *detailViewController;
@property (nonatomic, strong) AlbumModel * selectedModel;

@end

@implementation ViewController
@synthesize  tableDataSource;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    _networking = [[Networking alloc] init];
   
    tableDataSource = [[TableViewDataSource alloc] initWithNetworking:_networking];
    [self refreshData];
   
    self.tableView.dataSource = self.tableDataSource;

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        self.detailViewController = [segue destinationViewController];
        MainTableViewCell *mainCell = (MainTableViewCell *)sender;
        AlbumModel *model = mainCell.model;
        self.detailViewController.model = model;
    }
}


@end
