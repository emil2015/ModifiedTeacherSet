//
//  SetGameViewController.m
//  Matchismo
//
//  Created by David Gross on 10/16/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetPlayingCardDeck.h"
#import "SetGame2.h"
//#import "PlayingCardDeck.h"


@interface SetGameViewController()

@property (strong, nonatomic) SetDeck *deck;
@property (strong, nonatomic) SetGame2 *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation SetGameViewController
-(SetGame2 *)game{
    if (!_game) { NSLog(@"Game nil");
        _game = [[SetGame2 alloc] initWithCardCount:[self.cardButtons count]
                                         usingDeck:[self createDeck]];
    }
    return _game;
}

-(SetPlayingCardDeck *)createDeck{
    return [[SetPlayingCardDeck alloc] init];
}

/*
@implementation SetGameViewController
-(SetGame *)game{
    if (!_game) {
        _game = [[SetGame alloc] initWithCardCount:[self.cardButtons count]
                                         usingDeck:[self createDeck]];
    }
    return _game;
}

-(SetDeck *)createDeck{
    return [[SetPlayingCardDeck alloc] init];
}
*/
/*
- (SetGame *)game{
    NSLog(@"init method called in view controller");
    if (!_game) {NSLog(@"---------------------------");
        _game = [[SetGame alloc] initWithCardCount:[self.cardButtons count]
                                         usingDeck:[self createDeck]];
    }
    return _game;
}

- (SetDeck *)createDeck
{
    return [[SetPlayingCardDeck alloc] init];
}
*/

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
