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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *copyright;
@property (weak, nonatomic) IBOutlet UILabel *albumTitle;
@property (weak, nonatomic) IBOutlet UILabel *artistName;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // [self.imageView getImageWithUrl:self.model.artworkUrl100];
    self.copyright.text = self.model.copyright;
    self.albumTitle.text = self.model.name;
    self.artistName.text = self.model.artistName;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
