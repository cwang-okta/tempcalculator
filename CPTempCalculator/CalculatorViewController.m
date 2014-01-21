//
//  CalculatorViewController.m
//  CPTempCalculator
//
//  Created by Christine Wang on 1/19/14.
//  Copyright (c) 2014 Christine Wang. All rights reserved.
//

#import "CalculatorViewController.h"
#import "TriangleUIView.h"

@interface CalculatorViewController ()

@property (strong, nonatomic) IBOutlet UITextField *fromValue;
@property (strong, nonatomic) IBOutlet UILabel *fromUnitLabel;
@property (strong, nonatomic) IBOutlet UILabel *toValueLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fromUnitControl;
@property (strong, nonatomic) IBOutlet TriangleUIView *triangleView;

- (float)convertToCelsius:(float)fahrenheit;
- (float)convertToFahrenheit:(float)celsius;

@end

@implementation CalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.fromValue.delegate = self;
    self.fromValue.clearsOnBeginEditing = YES;
    
    [self clearLabels];

    self.triangleView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValuesFromLeft];
}

#pragma mark -

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self updateValuesFromLeft];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

#pragma mark -


- (float)convertToCelsius:(float)fahrenheit {
    return (fahrenheit - 32.0f) * 5.0f/9.0f;
}

- (float)convertToFahrenheit:(float)celsius {
    return celsius * 9.0f/5.0f + 32.0f;;
}

- (void)clearLabels {
    self.fromUnitLabel.text = @"";
    self.toValueLabel.text = @"";
}

- (void)updateValuesFromLeft {

    if (self.fromValue.text == nil || [self.fromValue.text isEqualToString:@""] ||  [self.fromUnitControl selectedSegmentIndex] == UISegmentedControlNoSegment) {
        [self clearLabels];
    } else {
        float convertedValue;
        NSString *displayFormat;
        if ([self.fromUnitControl selectedSegmentIndex] == 0) {
            convertedValue = [self convertToCelsius:[self.fromValue.text floatValue]];
            self.fromUnitLabel.text = @"°F";
            displayFormat = @"%0.2f °C";
        } else {
            convertedValue = [self convertToFahrenheit:[self.fromValue.text floatValue]];
            self.fromUnitLabel.text = @"°C";
            displayFormat = @"%0.2f °F";
        }
        self.toValueLabel.text = [NSString stringWithFormat:displayFormat, convertedValue];
    }
}

@end
