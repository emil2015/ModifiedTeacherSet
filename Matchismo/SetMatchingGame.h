//
//  SetMatchingGame.h
//  Matchismo
//
//  Created by David Gross on 10/21/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

//#import "CardMatchingGame.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(SetCardDeck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (SetCard *)cardAtIndex:(NSUInteger)index;

- (void)resetScore;

//- (void)matchTwoCards;
//- (void)matchThreeCards;

- (NSAttributedString *)feedback;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSInteger numberOfCardsToMatch;

@end
