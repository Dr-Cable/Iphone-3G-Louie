//
//  FirstViewController.m
//  Mega Looping Louie 3G
//
//  Created by Stefan Schlereth on 12/18/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController
@synthesize segmentcontrolSpeed;
@synthesize sliderMaxspeed;
@synthesize sliderTurbospeed;
@synthesize switchBack;
@synthesize switchStop;
@synthesize switchTurbo;
@synthesize statusLable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Mode", @"Mode");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
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
	
    rscMgr = [[RscMgr alloc] init];
    [rscMgr setDelegate:self];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.

/*    sliderMaxspeed = [[UISlider alloc] initWithFrame: self.view.bounds];
    [self.view addSubview:sliderMaxspeed];
//    sliderSteps = @"@"1"; @"1.5"; @"2"; @"2.5"; @"3.0"; @"3.5"; @"4"";
    NSInteger numberOfSteps = ((float)[sliderSteps count] - 1);
    sliderMaxspeed.maximumValue = numberOfSteps;
    sliderMaxspeed.minimumValue = 1;
    
    sliderMaxspeed.continuous = YES;
    {[sliderMaxspeed addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
//    self.stepValue = 1.0f;
//    self.lastStep = (self.sliderMaxspeed.value) / self.stepValue;
}*/

//- (IBAction)sliderValueChanged:(id)sender {

//    float newStep = roundf((sliderMaxspeed.value) / self.stepValue);
//    self.sliderMaxspeed.value = newStep * self.stepValue;

}

- (void)viewDidUnload
{
    [self setSegmentcontrolSpeed:nil];
    [self setSliderMaxspeed:nil];
    [self setSwitchBack:nil];
    [self setSwitchStop:nil];
    [self setSwitchTurbo:nil];
    [self setSliderTurbospeed:nil];
    [self setStatusLable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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

- (void) cableConnected:(NSString *)protocol {
    [rscMgr setBaud:9600];
    [rscMgr open];
    self.statusLable.text = @"connected";
    self.statusLable.textColor = [UIColor greenColor];
}

- (void) cableDisconnected {
    self.statusLable.text = @"disconnected";
    self.statusLable.textColor = [UIColor redColor];
}

- (void) portStatusChanged {
}

- (void) readBytesAvailable:(UInt32)numBytes {
    int bytesRead = [rscMgr read:rxBuffer Length:numBytes];
    NSLog( @"Read %d bytes from serial cable.", bytesRead );
    
    NSString *string =nil;
    for(int i = 0;i < numBytes;++i) {
        if( string )  {
            string = [NSString stringWithFormat:@"%@%c", string, rxBuffer[i]];
        }
        else {
             string = [NSString stringWithFormat:@"%c", rxBuffer[i]];
        }
    }
    NSLog(@"Received: %@", string);
}

- (BOOL) rscMessageReceived:(UInt8 *)msg TotalLength:(int)len {
    return FALSE;
}
                      
- (void) didReceivePortConfig {
}


- (IBAction)segmentControl:(id)sender {
    NSLog(@"Changed SegmentedConrol %i to %i", [sender tag],[(UISegmentedControl *)sender selectedSegmentIndex]);
    txBuffer[0] = [sender tag];
    txBuffer[1] = [(UISegmentedControl *)sender selectedSegmentIndex];
    int bytesWritten = [rscMgr write:txBuffer Length:2];
    NSLog( @"Wrote %d bytes to serial cable.", bytesWritten);
    
}

- (IBAction)sliderValueChanged:(id)sender {
    NSLog(@"Changed Slider %i to %f", [sender tag],[(UISlider *)sender value]);
    txBuffer[0] = [sender tag];
    txBuffer[1] = [(UISlider *)sender value];
    int bytesWritten = [rscMgr write:txBuffer Length:2];
    NSLog( @"Wrote %d bytes to serial cable.", bytesWritten);

}

- (IBAction)switchControl:(id)sender {
    NSLog(@"Toggled switch %i to %i", [sender tag],[(UISwitch *)sender isOn]);
    txBuffer[0] = [sender tag];
    txBuffer[1] = [(UISwitch *)sender isOn];
    int bytesWritten = [rscMgr write:txBuffer Length:2];
    NSLog( @"Wrote %d bytes to serial cable.", bytesWritten);
    
}

@end
