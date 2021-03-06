//
//  ProgressView.h
//  ProgressIcon
//
//  Created by Charlie Wu on 11/02/13.
//  Copyright (c) 2013 Charlie Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

- (void)setProgress:(float)percentage;

- (void)setFillModeWithColor:(UIColor *)color;

- (void)setStrokModeWithColor:(UIColor *)color andThickness:(CGFloat)thickness;

- (void)setStrokFillModeWithColor:(UIColor *)color andThickness:(CGFloat)thickness;
@end
