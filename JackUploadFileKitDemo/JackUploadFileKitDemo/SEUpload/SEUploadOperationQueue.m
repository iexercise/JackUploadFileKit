//
//  SEUploadOperationQueue.m
//  ShinywayEmigration
//
//  Created by lovepeijun on 17/4/12.
//  Copyright © 2017年 shinyway. All rights reserved.
//

#import "SEUploadOperationQueue.h"

@implementation SEUploadOperationQueue
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.uploadQueue = [[NSOperationQueue alloc] init];
        self.uploadQueue.name = @"Upload Queue";
        self.uploadQueue.maxConcurrentOperationCount = 3;
        self.uploadInProgress = [[NSMutableDictionary alloc] init];
        }
    return self;
}

@end
