//
//  SetPlayingCard2.h
//  Matchismo
//
//  Created by David Gross on 10/19/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCard.h"

@interface SetPlayingCard2 : SetCard

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) float alpha;

@property (strong, nonatomic) NSAttributedString *colorAndAlpha;



+ (NSArray *)validColors;
+ (NSArray *)validAlphaValue;
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@property (strong, nonatomic) NSString *shape;
//@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *fill;
//@property (nonatomic) int count;



@end
