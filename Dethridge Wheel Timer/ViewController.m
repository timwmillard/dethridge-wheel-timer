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

@synthesize dethridgeWheel = _dethridgeWheel;

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
        self.unitsLabel.text = @"";
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
    
    if (elapsed >= 120.0) {
        [self timeout];
        return;
    }
    
    self.dethridgeWheel.timePerRevolution = [NSNumber numberWithDouble:elapsed];
    
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
    
    if (self.dethridgeWheel.timePerRevolution.doubleValue == 0.0) return;
    
    if (self.dethridgeWheel.timePerRevolution.doubleValue < 1.0) {
        [self outOfRange];
        return;
    }
    
    int fractionDigits;
    if (self.dethridgeWheel.flowRate.doubleValue>=100)
        fractionDigits = 0;
    else
        fractionDigits = 1;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.minimumFractionDigits = fractionDigits;
    formatter.maximumFractionDigits = fractionDigits;
    self.flowRateLabel.text = [formatter stringFromNumber:self.dethridgeWheel.flowRate];
    self.unitsLabel.text = @"ML/d";
    
}

- (IBAction)changeType:(id)sender
{
    switch (self.typeSegmentControl.selectedSegmentIndex ) {
        case 0: self.dethridgeWheel.type = SmallWheel;
            break;
        case 1: self.dethridgeWheel.type = LargeWheel;
            break;
        case 2: self.dethridgeWheel.type = LongWheel;
            break;
    }
    [self updateFlowRate];
}

- (IBAction)reset:(id)sender
{
    self.dethridgeWheel.timePerRevolution = nil;
    
    self.timerLabel.text = @"0.0 sec";
    self.flowRateLabel.text = @"";
    self.unitsLabel.text = @"";
    running = NO;
}

- (void)timeout
{
    running = NO;
    self.flowRateLabel.text = @"";
    self.unitsLabel.text = @"Timed Out";
}

- (void)outOfRange
{
    running = NO;
    self.flowRateLabel.text = @"";
    self.unitsLabel.text = @"Out Of Range";
}

@end
