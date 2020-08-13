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
#import "DetailViewController.h"
#import "MainTableViewCell.h"


@interface ViewController ()
@property (nonatomic, strong) Networking *networking;
@property (nonatomic, strong) TableViewDelegate * tableDelegate;
@property (nonatomic, strong) TableViewDataSource *tableDataSource;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) DetailViewController *detailViewController;
@property (nonatomic, strong) AlbumModel * selectedModel;

@end

@implementation ViewController
@synthesize tableDelegate, tableDataSource;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    _networking = [[Networking alloc] init];
   
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
    
    self.selectedModel = self.tableDataSource.data[index];
    
    [self performSegueWithIdentifier:@"detailSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"sender = %@",sender);
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        self.detailViewController = [segue destinationViewController];
        MainTableViewCell *mainCell = (MainTableViewCell *)sender;
        self.detailViewController.model = mainCell.model;
        // Get destination view
      
       
    }
}


@end
