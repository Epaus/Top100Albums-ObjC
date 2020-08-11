//
//  ViewController.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "ViewController.h"
#import "Networking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Networking * networking = [[Networking alloc] init];
    [networking makeRequest: nil];
}


@end
