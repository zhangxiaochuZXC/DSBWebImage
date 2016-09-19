//
//  UIImageView+DSB.h
//  仿SDWebImage
//
//  Created by HM on 16/9/19.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloaderManager.h"

/*
 1.分类可以拓展方法吗? 可以
 2.分类可以拓展属性吗? 可以;但是,不会自动实现getter和setter方法,生成带下划线的成员变量
 3.分类可以拓展成员变量吗? 不可以
 4.为什么分类不允许拓展成员变量?
    如果拓展成员变量,在实例化的时候,有可能时=实际需要占用的内存空间大于默认的内存空间呢
 */

@interface UIImageView (DSB) {
    // 分类不允许定义成员变量
//    int _num;
}

/**
 分类实现图片下载/缓存和解决各种BUG的主方法
 
 @param URLString 接收图片下载的地址
 */
- (void)DSB_setImageWithURLString:(NSString *)URLString;

@property (nonatomic, copy) NSString *lastURLString;

@end
