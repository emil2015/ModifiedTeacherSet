//
//  setHistoryViewController.m
//  Matchismo
//
//  Created by David Gross on 10/22/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "setHistoryViewController.h"

@interface setHistoryViewController ()
//@property (strong, nonatomic) IBOutlet UILabel *historyLabel;

@end

@implementation setHistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setStatusHistory:(NSArray *)statusHistory{
    if(!statusHistory){
        _statusHistory = statusHistory;
    }
}



- (void)setHistoryLabel:(UILabel *)historyLabel{
    /*
    NSString *temp = _historyLabel.text;
    [temp stringByAppendingString:historyLabel.text];
    [temp stringByAppendingString:@"\n"];
    _historyLabel.text = temp;
    [self updateUI];
     */
    //====
    //_historyLabel = historyLabel;
    //    [self updateUI];
    
}

- (void)updateUI
{
    /*
    int colorfulCharacters = [[self charactersWithAttribute:NSForegroundColorAttributeName] length];
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%d Colorful Characters", colorfulCharacters];
    
    int outlinedCharacters = [[self charactersWithAttribute:NSStrokeWidthAttributeName] length];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%d Outlined Characters", outlinedCharacters];
     */
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
