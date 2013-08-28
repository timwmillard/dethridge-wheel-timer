//
//  DethridgeWheel.m
//  Dethridge Wheel Timer
//
//  Created by Tim Millard on 8/07/13.
//  Copyright (c) 2013 Timix Technology. All rights reserved.
//

#import "DethridgeWheel.h"

@implementation DethridgeWheel

@synthesize type = _type;
@synthesize timePerRevolution = _timePerRevolution;

- (id)init
{
    self = [super init];
    if (self) {
        self.type = LargeWheel;
    }
    return self;
}

- (NSNumber *)flowRate
{
    double flowRate;

    double timePerRevolution = self.timePerRevolution.doubleValue;
    double volumePerRevolution = self.volumePerRevolution.doubleValue;
    
    flowRate = volumePerRevolution /  timePerRevolution * kLitresPerSecToMegalitresPerDay;

    return [NSNumber numberWithDouble:flowRate];
}

- (NSNumber *)volumePerRevolution
{
    double volumePerRevolution = 0;  // Volume per Revolution in litres per second
    switch (self.type) {
        case SmallWheel:
            volumePerRevolution = kSmallWheelLitresPerRevolution;
            break;
        case LargeWheel:
            volumePerRevolution = kLargeWheelLitresPerRevolution;
            break;
        case LongWheel:
            volumePerRevolution = kLongWheelLitresPerRevolution;
            break;
    }
    
    return [NSNumber numberWithDouble:volumePerRevolution];
}

@end
