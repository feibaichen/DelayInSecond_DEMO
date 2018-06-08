# DelayInSecond_DEMO


- (void)allMethod {

// 1.

[self performSelector:@selector(delayMethod) withObject:nil afterDelay:2.0];

[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(delayMethod) object:nil];

[NSObject cancelPreviousPerformRequestsWithTarget:self];

// 2.

NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(delayMethod) userInfo:nil repeats:NO];

[timer invalidate];

// 3.

[NSThread sleepForTimeInterval:2.0];

[self delayMethod];

// 4.

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

作者：0_0
链接：https://www.jianshu.com/p/2a65912b56f7
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
