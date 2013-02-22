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
@end

@implementation ProgressView
@synthesize percentage = _percentage;
@synthesize progressColor = _progressColor;

- (UIColor *)progressColor {
    if (!_progressColor) _progressColor = [UIColor blackColor];
    return _progressColor;
}

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
    CGContextMoveToPoint(context, centerX, centerY);
    CGContextAddLineToPoint(context, centerX, centerY - radius);
    CGContextAddArc(context, centerX, centerY, radius, startAngle, endAngle, 0);
    CGContextSetStrokeColorWithColor(context, self.progressColor.CGColor);
    CGContextSetFillColorWithColor(context, self.progressColor.CGColor);
    CGContextSetLineWidth(context, ProgresStockThinkness);
//    CGContextStrokePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)setProgress:(float)percentage
{
    self.percentage = percentage;
    [self setNeedsDisplay];
}

@end
