//
//  DethridgeWheel.h
//  Dethridge Wheel Timer
//
//  Created by Tim Millard on 8/07/13.
//  Copyright (c) 2013 Timix Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SmallWheel = 1,
    LargeWheel,
    LongWheel
} DethridgeWheelType;

static const double kLitresPerSecToMegalitresPerDay = 0.0864;

static const double kSmallWheelLitresPerRevolution = 352.4;
static const double kLargeWheelLitresPerRevolution = 822.3;
static const double kLongWheelLitresPerRevolution = 840.0;

@interface DethridgeWheel : NSObject

@property (nonatomic) DethridgeWheelType type;
@property (strong, nonatomic) NSNumber *timePerRevolution;
@property (readonly, strong, nonatomic) NSNumber *flowRate;
@property (readonly, strong, nonatomic) NSNumber *volumePerRevolution;

@end
