/*
 *  Copyright (c) 2016, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 */

#import "BFTask+Exceptions.h"

NS_ASSUME_NONNULL_BEGIN

static BOOL taskCatchExceptions = YES;

@implementation BFTaskExceptionDelegateHolder

+ (BFTaskExceptionDelegateHolder *)sharedDelegateHolder {
    static dispatch_once_t onceToken;
    static BFTaskExceptionDelegateHolder *holder;
    dispatch_once(&onceToken, ^{
        holder = [[BFTaskExceptionDelegateHolder alloc] init];
    });
    
    return holder;
}

@end

BOOL BFTaskCatchesExceptions(void) {
    id<BFTaskExceptionHandlingDelegate> delegate = [[BFTaskExceptionDelegateHolder sharedDelegateHolder] delegate];
    if (delegate) {
        return [delegate shouldCatchExceptions];
    }
    return taskCatchExceptions;
}

NS_ASSUME_NONNULL_END
