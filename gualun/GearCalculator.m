//
//  GearCalcator.m
//  gualun
//
//  Created by 杨裕欣 on 12-2-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GearCalculator.h"

@interface GearCalculator()
- (void) doCalcateWithGearRatio: (double) ratio;
@end

@implementation GearCalculator
@synthesize delegate = _delegate;


- (void) doCalcateWithGearRatio: (double) ratio
{
    NSLog(@"%f", ratio);
    NSTimeInterval startTime = [[[NSDate alloc] initWithTimeIntervalSinceNow:0] timeIntervalSince1970];
    int a, b, c, d, sum = 0;
    for (a = 24; a <= 105; a++) {
        for (b = 24; b <= 105; b++) {
            for (c = 24; c <= 105; c++) {
                for (d = 24; d <= 105; d++) {
                    double tempRatio = (double)a / (double)b * (double)c / (double)d;
                    if (fabs(tempRatio - ratio) < 0.001) {
                        //NSLog(@"a = %d, b = %d, c = %d, d = %d", a, b, c, d);
                        //NSLog(@"%f", tempRatio);
                        sum++;
                    }
                }
            }
        }
    }
    NSLog(@"Finished");
    NSTimeInterval stopTime = [[[NSDate alloc] initWithTimeIntervalSinceNow:0] timeIntervalSince1970];
    NSLog(@"%f", stopTime - startTime);
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    [result setValue:[NSNumber numberWithInt:sum ] forKey:@"TotalResultsCount"];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.delegate didFinishCalculate:result];                    
    });    
}

- (void)startCaculateWithGearRatio: (double) ratio
{
    dispatch_queue_t calculateQ = dispatch_queue_create("gear calcucate", NULL);
    dispatch_async(calculateQ, ^{
        [self doCalcateWithGearRatio: ratio];
    });
}
@end
