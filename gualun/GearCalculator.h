//
//  GearCalcator.h
//  gualun
//
//  Created by 杨裕欣 on 12-2-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GearCalculatorDelegate

- (void)didFinishCalculate: (NSDictionary *)calculateResult;

@end

@interface GearCalculator : NSObject
@property (nonatomic, weak) id<GearCalculatorDelegate> delegate;
- (void)startCaculateWithGearRatio: (double) ratio;
@end
