//
//  SetPlayingCardDeck.m
//  Matchismo
//
//  Created by David Gross on 10/16/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetPlayingCardDeck.h"
//#import "SetPlayingCard.h"
#import "SetPlayingCard2.h"

@implementation SetPlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [SetPlayingCard2 validSuits]) {
            //NSLog(suit);
            for (NSUInteger rank = 1 ; rank <= [SetPlayingCard2 maxRank] ; rank++) {
                SetPlayingCard2 *card = [[SetPlayingCard2 alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}
/*
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *shape in [SetPlayingCard validShape]) {
            for (NSUInteger count = 1 ; count <= [SetPlayingCard maxCount] ; count++) {
                SetPlayingCard *card = [[SetPlayingCard alloc] init];
                card.count = count;
                card.shape = shape;
                [self addCard:card];
            }
        }
    }
    
    return self;
}
 */

/*
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        //selects suit
        for (NSString *shape in [SetPlayingCard validShape]) {
            //selects rank
            for (NSUInteger count = 0 ; count <= [SetPlayingCard maxCount] ; count++) {
                SetPlayingCard *card = [[SetPlayingCard alloc] init];
                card.count = count;
                card.shape = shape;
                [self addCard:card];
                //NSLog(shape);
                //NSLog(@"%tu",count);
            }
        }
    }
    NSLog(@"Set playing card deck intiated");
    return self;
}
*/
@end
