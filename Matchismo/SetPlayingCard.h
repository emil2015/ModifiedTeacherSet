//
//  SetPlayingCard.h
//  Matchismo
//
//  Created by David Gross on 10/16/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetCard.h"

@interface SetPlayingCard : SetCard
/*
Shape
Count
Alpha
Color
 place holder
*/
@property (strong, nonatomic) NSString *shape;
//+ (NSInteger) count;
//might be able to use color for both color and alpha
@property (strong, nonatomic) UIColor *color;

- (void)setCount:(NSUInteger)counts;
+ (NSUInteger)maxCount;
@property (nonatomic) NSUInteger count;
+ (NSArray *)validShape;

@end
