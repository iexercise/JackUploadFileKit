//
//  SEUploadFile.h
//  ShinywayEmigration
//
//  Created by lovepeijun on 17/4/12.
//  Copyright © 2017年 shinyway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEUploadFile : NSObject
//文件名
@property (nonatomic, strong) NSString *fileName;
//文件二进制数
@property (nonatomic, strong) NSString *fileData;
//上传或下载失败标志位
@property (nonatomic, assign, getter=isFailed)  BOOL failed;
@property (nonatomic, assign, getter=isSuccess) BOOL success;
//进行中
@property (nonatomic, assign, getter=isProgressing) BOOL progressing;
@end
