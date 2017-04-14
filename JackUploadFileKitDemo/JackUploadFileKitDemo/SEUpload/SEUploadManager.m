//
//  SEUploadManager.m
//  ShinywayEmigration
//
//  Created by lovepeijun on 17/4/12.
//  Copyright © 2017年 shinyway. All rights reserved.
//

#import "SEUploadManager.h"
@interface SEUploadManager ()
+ (NSString *)generateImgNameWithTime;
@end

@implementation SEUploadManager

+ (instancetype)uploadWithImages:(NSArray *)images CompleteBlock:(UploadCompleteBlock)completeBlock{
    SEUploadManager *obj = [[self alloc]init];
    obj.esCompleteBlock = completeBlock;
    SEUploadOperationQueue *myqueue = [[SEUploadOperationQueue alloc] init];
    for (NSData *imageData  in images) {
        SEUploadFile *uploadFile = [[SEUploadFile alloc] init];
        //初始化要上传的图片
        uploadFile.fileData = [NSData dataWithData:imageData];
        //图片名时间戳加随机数
        uploadFile.fileName = [self generateImgNameWithTime];
        SEUploadOperation *operation = [[SEUploadOperation alloc] initWithCompleteBlock:^(SEUploadFile *uploader) {
            if (obj.esCompleteBlock) {
                obj.esCompleteBlock(uploader);
            }
        } uploader:uploadFile];
        [myqueue.uploadQueue addOperation:operation];
    }
    return obj;
}

+ (NSString *)generateImgNameWithTime
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long totalMilliseconds = time*1000;
    int num = (arc4random() % 10000);
    NSString *randomNumber = [NSString stringWithFormat:@"%.4d", num];
    return [NSString stringWithFormat:@"app/360/head/%llu%@.jpg",totalMilliseconds,randomNumber];
}

@end

