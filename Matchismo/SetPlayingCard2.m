//
//  SetPlayingCard2.m
//  Matchismo
//
//  Created by David Gross on 10/19/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetPlayingCard2.h"

@implementation SetPlayingCard2


//Matches cards
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[SetPlayingCard2 class]]) {
            SetPlayingCard2 *otherPlayingCard = (SetPlayingCard2 *)card;
            if ([self.suit isEqualToString:otherPlayingCard.suit]) {
                score = 1;
            } else if (self.rank == otherPlayingCard.rank) {
                score = 4;
            } // end if self.suit
        }
    } else if ([otherCards count] == 2) {
        for (id card in otherCards) {
            if ([card isKindOfClass:[SetPlayingCard2 class]]) {
                SetPlayingCard2 *otherPlayingCard = (SetPlayingCard2 *)card;
                if ([self.suit isEqualToString:otherPlayingCard.suit]) {
                    score += 1;
                }
                if (self.rank == otherPlayingCard.rank) {
                    score += 8;
                }
            }
        }
    } // end if otherCards count // end if otherCards count
    
    return score;
}

//Returns contents
- (NSString *)contents
{
    NSArray *rankStrings = [SetPlayingCard2 rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
    /*
     NSMutableAttributedString *title =
     [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
     [title setAttributes:@{NSStrokeWidthAttributeName : @3,
     NSStrokeColorAttributeName : self.outlineButton.tintColor}
     range:NSMakeRange(0, [title length])];
     [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
     */
}
//--------------------------------------
@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"●",@"▲",@"■"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[SetPlayingCard2 validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}
//----------------------------------------
+ (NSArray *)rankStrings
{
    //return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return @[@"?",@"1",@"2",@"3"];
    //return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
    //return 2;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [SetPlayingCard2 maxRank]) {
        _rank = rank;
    }
}
//---------------------------------------------
//@synthesize colorAndAlpha = _colorAndAlpha;

+(NSArray *)validAlphaValue{
    return @[@.1,@1,@.5,@0];
}

+(NSArray *)validColors{
    return @[[UIColor greenColor], [UIColor blueColor], [UIColor redColor]];
}

- (void)setAlpha:(float)alpha{
    _alpha = alpha;
}
@synthesize color = _color;
- (void)setColor:(UIColor *)color{
    _color = color;
}

- (void)setColorAndAlpha:(NSAttributedString *)colorAndAlpha{
    _colorAndAlpha = colorAndAlpha;
}

@end
