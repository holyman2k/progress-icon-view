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
    self.progressView.progressColor = [UIColor blueColor];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)progress20:(id)sender
{
    [self.progressView setProgress:.25];
    
    [self.progressView setNeedsDisplay];
}
- (IBAction)progress40:(id)sender
{
    [self.progressView setProgress:.5];
    
    [self.progressView setNeedsDisplay];
}
- (IBAction)setProgress:(UISlider *)sender
{
    NSLog(@"slider %f", sender.value);
    
    [self.progressView setProgress:sender.value];
    
    [self.progressView setNeedsDisplay];
}

@end
