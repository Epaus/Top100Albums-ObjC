//
//  ViewController.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic, strong) NSArray *albums;
@property (nonatomic, strong) Networking *networking;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
@synthesize albums;

-(instancetype)initWithNetworking:(Networking *)nw {
    self = [super init];
    if (self) {
        _networking = nw;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    self.refreshData;
}

-(void)refreshData {
    __weak ViewController *wself = self;
      [_networking makeRequest: ^(NSArray* models){
          wself.albums = models;
      }];
}


@end
