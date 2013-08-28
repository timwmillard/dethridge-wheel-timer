//
//  ViewController.m
//  Dethridge Wheel Timer
//
//  Created by Tim Millard on 8/07/13.
//  Copyright (c) 2013 Timix Technology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    BOOL running;
    NSTimeInterval startTime;
}

@synthesize DethridgeWheel = _DethridgeWheel;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.DethridgeWheel = [[DethridgeWheel alloc] init];
    
    [self reset:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startStopTimer:(id)sender
{
    if (running == NO) {
        // Start Timer
        running = YES;
        self.flowRateLabel.text = @"";
        startTime = [NSDate timeIntervalSinceReferenceDate];
        [self updateTime];
    } else {
        // Stop Timer
        running = NO;
        [self updateFlowRate];
    }
    
}

- (void)updateTime
{
    if (running == NO) return;
    
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsed = currentTime - startTime;
    
    self.DethridgeWheel.timePerRevolution = [NSNumber numberWithDouble:elapsed];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.minimumFractionDigits = 1;
    formatter.maximumFractionDigits = 1;
    NSString *time = [formatter stringFromNumber:[NSNumber numberWithDouble:elapsed]];
    self.timerLabel.text = [NSString stringWithFormat:@"%@ sec", time];
    
    [self performSelector:@selector(updateTime) withObject:self afterDelay:0.1];
}

- (void)updateFlowRate
{
    if (running == YES) return;
    
    if (self.DethridgeWheel.timePerRevolution.doubleValue == 0.0) return;
    
    int fractionDigits;
    if (self.DethridgeWheel.flowRate.doubleValue>=100)
        fractionDigits = 0;
    else
        fractionDigits = 1;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.minimumFractionDigits = fractionDigits;
    formatter.maximumFractionDigits = fractionDigits;
    self.flowRateLabel.text = [formatter stringFromNumber:self.DethridgeWheel.flowRate];
    
}

- (IBAction)changeType:(id)sender
{
    switch (self.typeSegmentControl.selectedSegmentIndex ) {
        case 0: self.DethridgeWheel.type = SmallWheel;
            break;
        case 1: self.DethridgeWheel.type = LargeWheel;
            break;
        case 2: self.DethridgeWheel.type = LongWheel;
            break;
    }
    [self updateFlowRate];
}

- (IBAction)reset:(id)sender
{
    self.timerLabel.text = @"0.0 sec";
    self.flowRateLabel.text = @"";
    running = NO;
}

@end
