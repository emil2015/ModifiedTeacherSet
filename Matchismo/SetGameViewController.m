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
//#import "PlayingCardDeck.h"


@interface SetGameViewController()

@property (strong, nonatomic) SetCardDeck *deck;
@property (strong, nonatomic) SetMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation SetGameViewController
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
    return card.contents;
    //return @"g";
}

- (void)updateUI
{NSLog(@"updateUI called");
    for (UIButton *cardButton in self.cardButtons) {
        
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        SetCard *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        //[cardButton setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.matched;
        
    } // end for cardButton
    //self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    //self.matchFeebackLabel.text = [NSString stringWithFormat:@"%@", [self.game feedback]];
}

//---------------


@end
