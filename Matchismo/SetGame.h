//
//  SetGame.h
//  Matchismo
//
//  Created by David Gross on 10/16/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetDeck.h"

@interface SetGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(SetDeck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (SetCard *)cardAtIndex:(NSUInteger)index;



/*
- (void)resetScore;

- (void)matchTwoCards;
- (void)matchThreeCards;

- (NSString *)feedback;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSInteger numberOfCardsToMatch;
*/

@end
