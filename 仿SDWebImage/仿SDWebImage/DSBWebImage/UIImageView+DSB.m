//
//  UIImageView+DSB.m
//  仿SDWebImage
//
//  Created by HM on 16/9/19.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "UIImageView+DSB.h"
#import <objc/runtime.h>

/*
 1.运行时,是开发OC的;OC是在运行时的C语言的API的基础之上的封装
 2.可以动态的给对象增加属性 : 字典转模型框架
 3.可以动态的交换方法的地址 : 可以交换自定义的方法和系统的方法的地址
 4.可以动态的获取对象的属性 : 字典转模型框架
 5.可以动态的给某个分类关联上它的属性
 6.可以动态的给对象的私有的成员变量赋值
 7.只在开发大型框架时使用的,平时开发用不到的
 */

@implementation UIImageView (DSB)

- (void)setLastURLString:(NSString *)lastURLString
{
    /*
     参数1 : 关联的对象
     参数2 : 关联的key
     参数3 : 关联的value
     参数4 : 关联的value的存储策略
     */
    objc_setAssociatedObject(self, "key", lastURLString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)lastURLString
{
    /*
     参数1 : 关联的对象
     参数2 : 关联的key
     */
    return objc_getAssociatedObject(self, "key");
}

- (void)DSB_setImageWithURLString:(NSString *)URLString
{
    // 判断连续两次传入的图片地址是否一样,如果不一样,就把上一次的正在执行的下载操作取消掉
    if (![URLString isEqualToString:self.lastURLString] && self.lastURLString != nil) {
        
        // 单例接管取消操作
        [[DownloaderManager sharedManager] cancelDownloadingOperationWithLastURLString:self.lastURLString];
    }
    
    // 保存上次的图片地址
    self.lastURLString = URLString;
    
    // 单例接管下载操作
    [[DownloaderManager sharedManager] downloadImageWithURLString:URLString successBlock:^(UIImage *image) {
        // 刷新UI
        self.image = image;
    }];
}

@end
