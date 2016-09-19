//
//  DownloaderOperation.h
//  仿SDWebImage
//
//  Created by HM on 16/9/17.
//  Copyright © 2016年 itheima. All rights reserved.
//  DownloaderOperation 具备NSOperation所有的特性,包括使用步骤

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSString+path.h"

@interface DownloaderOperation : NSOperation

/**
 实例化自定义操作对象的主方法
 
 @param URLString    接收单例传入的图片地址
 @param successBlock 接收单例入的下载完成的代码块
 
 @return 返回自定义的操作对象
 */
+ (instancetype)downloaderOperationWithURLString:(NSString *)URLString successBlock:(void(^)(UIImage *image))successBlock;

@end
