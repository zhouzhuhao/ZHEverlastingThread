//
//  ZHViewController.m
//  ZHEverlastingThread
//
//  Created by zhouzhuhao on 05/22/2019.
//  Copyright (c) 2019 zhouzhuhao. All rights reserved.
//

#import "ZHViewController.h"

#import <ZHEverlastingThread/ZHEverlastingThread.h>

@interface ZHViewController ()
@property (nonatomic,strong) ZHEverlastingThread *thread;
@end

@implementation ZHViewController

- (void)loadBundleImage {
//  1. 加载bundle中的图片资源，本质就是找到bundle位置，然后加载图片
//	2. NSClassFromString(@"ZHEverlastingThread") 一定程度上解耦
	Class cls = NSClassFromString(@"ZHEverlastingThread");
	NSBundle *bundle = [NSBundle bundleForClass:cls];
	NSURL *bundleUrl = [bundle URLForResource:@"ZHEverlastingThread" withExtension:@".bundle"];
		//	[[NSBundle mainBundle] URLForResource:@"ZHEverlastingThread" withExtension:@"bundle"];
	bundle = [NSBundle bundleWithURL:bundleUrl];
	UIImageView *imageview = [[UIImageView alloc] init];
	NSLog(@"bundle = %@",bundle);
	imageview.image = [UIImage imageNamed:@"nothinginview" inBundle:bundle compatibleWithTraitCollection:false];
	imageview.frame = CGRectMake(20, 50, 100, 330);
	[self.view addSubview:imageview];
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	self.thread = [[ZHEverlastingThread alloc] init];
//	[self loadBundleImage];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	
	[self.thread zh_executeTask:^{
		
		NSLog(@"current thread = %@",[NSThread currentThread]);
	}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
	
}

@end
