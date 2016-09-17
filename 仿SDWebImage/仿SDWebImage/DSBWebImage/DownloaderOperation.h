//
//  DownloaderOperation.h
//  仿SDWebImage
//
//  Created by HM on 16/9/17.
//  Copyright © 2016年 itheima. All rights reserved.
//  DownloaderOperation 具备NSOperation所有的特性,包括使用步骤

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloaderOperation : NSOperation

/// 接收VC传入的图片地址
@property (nonatomic, copy) NSString *URLString;

/// 接收VC传入的下载完成的代码块
@property (nonatomic, copy) void(^successBlock)(UIImage *image);

@end
