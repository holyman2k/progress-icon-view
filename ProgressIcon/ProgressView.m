//
//  ProgressView.m
//  ProgressIcon
//
//  Created by Charlie Wu on 11/02/13.
//  Copyright (c) 2013 Charlie Wu. All rights reserved.
//

#import "ProgressView.h"
#include <math.h>
#define ProgresStockThinkness 0.5
#define PaddingPercentage .7

@interface ProgressView()
@property float percentage;
@property CGFloat linkThickness;
@property BOOL doFill;
@end

@implementation ProgressView
@synthesize percentage = _percentage;
@synthesize progressColor = _progressColor;
@synthesize doFill = _doFill;
@synthesize linkThickness = _linkThickness;

#pragma mark - accessors

- (UIColor *)progressColor {
    if (!_progressColor) _progressColor = [UIColor blackColor];
    return _progressColor;
}

#pragma mark - set modes

- (void)setFillModeWithColor:(UIColor *)color
{
    self.doFill = YES;
    self.progressColor = color;
    self.linkThickness = .5;
    
}

- (void)setStrokModeWithColor:(UIColor *)color andThickness:(CGFloat)thickness
{
    self.doFill = NO;
    self.linkThickness = thickness;
    self.progressColor = color;
}

#pragma mark - setup

- (void)setup
{
    self.contentMode = UIViewContentModeRedraw;
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
}
- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if (self.percentage == 0) return;
    
    CGFloat centerX = self.frame.size.width / 2;
    CGFloat centerY = self.frame.size.height / 2;
    CGFloat radius = (self.frame.size.width > self.frame.size.height ? self.frame.size.height : self.frame.size.width) / 2 * PaddingPercentage;
    CGFloat startAngle = M_PI * 1.5;
    CGFloat endAngle = (self.percentage * 2 + 1.5) * M_PI;
//    NSLog(@"x: %f, y: %f, start angle: %f, end angle: %f", centerX, centerY, startAngle, endAngle);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    if (self.doFill) CGContextMoveToPoint(context, centerX, centerY);
    CGContextAddLineToPoint(context, centerX, centerY - radius);
    CGContextAddArc(context, centerX, centerY, radius, startAngle, endAngle, 0);
    CGContextSetStrokeColorWithColor(context, self.progressColor.CGColor);
    CGContextSetFillColorWithColor(context, self.progressColor.CGColor);
    CGContextSetLineWidth(context, self.linkThickness);
    if (self.doFill) {
        CGContextDrawPath(context, kCGPathFillStroke);   
    } else {
        CGContextStrokePath(context);
    }
}

- (void)setProgress:(float)percentage
{
    self.percentage = percentage;
    [self setNeedsDisplay];
}

@end
