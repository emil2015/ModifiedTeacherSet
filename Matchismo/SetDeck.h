//
//  SetDeck.h
//  Matchismo
//
//  Created by David Gross on 10/16/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCard.h"

@interface SetDeck : NSObject

-(void)addCard:(SetCard *)card atTop:(BOOL)atTop;
-(void)addCard:(SetCard *)card;

-(SetCard *)drawRandomCard;

@end
