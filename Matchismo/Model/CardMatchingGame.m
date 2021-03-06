//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Sameh Fakhouri on 3/28/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) NSInteger numberOfCardsToMatch;
@property (nonatomic, strong) NSMutableArray *cards; // of card
@property (nonatomic, strong) NSMutableString *lastMatch;
@property (nonatomic, strong) NSString *space;
@end

@implementation CardMatchingGame


- (NSMutableString *)lastMatch
{
    if (!_lastMatch) {
        _lastMatch = [[NSMutableString alloc] init];
    }
    return _lastMatch;
}

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (NSString *)space
{
    if (!_space) {
        _space = [NSString stringWithFormat:@" "];
    }
    return _space;
}


- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        if (count < 2) {
            self = nil;
            return self;
        } // end if count
        
        for ( int i = 0 ; i < count ; i++ ) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            } // end if card
        } // end for i
    }
    
    self.numberOfCardsToMatch = 2;
    
    return self;
}

- (instancetype)init
{
    return nil;
}

- (void)matchTwoCards
{
    self.numberOfCardsToMatch = 2;
    NSLog(@"Number Of Cards To Match = %ld", (long) self.numberOfCardsToMatch);
}

- (void)matchThreeCards
{
    self.numberOfCardsToMatch = 3;
    NSLog(@"Number Of Cards To Match = %ld", (long) self.numberOfCardsToMatch);
}

- (void)resetScore
{
    self.score = 0;
}

- (NSInteger)countOfChosenUnmatchedCards
{
    NSInteger count = 0;
    
    for (Card *card in self.cards) {
        if (card.isChosen && !card.isMatched) {
            count++;
        } // end if card.isChosen
    } // end for Card

    NSLog(@"Count of chosen and unmatched cards = %ld", (long) count);
    
    return count;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (NSMutableArray *)getListOfCardsWaitingForMatch
{
    NSMutableArray *otherCards = [[NSMutableArray alloc] init];

    for (Card *otherCard in self.cards) {
        if (otherCard.isChosen && !otherCard.isMatched) {
            NSLog(@"Adding %@ Card to otherCards", otherCard.contents);
            [otherCards addObject:otherCard];
        } // end if otherCard.isChosen
    } // end for Card *otherCard in self.cards
    
    return otherCards;
}

- (NSString *)feedback
{
    NSMutableString * feedbackString = [[NSMutableString alloc] init];
    
    if ([self countOfChosenUnmatchedCards] != 0) {
        // we are in the middle of matching
        [feedbackString appendString:@"Matching: "];
        for (Card *card in [self getListOfCardsWaitingForMatch]) {
            [feedbackString appendString:card.contents];
            [feedbackString appendString:self.space];
        } // end for (Card *card in [self getListOfCardsWaitingForMatch])
    } else {
        // we either just got started or just completed a match
        [feedbackString appendString:self.lastMatch];
        self.lastMatch = Nil;
    } // end if ([self countOfChosenUnmatchedCards] != 0)
    
    
    return feedbackString;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
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
        self.score -=COST_TO_CHOOSE;
        return;
    } // end if [self countOfChosenCards] == self.numberOfCardsToMatch - 1

    //NSLog(@"Count of cards in otherCards = %ld", [otherCards count]);
    
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

@end
