//
//  DetailViewController.h
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/13/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumModel.h"



@interface DetailViewController : UIViewController
@property (nonatomic, strong) AlbumModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

