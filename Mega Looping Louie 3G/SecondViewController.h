//
//  SecondViewController.h
//  Mega Looping Louie 3G
//
//  Created by Stefan Schlereth on 12/18/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController 
@property (strong, nonatomic) IBOutlet UITextField *textfieldStoptime;
@property (strong, nonatomic) IBOutlet UITextField *textfieldBacktime;
@property (strong, nonatomic) IBOutlet UITextField *textfieldTurbotime;
@property (strong, nonatomic) IBOutlet UITextField *textfieldTurboresettime;


- (IBAction) screentouch:(id) sender;

@end
