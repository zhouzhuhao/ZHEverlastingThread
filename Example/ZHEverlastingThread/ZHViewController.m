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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	self.thread = [[ZHEverlastingThread alloc] init];

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
