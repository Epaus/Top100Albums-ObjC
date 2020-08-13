//
//  MainTableViewCell.h
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/12/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageview;
@property (weak, nonatomic) IBOutlet UILabel *albumTitle;
@property (weak, nonatomic) IBOutlet UILabel *artistName;


@end

NS_ASSUME_NONNULL_END