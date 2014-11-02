//
//  ViewController.m
//  Drawing
//
//  Created by Sameh Fakhouri on 10/29/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "ViewController.h"
#import "SetCardView.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SetCardView *singleSolidGreen;
@property (weak, nonatomic) IBOutlet SetCardView *singleOutlinedPurple;
@property (weak, nonatomic) IBOutlet SetCardView *tripleStrippedRed;
@property (weak, nonatomic) IBOutlet SetCardView *dsdd;

@property (strong, nonatomic) SetMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(SetCardView) NSArray *setCardViews;

@end

@implementation ViewController

-(SetMatchingGame *)game{
    if (!_game) { NSLog(@"Game nil");
        _game = [[SetMatchingGame alloc] initWithCardCount:[self.setCardViews count]
                                                 usingDeck:[self createDeck]];
    }
    return _game;
}

- (SetCardDeck *)createDeck
{
    return [[SetCardDeck alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    /*
     //"▲", @"◼︎", @"●"
    SetCardView *setCard = (SetCardView *) self.singleSolidGreen;
    setCard.symbol = @"Diamond";
    setCard.color = [UIColor greenColor];
    setCard.shade = @"Solid";
    setCard.count = 1;
    
    setCard = (SetCardView *) self.singleOutlinedPurple;
    setCard.symbol = @"Squiggle";
    setCard.color = [UIColor purpleColor];
    setCard.shade = @"outlined";
    setCard.count = 1;
    
    setCard = (SetCardView *) self.tripleStrippedRed;
    setCard.symbol = @"Oval";
    setCard.color = [UIColor redColor];
    setCard.shade = @"Striped";
    setCard.count = 3;
    
    setCard = (SetCardView *) self.dsdd;
    setCard.symbol = @"Diamond";
    setCard.color = [UIColor blueColor];
    setCard.shade = @"Striped";
    setCard.count = 2;
    */
    
    [self updateUI];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // this is a 3 card matching game
    
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchDealButton:(id)sender
{
    //[super touchDealButton:sender];
    
    // this is a 3 card matching game
    self.game = nil;
    [self updateUI];

}
//TODO This is calling the deal button, I need it to call the updateUI method? This has been linked to the actual card views.
- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    //[super touchDealButton:sender];
    
    // this is a 3 card matching game
    //[self.game matchThreeCards];
}

- (void)updateUI
{NSLog(@"updateUI called");
    for (SetCardView *cardButton in self.setCardViews) {
        
        NSUInteger cardIndex = [self.setCardViews indexOfObject:cardButton];
        SetCard *card = [self.game cardAtIndex:cardIndex];
        
        cardButton.color = [card color];
        cardButton.count = [card count];
        cardButton.symbol = [card shape];
        //"▲", @"◼︎", @"●"
        
        if ([card alpha] == 1) {
            cardButton.shade = @"Solid";
        }else
            if ([card alpha] > 0 && [card alpha] < 1){
                cardButton.shade = @"Striped";
            }else
                if ([card alpha] == 0){
                    cardButton.shade = @"Outlined";
                }
    
    }
    
}


/*
- (void)updateUI
{
    //TODO: CARD ARE NIL. NEED TO SEE WHY THAT IS. CHECK THE POSSIBLITY OF IT BEING BECAUSE OF NON INSTANTIATING SOMETHING OR ANOTHER....
    for (SetCardView *setViews in self.setCardViews){
        NSUInteger cardIndex = [self.setCardViews indexOfObject:setViews];
        
        Card *card = [self.game cardAtIndex:cardIndex];
        SetCard *setCard = (SetCard *)card;
        setViews.color = [setCard color];
        setViews.count = [setCard count];
        setViews.symbol = [setCard symbol];
        //"▲", @"◼︎", @"●"
        
        if ([setCard shade] == 1) {
            setViews.shade = @"Solid";
        }else
            if ([setCard shade] == .1){
            setViews.shade = @"Striped";
        }else
            if ([setCard shade] == 0){
            setViews.shade = @"Outlined";
        }
    }
 */
    
    //"Solid", @"Striped", @"Outlined"
    /*
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        if ([card isKindOfClass:[SetCard class]]) {
     
            SetCard *setCard = (SetCard *)card;
            NSString *titleString = setCard.contents;
            
            NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:titleString];
            
            UIColor *foregroundColor = [setCard color];
            UIColor *strokeColor = [foregroundColor copy];
            foregroundColor = [foregroundColor colorWithAlphaComponent:setCard.shade];
            
            [title setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                                   NSStrokeWidthAttributeName:@-5,
                                   NSStrokeColorAttributeName:strokeColor}
                           range:NSMakeRange(0, [title length])];
            [cardButton setAttributedTitle:title forState:UIControlStateNormal];
            cardButton.enabled = !card.matched;
            if (setCard.isChosen && !setCard.isMatched) {
                [cardButton setBackgroundImage:[UIImage imageNamed:@"selectedCardFront"] forState:UIControlStateNormal];
            } else {
                [cardButton setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
            }
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long) self.game.score];
    //    self.feedbackLabel.text = [NSString stringWithFormat:@"%@", [self.game feedback]];
    [self.feedbackLabel setAttributedText:[self.game feedback]];
*/


@end
