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
#import "matchHistoryViewController.h"

@interface MatchCardsViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchFeebackLabel;
@property (weak, nonatomic) IBOutlet UISwitch *cardMatchSlider;
//=======
@property (strong, nonatomic) NSMutableArray *statusHistory;
@end

@implementation MatchCardsViewController

//=========Segue stuff
- (NSMutableArray *)statusHistory
{
    if (!_statusHistory) _statusHistory = [[NSMutableArray alloc] init];
    return _statusHistory;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"e"]) {
        if ([segue.destinationViewController isKindOfClass:[matchHistoryViewController class]]) {
            matchHistoryViewController *tsvc = (matchHistoryViewController *) segue.destinationViewController;
            //tsvc.statusHistory = self.statusHistory;
            
            NSMutableString *temp = [[NSMutableString alloc] initWithString:@""];
            for (NSMutableString *aString in self.statusHistory) {
                [temp appendString:aString];
                [temp appendString:[[NSMutableString alloc] initWithString:@"\n"]];
            }
            tsvc.statusString = temp;
            
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (IBAction)returnedFromSegue:(UIStoryboardSegue *)segue {
    NSLog(@"Returned from second view");
}
//==================



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
    
    [self.statusHistory addObject:self.matchFeebackLabel.text];
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
