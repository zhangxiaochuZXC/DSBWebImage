//
//  DownloaderOperation.m
//  仿SDWebImage
//
//  Created by HM on 16/9/17.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "DownloaderOperation.h"

@implementation DownloaderOperation

// 任何操作在执行执行都会调用main方法 : 一旦队列调度操作执行,首先自动执行start方法,然后自动执行main方法
/// 重写main方法 : 所有操作的入口 (相当于教室的门)
- (void)main
{
    NSLog(@"%@",[NSThread currentThread]);
}

@end
