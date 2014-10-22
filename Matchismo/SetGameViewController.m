//
//  SetGameViewController.m
//  Matchismo
//
//  Created by David Gross on 10/16/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "SetMatchingGame.h"
#import "SetCard.h"
#import "setHistoryViewController.h"
//#import "PlayingCardDeck.h"


@interface SetGameViewController()

@property (strong, nonatomic) SetCardDeck *deck;
@property (strong, nonatomic) SetMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchFeebackLabel;

@end

@implementation SetGameViewController

//--------------------------------------------------------------------
- (IBAction)returnedFromSegue:(UIStoryboardSegue *)segue {
    NSLog(@"Returned from second view");
}
//--------------------------------------------------------
-(SetMatchingGame *)game{
    if (!_game) { NSLog(@"Game nil");
        _game = [[SetMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]];
    }
    return _game;
}

-(SetCardDeck *)createDeck{
    NSLog(@"deck Made");
    return [[SetCardDeck alloc] init];
}

//----Reset----

- (IBAction)dealButton:(id)sender {
    _game = [[SetMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                              usingDeck:[self createDeck]];
    [self.game resetScore];
    [self updateUI];
}


//---------------
- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    //self.cardMatchSlider.enabled = NO;
    NSLog(@"Card Touched");
}

- (NSString *)titleForCard:(SetCard *)card
{
    //return card.isChosen ? card.contents : @"";
    //return card.contents;
    //return @"g";
    
    NSString *first = card.shape;
    if (card.count == 2) {
        return [first stringByAppendingString:first];
    }else
    if (card.count == 3) {
        return [[first stringByAppendingString:first] stringByAppendingString:first];
    }else
        return first;
    
    /*
    for (int i = 1; i < card.count; i++) {
        [result appendString:card.shape.copy];
    }*/
    
    //for loop to determin the number of items.
    
    //return card.aString; //This works, now I need to make it a string with attributes
}

- (UIImage *)imageForCard:(SetCard *)card
{
    return [UIImage imageNamed:card.isChosen ? @"selectedCardFront" : @"cardFront"];
}

- (void)updateUI
{NSLog(@"updateUI called");
    for (UIButton *cardButton in self.cardButtons) {
        
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        SetCard *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        NSMutableAttributedString *title;
        title = [[NSMutableAttributedString alloc] initWithString:[self titleForCard:card]];
        
     
        [title setAttributes:@{NSForegroundColorAttributeName:[card.color colorWithAlphaComponent:card.alpha],
                               NSStrokeWidthAttributeName:@-5,
                               NSStrokeColorAttributeName:card.color}
                       range:NSMakeRange(0, [title length])];
        [cardButton setAttributedTitle:title forState:UIControlStateNormal];
        
        cardButton.enabled = !card.matched;
        
            [cardButton setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        
        
        

    } // end for cardButton
    //self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    //self.matchFeebackLabel.text = [NSString stringWithFormat:@"%@", [self.game feedback]];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    //This is what is currently broken
    //if ([self.game feedback] != nil) {
        self.matchFeebackLabel.text = [NSString stringWithFormat:@"%@", [self.game feedback]];
    //}
    
    
}

//---------------


@end

/*
 - (void)updateUI
 {NSLog(@"updateUI called");
 for (UIButton *cardButton in self.cardButtons) {
 
 NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
 SetCard *card = [self.game cardAtIndex:cardIndex];
 
 [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
 [cardButton setTitleColor:card.color forState:UIControlStateNormal];
 //[cardButton.titleLabel setAlpha:card.alpha];
 *
 [cardButton setTitleColor:[UIColor colorWithRed:0.3 green:0.6 blue:0.9 alpha:0.5]
 //                                set 'alpha' to something less than 1. -----^^^
 forState:UIControlStateNormal];
 *



//[cardButton setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];

cardButton.enabled = !card.matched;

} // end for cardButton
//self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
//self.matchFeebackLabel.text = [NSString stringWithFormat:@"%@", [self.game feedback]];
}
*/