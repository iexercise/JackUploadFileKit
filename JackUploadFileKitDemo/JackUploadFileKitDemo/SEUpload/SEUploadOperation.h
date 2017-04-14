//
//  SEUploadOperation.h
//  ShinywayEmigration
//
//  Created by lovepeijun on 17/4/12.
//  Copyright © 2017年 shinyway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEUploadFile.h"
typedef void(^UploadCompleteBlock)(SEUploadFile *uploader);
@interface SEUploadOperation : NSOperation
/** uploader */
@property(nonatomic, strong)SEUploadFile *uploader;
/** completeBlock */
@property(nonatomic, copy)UploadCompleteBlock esCompleteBlock;

- (instancetype)initWithCompleteBlock: (UploadCompleteBlock)completeBlock uploader:(SEUploadFile *)uploader;
@end
