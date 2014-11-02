//
//  SetCard.m
//  Matchismo
//
//  Created by David Gross on 10/21/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards{
    if ([otherCards count] == 3) {
        SetCard *first  = [otherCards objectAtIndex:0];
        SetCard *second = [otherCards objectAtIndex:1];
        SetCard *third = [otherCards objectAtIndex:2];
        
        if  (
            ((first.shape == second.shape && second.shape == third.shape) || (first.shape != second.shape && second.shape != third.shape && third.shape != first.shape)) &&
             
            ((first.count == second.count && second.count == third.count) || (first.count != second.count && second.count != third.count && third.count != first.count)) &&
             
            ((first.alpha == second.alpha && second.alpha == third.alpha) || (first.alpha != second.alpha && second.alpha != third.alpha && third.alpha != first.alpha)) &&
            
            ((first.color == second.color && second.color == third.color) || (first.color != second.color && second.color != third.color && third.color != first.color))) {
            NSLog(@"matched");
            return 10;
        }else
            NSLog(@"tried but not mateched");
            return 0;
    }else
        return 0;
}

- (NSString *)contents{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.shape];
    
    UIColor *foregroundColor = [UIColor redColor];
    UIColor *strokeColor = [foregroundColor copy];
    foregroundColor = [foregroundColor colorWithAlphaComponent:1];
    
    [title setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                           NSStrokeWidthAttributeName:@-5,
                           NSStrokeColorAttributeName:strokeColor}
                   range:NSMakeRange(0, [title length])];
    NSMutableAttributedString *temp = title.copy;
    for (int i = 1; i < self.count; i++) {
        [title appendAttributedString:temp.copy];
    }
    
    
    return [title string];
}

- (NSMutableAttributedString *)contentsWithAttributes{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.shape];
    
    UIColor *foregroundColor = self.color;
    UIColor *strokeColor = [foregroundColor copy];
    
    foregroundColor = [foregroundColor colorWithAlphaComponent:self.alpha];
    
    [title setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                           NSStrokeWidthAttributeName:@-5,
                           NSStrokeColorAttributeName:strokeColor}
                   range:NSMakeRange(0, [title length])];
    NSMutableAttributedString *temp = title.copy;
    for (int i = 1; i < self.count; i++) {
        [title appendAttributedString:temp.copy];
    }
    
    //self.contents2 = title;
    return title;

}


//- (NSString *)aString{
    //return @"z";
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
    //NSString *outPut = (NSString *)title;
    NSLog(@"Should be thingy");
    //NSLog(outPut);
    
    return [title string];
     */
//    return [self contents];
//}



+ (NSArray *)shapeArray{
    return @[@"■",@"▲",@"●"];
}
+ (NSArray *)colorArray{
    //return @[@1,@2,@3];
    return @[[UIColor greenColor], [UIColor redColor], [UIColor purpleColor]];
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

@synthesize contents2 = _contents2;
- (void)setContents2:(NSAttributedString *)contents2{
    _contents2 = contents2;
}


@end
