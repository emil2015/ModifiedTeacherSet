//
//  SetCardDeck.m
//  Matchismo
//
//  Created by David Gross on 10/21/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetCardDeck.h"




@interface SetCardDeck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation SetCardDeck
//-----


//----
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        for (NSString *shape in [SetCard shapeArray]) {
            for (UIColor *color in [SetCard colorArray]) {
                for (int count = 1; count <= 3; count++) {
                    for (float alpha = 0; alpha <= 1; alpha += .5) {
                        SetCard *card = [[SetCard alloc] init];
                        card.shape = shape;
                        card.color = color;
                        card.count = count;
                        card.alpha = alpha;
                        [self addCard:card];
                        NSLog(@"card made");
                        //NSLog(@"shape %d", card.shape);
                        //NSLog(@"color %d", card.color);
                        //NSLog(@"count %d", card.count);
                        //NSLog(@"alpha %d", card.alpha);
                    }
                }
            }
        }
    }
    return self;

}

- (SetCard *)drawRandomCard{
    SetCard *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
    
}

- (void)addCard:(SetCard *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(SetCard *)card
{
    [self addCard:card atTop:NO];
}

/*
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
 */

@end
