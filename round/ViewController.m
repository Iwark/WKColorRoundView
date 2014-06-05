//
//  ViewController.m
//  round
//
//  Created by Kohei Iwasaki on 2014/06/05.
//  Copyright (c) 2014年 Kohei Iwasaki. All rights reserved.
//

#import "ViewController.h"
#import "WKColorRoundView.h"

@interface ViewController ()
{
    WKColorRoundView *_roundView;
    NSTimer *_timer;
    float _pos;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _roundView = [[WKColorRoundView alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
    [self.view addSubview:_roundView];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f
                                              target:self
                                            selector:@selector(draw)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)draw
{
    _roundView.end = _pos + 3.0f;
    [_roundView setNeedsDisplay];
    
    _pos += 3.0f;
    
    if(_pos >= 360.0f){
        [_timer invalidate];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
