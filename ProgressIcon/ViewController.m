//
//  ViewController.m
//  ProgressIcon
//
//  Created by Charlie Wu on 11/02/13.
//  Copyright (c) 2013 Charlie Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize progressView = _progressView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.progressView setFillModeWithColor:[UIColor blackColor]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchFillMode:(UISwitch *)sender
{
    if (sender.selected) {
        [self.progressView setFillModeWithColor:[UIColor blackColor]];
    } else {
        [self.progressView setStrokModeWithColor:[UIColor blackColor] andThickness:3];
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
