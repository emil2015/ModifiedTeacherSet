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
        //for suits in validSuit (shape)
        for (NSString *suit in [SetPlayingCard2 validSuits]) {
            //NSLog(suit);
            //for ranks in validRanks (count)
            for (NSUInteger rank = 1 ; rank <= [SetPlayingCard2 maxRank] ; rank++) {
                //for color in validColors
                //for alpha in validAlpha
                for (UIColor *color in [SetPlayingCard2 validColors]) {
                    //for (float alpha in [SetPlayingCard2 validAlphaValue]){
                    for (float i = 0; i <= 1; i = i + .5){
                        SetPlayingCard2 *card = [[SetPlayingCard2 alloc] init];
                        card.rank = rank;
                        card.suit = suit;
                        card.color = color;
                        card.alpha = i;
                        [self addCard:card];
                    }
                }
                
                
                
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
