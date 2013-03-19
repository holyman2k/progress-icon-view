Progress View Icon
==================

Used as an icon on navigation bar/tool bar to indicate progress such as downloading of image 
or can be used as a view such as place in placeholder for image while downloading

I created it to give user progress percentage when download image for a photo view

usage 

    ProgressView* progressView = [[ProgressView alloc]init];
    //float percentage, 1 - 100%, 0.5 - 50%, 0 - 0%
    [progressView setProgress:0.5]; 
    
set mode

    [progressView setFillModeWithColor:[UIColor whiteColor]] // filled progress cycle
    
    [progressView setStrokModeWithColor:[UIColor whiteColor] andThickness:10];   // not filled progress cycle, use a line
    
    [progressView setStrokFillModeWithColor:[UIColor whiteColor] andThickness:10];  // progress cycle fill by percentage of progress
