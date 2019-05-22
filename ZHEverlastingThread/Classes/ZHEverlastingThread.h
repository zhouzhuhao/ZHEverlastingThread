//
//  ZHEverlastingThread.h
//  Pods-ZHEverlastingThread_Example
//
//  Created by John on 2019/5/22.
//

#import <Foundation/Foundation.h>

typedef void (^ZHEverlastingThreadTask)(void);
NS_ASSUME_NONNULL_BEGIN

@interface ZHEverlastingThread : NSObject

- (void)zh_executeTask:(ZHEverlastingThreadTask)task;
- (void)zh_stop;

@end

NS_ASSUME_NONNULL_END
