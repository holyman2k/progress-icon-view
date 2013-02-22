//
//  ProgressView.h
//  ProgressIcon
//
//  Created by Charlie Wu on 11/02/13.
//  Copyright (c) 2013 Charlie Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView
@property (strong, nonatomic) UIColor *progressColor;
- (void)setProgress:(float)percentage;

- (void)setFillModeWithColor:(UIColor *)color;

- (void)setStrokModeWithColor:(UIColor *)color andThickness:(CGFloat)thickness;
@end
