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

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
