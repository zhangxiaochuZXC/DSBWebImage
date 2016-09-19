//
//  APPModel.h
//  01-异步下载网络图片
//
//  Created by HM on 16/9/17.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPModel : NSObject

/// APP名称
@property (nonatomic, copy) NSString *name;
/// APP图标
@property (nonatomic, copy) NSString *icon;
/// APP下载量
@property (nonatomic, copy) NSString *download;

+ (instancetype)appWithDict:(NSDictionary *)dict;

@end

/*
 {
     "name" : "植物大战僵尸",
     "download" : "10311万",
     "icon" : "http:\/\/p16.qhimg.com\/dr\/48_48_\/t0125e8d438ae9d2fbb.png"
 },
 */
