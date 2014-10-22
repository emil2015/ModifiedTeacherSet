//
//  MatchCardsViewController.m
//  Matchismo
//
//  Created by sameh on 3/26/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "MatchCardsViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface MatchCardsViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchFeebackLabel;
@property (weak, nonatomic) IBOutlet UISwitch *cardMatchSlider;
@end

@implementation MatchCardsViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}


- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

//
// Sliding this switch selects between matching 2 or 3 cards
//
- (IBAction)touchCardMatchSlider:(id)sender {
    if ([sender isOn]) {
        [self.game matchThreeCards];
    } else {
        [self.game matchTwoCards];
    } // end if isOn
}

//
// Touching the "Deal" button resets the game
//
- (IBAction)touchDealButton:(id)sender {
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                              usingDeck:[self createDeck]];
    [self.game resetScore];
    [self updateUI];
    self.cardMatchSlider.enabled = YES;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    self.cardMatchSlider.enabled = NO;
}


- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.matched;
    } // end for cardButton
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.matchFeebackLabel.text = [NSString stringWithFormat:@"%@", [self.game feedback]];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)imageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}

@end
