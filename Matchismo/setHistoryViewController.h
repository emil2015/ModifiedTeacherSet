//
//  setHistoryViewController.h
//  Matchismo
//
//  Created by David Gross on 10/22/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetGameViewController.h"
@class SecondViewController;

@protocol SecondViewControllerDelegate

-(void) updateLabelWithString:(NSString*)string;

@end


@interface setHistoryViewController : SetGameViewController
@property (weak, nonatomic) id<SecondViewControllerDelegate>delegate;
@end
