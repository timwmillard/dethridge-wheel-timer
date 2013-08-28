//
//  ViewController.h
//  Dethridge Wheel Timer
//
//  Created by Tim Millard on 8/07/13.
//  Copyright (c) 2013 Timix Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DethridgeWheel.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *flowRateLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *typeSegmentControl;

@property (strong, nonatomic) DethridgeWheel *DethridgeWheel;

- (IBAction)startStopTimer:(id)sender;
- (IBAction)changeType:(id)sender;
- (IBAction)reset:(id)sender;

@end
