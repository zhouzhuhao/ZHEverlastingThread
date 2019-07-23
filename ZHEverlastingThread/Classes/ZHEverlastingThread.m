//
//  ZHEverlastingThread.m
//  Pods-ZHEverlastingThread_Example
//
//  Created by John on 2019/5/22.
//

#import "ZHEverlastingThread.h"

@interface ZHThread : NSThread
@end
@implementation ZHThread
- (void)dealloc
{
	NSLog(@"%s", __func__);
}
@end

@interface ZHEverlastingThread ()
@property (strong, nonatomic) ZHThread *innerThread;
@end

@implementation ZHEverlastingThread

- (instancetype)init
{
	if (self = [super init]) {
		self.innerThread = [[ZHThread alloc] initWithTarget:self selector:@selector(zh_threadTask) object:nil];
		[self.innerThread start];
	}
	return self;
}

- (void)zh_threadTask{
	
	// 创建上下文（要初始化一下结构体）
	CFRunLoopSourceContext context = {0};
	
	// 创建source
	CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
	
	// 往Runloop中添加source
	CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
	
	// 销毁source
	CFRelease(source);
	
	// 启动
	CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
	
}


- (void)zh_executeTask:(ZHEverlastingThreadTask)task
{
	if (!self.innerThread || !task) return;
	// 执行  dddd  xxxxx
	[self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

- (void)zh_stop
{
	if (!self.innerThread) return;
	
	[self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

- (void)dealloc
{
	NSLog(@"%s", __func__);
	
	[self zh_stop];
}

#pragma mark - private methods
- (void)__stop
{
	
	CFRunLoopStop(CFRunLoopGetCurrent());
	self.innerThread = nil;
}

- (void)__executeTask:(ZHEverlastingThreadTask)task
{
	task();
}

@end
