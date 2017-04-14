//
//  SEUploadOperationQueue.h
//  ShinywayEmigration
//
//  Created by lovepeijun on 17/4/12.
//  Copyright © 2017年 shinyway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEUploadOperationQueue : NSObject
@property (nonatomic, strong) NSMutableDictionary *uploadInProgress;
@property (nonatomic, strong) NSOperationQueue *uploadQueue;
@end
