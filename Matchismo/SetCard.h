//
//  SetCard.h
//  Matchismo
//
//  Created by David Gross on 10/6/14.
//  Copyright (c) 2014 GrossProfitEnterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

/*
 shape
 color
 shade
 count
 
 NSString shape;
 UIColor color;
 Shading: 0 = outline
 .2 = shaded
 1 = solid
 NSUinteger count;
*/

@property (strong, nonatomic) NSString *shape;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) NSInteger shade;
@property (nonatomic) NSUInteger count;

//By invoking it here in addition to the .m it makes it public for other people to use.
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
- (int) match:(NSArray *)otherCards;




@end
