//
//  MainViewController.m
//  gualun
//
//  Created by 杨裕欣 on 12-2-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "GearCalculator.h"

@interface MainViewController() <GearCalculatorDelegate>
@property (strong, nonatomic) IBOutlet UITextField *ratioTextField;

@end

@implementation MainViewController
@synthesize ratioTextField = _ratioTextField;
@synthesize calculator = _calculator;

- (GearCalculator *)calculator
{
    if (_calculator == nil) {
        _calculator = [[GearCalculator alloc] init];
        _calculator.delegate = self;
    }
    return _calculator;
}

- (IBAction)startCalculate:(id)sender {
    double ratio = [self.ratioTextField.text doubleValue];
    
    [self.calculator startCaculateWithGearRatio:ratio];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:indicator];
    [indicator startAnimating];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [self setRatioTextField:nil];
    [super viewDidUnload];
}

#pragma mark - GearCalculatorDelegate
- (void)didFinishCalculate: (NSDictionary *)calculateResult
{
    self.navigationItem.rightBarButtonItem = nil;    
    NSLog(@"%@", [calculateResult objectForKey:@"TotalResultsCount"]);
}
@end
