//
//  SetCard.m
//  Matchismo
//
//  Created by David Gross on 10/21/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
/*
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    NSMutableArray *cards = [NSMutableArray arrayWithArray:otherCards];
    [cards addObject:self];
    
    NSMutableSet *symbols   = [[NSMutableSet alloc] init];
    NSMutableSet *colors    = [[NSMutableSet alloc] init];
    NSMutableSet *numbers   = [[NSMutableSet alloc] init];
    NSMutableSet *shadings  = [[NSMutableSet alloc] init];
    
    for (SetCard *otherCard in cards) {
        [symbols    addObject:@(otherCard.symbol)];
        [colors     addObject:@(otherCard.color)];
        [shadings   addObject:@(otherCard.shading)];
        [numbers    addObject:@(otherCard.number)];
    }
    
    if (((symbols.count == 1)   || (symbols.count == 3)) &&
        ((colors.count == 1)    || (colors.count == 3)) &&
        ((numbers.count == 1)   || (numbers.count == 3)) &&
        ((shadings.count == 1)  || (shadings.count == 3))) score = MATCH_POINTS;
    
    return score;
}
 */

- (NSString *)aString{
    return @"z";
    /*
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.shape];
    
    UIColor *foregroundColor = [UIColor redColor];
    UIColor *strokeColor = [foregroundColor copy];
    foregroundColor = [foregroundColor colorWithAlphaComponent:1];
    
    [title setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                           NSStrokeWidthAttributeName:@-5,
                           NSStrokeColorAttributeName:strokeColor}
                   range:NSMakeRange(0, [title length])];
    //[self.solidRedButton setAttributedTitle:title forState:UIControlStateNormal];
    NSString *outPut = (NSString *)title;
    NSLog(@"Should be thingy");
    //NSLog(outPut);
    return title;*/
}

- (NSString *)contents
{
    /*
     NSArray *rankStrings = [PlayingCard rankStrings];
     return [rankStrings[self.rank] stringByAppendingString:self.suit];
     */
    /*
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"●"];
    
    UIColor *foregroundColor = [UIColor redColor];
    UIColor *strokeColor = [foregroundColor copy];
    foregroundColor = [foregroundColor colorWithAlphaComponent:1];
    
    [title setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                           NSStrokeWidthAttributeName:@-5,
                           NSStrokeColorAttributeName:strokeColor}
                   range:NSMakeRange(0, [title length])];
    //[self.solidRedButton setAttributedTitle:title forState:UIControlStateNormal];
    return (NSString *)title;
     */
    
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.shape];
    
    UIColor *foregroundColor = [UIColor redColor];
    UIColor *strokeColor = [foregroundColor copy];
    foregroundColor = [foregroundColor colorWithAlphaComponent:1];
    
    [title setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                           NSStrokeWidthAttributeName:@-5,
                           NSStrokeColorAttributeName:strokeColor}
                   range:NSMakeRange(0, [title length])];
    //[self.solidRedButton setAttributedTitle:title forState:UIControlStateNormal];
    NSString *outPut = (NSString *)title;
    NSLog(@"Should be thingy");
    //NSLog(outPut);
    return title;
    //return (NSString *)title;
     
    //NSString *myStrings = @"h";
    //return myStrings;
}


+ (NSArray *)shapeArray{
    return @[@"■",@"▲",@"●"];
}
+ (NSArray *)colorArray{
    //return @[@1,@2,@3];
    return @[[UIColor greenColor], [UIColor redColor], [UIColor blueColor]];
}
+ (NSArray *)countArray{
    return @[@1,@2,@3];
}
+ (NSArray *)alphaArray{
    return @[@0,@.5,@1];
}

@synthesize shape = _shape;
- (void)setShape:(NSString *)shape{
    if ([[SetCard shapeArray] containsObject:shape]) {
        _shape = shape;
    }
}
@synthesize color = _color;
- (void)setColor:(UIColor *)color{
    if ([[SetCard colorArray] containsObject:color]){
        _color = color;
    }
}
@synthesize alpha = _alpha;
- (void)setAlpha:(float)alpha{
    if (alpha <= 1) {
    //if ([[SetCard alphaArray] containsObject:alpha]){
        _alpha = alpha;
    }
}
@synthesize count = _count;
- (void)setCount:(NSUInteger)count{
    if(count <= 3){
        _count = count;
    }
}



@end
