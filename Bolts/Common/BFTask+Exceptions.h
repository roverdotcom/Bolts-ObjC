/*
 *  Copyright (c) 2016, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 */

#pragma once

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BFTask;

@protocol BFTaskExceptionHandlingDelegate

- (void)handleFaultedTask:(BFTask *)task;

- (BOOL)shouldCatchExceptions;

@end

@interface BFTaskExceptionDelegateHolder: NSObject

@property (weak, nonatomic) id<BFTaskExceptionHandlingDelegate> delegate;

+ (BFTaskExceptionDelegateHolder *)sharedDelegateHolder;

@end

/**
 Returns whether all instances of `BFTask` should automatically @try/@catch exceptions in continuation blocks. Default: `YES`.

 @return Boolean value indicating whether exceptions are being caught.
 */
extern BOOL BFTaskCatchesExceptions(void);

NS_ASSUME_NONNULL_END
