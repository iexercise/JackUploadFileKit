//
//  SEUploadOperation.m
//  ShinywayEmigration
//
//  Created by lovepeijun on 17/4/12.
//  Copyright © 2017年 shinyway. All rights reserved.
//

#import "SEUploadOperation.h"

@implementation SEUploadOperation
- (void)main {
    @autoreleasepool {
        //正在进行中
        self.uploader.progressing = YES;
        //开始上传
        AFSecurityPolicy *securityPolicy=[[AFSecurityPolicy alloc]init];
        [securityPolicy setAllowInvalidCertificates:YES];
        
        NSDictionary *dic = [NSDictionary dictionary];
        
        if([UIDevice currentDevice].systemVersion.floatValue>=8.0){
            
            AFHTTPSessionManager *Session=[AFHTTPSessionManager  manager];
            
            Session.responseSerializer=[AFHTTPResponseSerializer serializer];
            [Session POST:@"" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  formData) {
                [formData appendPartWithFileData:self.uploader.fileData name:@"file" fileName:self.uploader.fileName mimeType:@"image/jpg"];
            } progress:nil success:^(NSURLSessionDataTask *  task, id  responseObject) {
                self.uploader.progressing = NO;
                self.uploader.success = YES;
                [self performSelectorOnMainThread:@selector(completeCallBack) withObject:self.uploader waitUntilDone:NO];
                
            } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
                self.uploader.progressing = NO;
                self.uploader.failed = YES;
                [self performSelectorOnMainThread:@selector(completeCallBack) withObject:self.uploader waitUntilDone:NO];
            }];
            
        }else{
            SDKLOG(@"该手机版本不支持该功能,请升级手机版本");
        }
        //当上传成功或者失败之后记得把正在进行中标志置为NO,退出runloop
        while (self.uploader.isProgressing)
        {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            
        }
    }
}

- (instancetype)initWithCompleteBlock:(UploadCompleteBlock)completeBlock uploader:(SEUploadFile *)uploader{
    self = [super init];
    if (self) {
        self.esCompleteBlock = completeBlock;
        self.uploader = uploader;
    }
    return self;
}

- (void)completeCallBack{
    if (self.esCompleteBlock && self.uploader) {
        self.esCompleteBlock(self.uploader);
    }
}
@end
