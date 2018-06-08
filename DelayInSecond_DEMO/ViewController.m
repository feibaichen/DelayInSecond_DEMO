//
//  ViewController.m
//  DelayInSecond_DEMO
//
//  Created by Karl on 2018/6/8.
//  Copyright © 2018 Derek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 1.performSelector 方法

    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:2.0];

    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(delayMethod) object:nil];

    [NSObject cancelPreviousPerformRequestsWithTarget:self];

    // 2.NSTimer 定时器

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(delayMethod) userInfo:nil repeats:NO];

    [timer invalidate];

    
    
    // 3.注：此方法是一种阻塞执行方式，建议放在子线程中执行，否则会卡住界面。但有时还是需要阻塞执行，如进入欢迎界面需要沉睡3秒才进入主界面时

    [NSThread sleepForTimeInterval:2.0];

    [self delayMethod];

    // 4.GCD

    int64_t delayInSeconds = 10.0; // 延迟的时间

    /*
     *  delta:
     *
     *  @parameter 1.时间参照，从此刻开始计时
     *  @parameter 2.延时多久，此处为秒级，还有纳秒等: 10ull * NSEC_PER_MSEC
     */

    __weak typeof(self)weakSelf = self;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf delayMethod];
    });
}

- (void)delayMethod {
    NSLog(@"delayMethodEnd");
}

@end
