//
//  ViewController.m
//  仿SDWebImage
//
//  Created by HM on 16/9/17.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "ViewController.h"
#import "DownloaderOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.实例化全局队列
    self.queue = [[NSOperationQueue alloc] init];
    
    // 图片地址
    NSString *URLString = @"http://pic3.bbzhi.com/fengjingbizhi/gaoqingkuanpingfengguangsheyingps/show_fengjingta_281299_11.jpg";
    // 下载完成的代码块
    void (^successBlock)() = ^(UIImage *image){
        NSLog(@"%@ - %@",image,[NSThread currentThread]);
    };
    
    // 2.创建自定义的操作对象
    DownloaderOperation *op = [DownloaderOperation downloaderOperationWithURLString:URLString successBlock:successBlock];
    
    // 3.把自定义的操作对象添加到队列
    [self.queue addOperation:op];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
