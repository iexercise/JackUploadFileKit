//
//  SEUploadManager.h
//  ShinywayEmigration
//
//  Created by lovepeijun on 17/4/12.
//  Copyright © 2017年 shinyway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEUploadOperation.h"
#import "SEUploadFile.h"
#import "SEUploadOperationQueue.h"
typedef void(^UploadCompleteBlock)(SEUploadFile *uploader);
@interface SEUploadManager : NSObject
/** completeBlock */
@property(nonatomic, copy)UploadCompleteBlock esCompleteBlock;

+ (instancetype)uploadWithImages:(NSArray *)images CompleteBlock:(UploadCompleteBlock)completeBlock;
@end
