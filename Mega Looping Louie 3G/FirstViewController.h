//
//  FirstViewController.h
//  Mega Looping Louie 3G
//
//  Created by Stefan Schlereth on 12/18/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RscMgr.h"

#define BUFFER_LEN 1024

@interface FirstViewController : UIViewController <RscMgrDelegate> {
    UISegmentedControl *segmentcontrolSpeed;
    UISlider *sliderMaxspeed;
    UISlider *sliderTurbospeed;
    UISwitch *switchBack;
    UISwitch *switchStop;
    UISwitch *switchTurbo;
    
    RscMgr *rscMgr;
    UInt8 rxBuffer[BUFFER_LEN];
    UInt8 txBuffer[BUFFER_LEN];
    
}
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentcontrolSpeed;
@property (nonatomic, retain) IBOutlet UISlider *sliderMaxspeed;
@property (nonatomic, retain) IBOutlet UISlider *sliderTurbospeed;
@property (nonatomic, retain) IBOutlet UISwitch *switchBack;
@property (nonatomic, retain) IBOutlet UISwitch *switchStop;
@property (nonatomic, retain) IBOutlet UISwitch *switchTurbo;
@property (strong, nonatomic) IBOutlet UILabel *statusLable;

- (IBAction)segmentControl:(id)sender;

- (IBAction)sliderValueChanged:(id)sender;

- (IBAction)switchControl:(id)sender;


@end
