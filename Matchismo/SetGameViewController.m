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

//====
@property (strong, nonatomic) NSMutableArray *statusHistory;

@end

@implementation SetGameViewController

- (NSMutableArray *)statusHistory
{
    if (!_statusHistory) _statusHistory = [[NSMutableArray alloc] init];
    return _statusHistory;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"d"]) {
        if ([segue.destinationViewController isKindOfClass:[setHistoryViewController class]]) {
            setHistoryViewController *tsvc = (setHistoryViewController *) segue.destinationViewController;
            //tsvc.statusHistory = self.statusHistory;
            
            NSMutableAttributedString *temp = [[NSMutableAttributedString alloc] initWithString:@""];
            for (NSAttributedString *aString in self.statusHistory) {
                [temp appendAttributedString:aString];
                [temp appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n"]];
            }
            tsvc.statusString = temp;
        }
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Put this updateUI in to deal the cards as soon as the view loads.
    [self updateUI];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

//--------------------------------------------------------------------
- (IBAction)returnedFromSegue:(UIStoryboardSegue *)segue {
    NSLog(@"Returned from second view");
}

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

    return card.contents;
}

- (UIImage *)imageForCard:(SetCard *)card{
    
    if (card.matched) {
            return [UIImage imageNamed:!card.isChosen ? @"selectedCardFront" : @"cardFront"];
    }else
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
         
        //[cardButton setAttributedTitle:card.contents forState:UIControlStateNormal];

        cardButton.enabled = !card.matched;
        
            [cardButton setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        

    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    //Regular string? Old way that did work
    //self.matchFeebackLabel.text = [NSString stringWithFormat:@"%@", [self.game feedback]];
    
    //TODO================================================================================================================================================================================================
    //This matchFeeBackLabel is broken.
    //self.matchFeebackLabel.text = [self.game feedback];

    [self.matchFeebackLabel setAttributedText:[self.game feedback]];
    //================================================================================================================================================================================================
    
    [self.statusHistory addObject:self.matchFeebackLabel.attributedText];
    
}



@end

