//
//  ViewController.h
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Networking.h"


@protocol ViewControllerDelegate
- (void)selectedCellAtIndex:(NSInteger)index;
@end

@interface ViewController : UIViewController <ViewControllerDelegate>

@end

