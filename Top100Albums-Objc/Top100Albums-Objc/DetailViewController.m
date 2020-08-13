//
//  DetailViewController.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/13/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+UIImageView_GetImage.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *copyright;
@property (weak, nonatomic) IBOutlet UILabel *albumTitle;
@property (weak, nonatomic) IBOutlet UILabel *artistName;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.imageView getImageWithUrl:self.model.artworkUrl100];
    self.copyright.text = self.model.copyright;
    self.albumTitle.text = self.model.name;
    self.artistName.text = self.model.artistName;
}


- (IBAction)iTunesButtonTapped:(id)sender {
    NSURL *url = [NSURL URLWithString:self.model.url];
    NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @NO};
    [[UIApplication sharedApplication] openURL:url options:options completionHandler:nil];
}

@end
