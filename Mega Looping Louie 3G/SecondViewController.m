//
//  SecondViewController.m
//  Mega Looping Louie 3G
//
//  Created by Stefan Schlereth on 12/18/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController
@synthesize textfieldStoptime;
@synthesize textfieldBacktime;
@synthesize textfieldTurbotime;
@synthesize textfieldTurboresettime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Settings", @"Settings");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (IBAction) screentouch:(id)sender{
 
    [textfieldStoptime resignFirstResponder];
    [textfieldBacktime resignFirstResponder];
    [textfieldTurbotime resignFirstResponder];
    [textfieldTurboresettime resignFirstResponder];
    
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTextfieldStoptime:nil];
    [self setTextfieldBacktime:nil];
    [self setTextfieldTurbotime:nil];
    [self setTextfieldTurboresettime:nil];
 
    [super viewDidUnload];    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
