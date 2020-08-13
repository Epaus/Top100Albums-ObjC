//
//  ViewController.h
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Networking.h"

@interface ViewController : UIViewController
-(void)reloadTable:(void (^)(void))completion;
@end

