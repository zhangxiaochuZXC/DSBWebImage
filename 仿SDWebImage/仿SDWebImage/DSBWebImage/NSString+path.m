//
//  NSString+path.m
//  01-异步下载网络图片
//
//  Created by HM on 16/9/17.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "NSString+path.h"

@implementation NSString (path)

- (NSString *)appendCaches
{
//    @"http://p16.qhimg.com/dr/48_48_/t0125e8d438ae9d2fbb.png"
    
    // 获取caches文件路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    // 获取文件缓存在沙盒的文件名
    // lastPathComponent : 获取网络地址里面的最后一个反斜线后面的文件名
    // 如果使用一个字符串去调用分类的这个对象方法,那么`self`代表调用者
    NSString *name = [self lastPathComponent];
    // caches文件路径拼接文件名,得到文件缓存的全路径
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    return filePath;
}

@end
