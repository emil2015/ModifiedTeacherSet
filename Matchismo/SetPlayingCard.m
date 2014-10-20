//
//  SetPlayingCard.m
//  Matchismo
//
//  Created by David Gross on 10/16/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetPlayingCard.h"
@interface SetPlayingCard()
@property (strong, nonatomic) NSAttributedString *colorAndAlpha2;
@end


@implementation SetPlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = [SetPlayingCard rankStrings];
    //return [rankStrings[self.shape] stringByAppendingString:self.count];
    return @"h";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

-(int)match:(NSArray *)otherCards{
    return 0;
}

//Shape block ------------------------------------------------
@synthesize shape = _shape;

+ (NSArray *)validShape
{
    return @[@"●",@"▲",@"￭"];
}

- (void)setShape:(NSString *)shape
{
    if ([[SetPlayingCard validShape] containsObject:shape]) {
        _shape = shape;
    }
}

- (NSString *)shape
{
    return _shape ? _shape : @"?";
}
//End shape block ---------------------------------------------

//CountBlock --------------------------------------------------
+ (NSUInteger)maxCount
{
    return 2;
}

- (void)setCount:(NSUInteger)counts
{
    if (counts <= [SetPlayingCard maxCount]) {
       // _count = counts;
    }
}
//End of count block --------------------------------------------

//Start of alpha block --------------------------------------------
+ (NSArray *)validAlpha
{
    //0, .5 or 1
    //return @[@"♥",@"♦",@"♠",@"♣"];
    return @[@0,@.5,@1];
}

-(void)setAlpha:(NSInteger)alpha{

    
}

//End of alpha block --------------------------------------------

//Start of color block --------------------------------------------
@synthesize color = _color;

+ (NSArray *)validColor
{
    return @[[UIColor greenColor],
             [UIColor blueColor],
             [UIColor redColor]];
}

-(void)setColor:(UIColor *)color{
    //color = [UIColor colorWithGreen:1];
}

//End of color block --------------------------------------------
@end
