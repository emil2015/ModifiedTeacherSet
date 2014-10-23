//
//  matchHistoryViewController.m
//  Matchismo
//
//  Created by David Gross on 10/22/14.
//  Copyright (c) 2014 Lehman College. All rights reserved.
//

#import "matchHistoryViewController.h"

@interface matchHistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *statusHistoryTextView;

@end

@implementation matchHistoryViewController

- (void)updateUI
{

    self.statusHistoryTextView.text = self.statusString;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}



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
