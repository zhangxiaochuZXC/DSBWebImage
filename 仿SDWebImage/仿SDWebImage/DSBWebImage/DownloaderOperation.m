//
//  DownloaderOperation.m
//  仿SDWebImage
//
//  Created by HM on 16/9/17.
//  Copyright © 2016年 itheima. All rights reserved.
//

/*
 DownloaderOperation的作用
 1.异步下载网络图片
    需要图片的地址
 2.使用block把图片数据传递到VC
 */

#import "DownloaderOperation.h"

@implementation DownloaderOperation

// 任何操作在执行执行都会调用main方法 : 一旦队列调度操作执行,首先自动执行start方法,然后自动执行main方法
/// 重写main方法 : 所有操作的入口 (相当于教室的门)
- (void)main
{
    NSLog(@"传入 %@",self.URLString);
    
    // 异步下载
    NSURL *URL = [NSURL URLWithString:self.URLString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    UIImage *image = [UIImage imageWithData:data];
    
    // 图片下载完成之后,需要把图片传递到VC
    if (self.successBlock != nil) {
        // 回到主线程,回调VC传入的代码块;
        // 提示 : block 和 代理 和 通知 ,在哪个线程回调block/发送代理消息/发送通知,那么就在哪个线程执行相关方法
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.successBlock(image);
        }];
    }
}

@end
