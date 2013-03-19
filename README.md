progress view icon
==================

Used as an icon or a larger view to show progress such as downloading an image.

I created it to give user progress percentage when download image for a photo view

usage 
    ProgressView* progressView = [[ProgressView alloc]init];
    [progressView setProgress:0.5]; //float percentage, 1 - 100%, 0.5 - 50%, 0 - 0%
    
set mode
    [progressView setFillModeWithColor:[UIColor whiteColor]] // filled progress cycle
    
    [progressView setStrokModeWithColor:[UIColor whiteColor] andThickness:10];   // not filled progress cycle, use a line
    
    [progressView setStrokFillModeWithColor:[UIColor whiteColor] andThickness:10];  // progress cycle fill by percentage of progress
