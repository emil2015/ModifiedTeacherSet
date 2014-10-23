//
//  SetCardDeck.h
//  Matchismo
//
//  Created by David Gross on 10/21/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Deck.h"
#import "SetCard.h"

@interface SetCardDeck : SetCard

- (instancetype)init;
- (void)addCard:(SetCard *)card atTop:(BOOL)atTop;
- (void)addCard:(SetCard *)card;

- (SetCard *)drawRandomCard;

@end
