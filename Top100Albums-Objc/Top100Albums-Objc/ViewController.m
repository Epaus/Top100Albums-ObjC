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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;


@end

@implementation ViewController
@synthesize  tableDataSource;


- (void)viewDidLoad {
    [super viewDidLoad];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.blurView.effect = blur;
    self.blurView.hidden = NO;
    self.activityView.hidesWhenStopped = YES;
    self.activityView.color = [UIColor whiteColor];
    [self.activityView startAnimating];
    [self.view addSubview:self.blurView];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    _networking = [[Networking alloc] init];
   
    tableDataSource = [[TableViewDataSource alloc] initWithNetworking:_networking];
    [self refreshData];
   
    self.tableView.dataSource = self.tableDataSource;

}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    [self refreshData];
}

-(void)refreshData {
    __weak ViewController *wself = self;
    [self.tableDataSource refreshData:  ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [wself reloadTable: ^{
                [wself.activityView stopAnimating];
                wself.blurView.hidden = YES;
            }];
        });
    }];
}

-(void)reloadTable:(void (^)(void))completion {
    [self.tableView reloadData];
    
    completion();
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
