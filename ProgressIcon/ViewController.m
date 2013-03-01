//
//  ViewController.m
//  ProgressIcon
//
//  Created by Charlie Wu on 11/02/13.
//  Copyright (c) 2013 Charlie Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIPickerView *modePicker;
@property (strong, nonatomic) IBOutlet ProgressView *progressView;
@end

@implementation ViewController

@synthesize progressView = _progressView;
@synthesize modePicker = _modePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.progressView setFillModeWithColor:[UIColor blackColor]];
    self.modePicker.delegate = self;
    self.modePicker.dataSource = self;

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            return @"Fill";
            break;
        case 1:
            return @"Stroke";
            break;
        case 2:
            return @"Stoke Fill";
            break;
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            NSLog(@"fill");
            [self.progressView setFillModeWithColor:[UIColor whiteColor]];
            break;
        case 1:
            NSLog(@"stroke");
            [self.progressView setStrokModeWithColor:[UIColor whiteColor] andThickness:10];
            break;
        case 2:
            NSLog(@"stroke fill");
            [self.progressView setStrokFillModeWithColor:[UIColor whiteColor] andThickness:10];
            break;
    }
    [self.progressView setNeedsDisplay];
}  


- (IBAction)setProgress:(UISlider *)sender
{
    NSLog(@"slider %f", sender.value);
    
    [self.progressView setProgress:sender.value];
    
    [self.progressView setNeedsDisplay];
}

@end
