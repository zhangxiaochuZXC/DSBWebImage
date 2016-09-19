//
//  DownloaderManager.h
//  仿SDWebImage
//
//  Created by HM on 16/9/19.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DownloaderOperation.h"

@interface DownloaderManager : NSObject

+ (instancetype)sharedManager;

/**
 单例下载图片的主方法
 
 @param URLString    单例接收VC传入图片地址
 @param successBlock 回调下载完成的图片
 */
- (void)downloadImageWithURLString:(NSString *)URLString successBlock:(void(^)(UIImage *image))successBlock;

@end
