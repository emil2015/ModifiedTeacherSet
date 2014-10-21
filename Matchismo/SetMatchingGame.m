//
//  SetMatchingGame.m
//  Matchismo
//
//  Created by David Gross on 10/21/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetMatchingGame.h"
#import "SetCard.h"


@interface  SetMatchingGame()
@property (nonatomic, strong) NSMutableArray *cards; // of card
@property (nonatomic, readwrite) NSInteger numberOfCardsToMatch;
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableString *lastMatch;
@property (nonatomic, strong) NSString *space;
@end


@implementation SetMatchingGame

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(SetCardDeck *)deck{
    
    self = [super init];
    
    if (self) {
        if (count < 2) {
            self = nil;
            return self;
        } // end if count
        
        for ( int i = 0 ; i < count ; i++ ) {
            //I don't like that I am casting this
            SetCard *card = [deck drawRandomCard];
            //NSLog(card.contents);
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                //break;
            } // end if card
        } // end for i
    }
    return self;
}
//----
- (SetCard *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}
//--Helper methods
- (NSMutableArray *)getListOfCardsWaitingForMatch
{
    NSMutableArray *otherCards = [[NSMutableArray alloc] init];
    
    for (SetCard *otherCard in self.cards) {
        if (otherCard.isChosen && !otherCard.isMatched) {
            NSLog(@"Adding %@ Card to otherCards", otherCard.contents);
            [otherCards addObject:otherCard];
        } // end if otherCard.isChosen
    } // end for Card *otherCard in self.cards
    
    return otherCards;
}

- (NSInteger)countOfChosenUnmatchedCards
{
    NSInteger count = 0;
    
    for (SetCard *card in self.cards) {
        if (card.isChosen && !card.isMatched) {
            count++;
        } // end if card.isChosen
    } // end for Card
    
    NSLog(@"Count of chosen and unmatched cards = %ld", (long) count);
    
    return count;
}

//----
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    SetCard *card = [self cardAtIndex:index];
    NSMutableArray *otherCards;
    
    // are we just flipping the card back down?
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            return;
        } // end if card.isChosen
    } // end if !card.isMatched
    
    // enough cards chosen? then create an array of cards to match
    if ([self countOfChosenUnmatchedCards] == self.numberOfCardsToMatch - 1) {
        otherCards = [self getListOfCardsWaitingForMatch];
    } else {
        // mark current card as chosen and take away cost of choosing
        NSLog(@"Not enough cards have been chosen");
        card.chosen = YES;
        self.score -= COST_TO_CHOOSE;
        return;
    } // end if [self countOfChosenCards] == self.numberOfCardsToMatch - 1
    
    NSLog(@"Count of cards in otherCards = %ld", [otherCards count]);
    
    int matchScore = [card match:otherCards];
    if (matchScore) {
        self.score += matchScore * MATCH_BONUS;
        [self.lastMatch appendString:@"Matched: "];
        for (Card *otherCard in otherCards) {
            otherCard.matched = YES;
            [self.lastMatch appendString:otherCard.contents];
            [self.lastMatch appendString:self.space];
        } // end for (Card *otherCard in otherCards)
        [self.lastMatch appendString:card.contents];
        [self.lastMatch appendFormat:@" for %d points", matchScore * MATCH_BONUS];
        card.chosen = YES;
        card.matched = YES;
    } else {
        self.score -= MISMATCH_PENALTY;
        [self.lastMatch appendString:@"No Match: "];
        for (Card *otherCard in otherCards) {
            otherCard.chosen = NO;
            [self.lastMatch appendString:otherCard.contents];
            [self.lastMatch appendString:self.space];
        } // end for (Card *otherCard in otherCards)
        [self.lastMatch appendString:card.contents];
        [self.lastMatch appendFormat:@" %d points penalty", MISMATCH_PENALTY];
        card.chosen = NO;
        card.matched = NO;
    } // end if matchScore
    
    // take away cost of choosing
    self.score -=COST_TO_CHOOSE;
}
//-----

@end
