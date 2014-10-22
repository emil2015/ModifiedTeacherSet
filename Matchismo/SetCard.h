//
//  SetCard.h
//  Matchismo
//
//  Created by David Gross on 10/21/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *shape;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) NSUInteger count;
@property (nonatomic) float alpha;

+ (NSArray *)shapeArray;
+ (NSArray *)colorArray;
+ (NSArray *)countArray;
+ (NSArray *)alphaArray;

@property (strong, nonatomic) NSString *contents;

- (NSString *)aString;

- (int)match:(NSArray *)otherCards;

@end
