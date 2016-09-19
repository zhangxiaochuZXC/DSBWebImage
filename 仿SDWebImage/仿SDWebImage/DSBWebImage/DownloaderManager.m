//
//  DownloaderManager.m
//  仿SDWebImage
//
//  Created by HM on 16/9/19.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "DownloaderManager.h"

@interface DownloaderManager ()

/// 操作缓存池
@property (nonatomic, strong) NSMutableDictionary *OPsCache;
/// 队列
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation DownloaderManager

+ (instancetype)sharedManager
{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.OPsCache = [[NSMutableDictionary alloc] init];
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)downloadImageWithURLString:(NSString *)URLString successBlock:(void (^)(UIImage *))successBlock
{
    // 判断要下载的图片对应的下载操作有没有,如果有,直接返回,不再建立下载操作.反之,就建立下载操作
    if ([self.OPsCache objectForKey:URLString]) {
        return;
    }
    
    // 单例定义的代码块 : 传递给自定义操作
    void(^managerBlock)() = ^(UIImage *image) {
        
        // 在单例的代码块里面,回调VC传给单例的代码块 : 代码块中回调/调用代码块
        if (successBlock) {
            successBlock(image);
        }
        
        // 图片下载完成只有,移除对应的操作
        [self.OPsCache removeObjectForKey:URLString];
    };
    
    // 创建自定义的操作对象
    DownloaderOperation *op = [DownloaderOperation downloaderOperationWithURLString:URLString successBlock:managerBlock];
    
    // 把下载操作添加到操作缓存池
    [self.OPsCache setObject:op forKey:URLString];
    
    // 把自定义的操作对象添加到队列
    [self.queue addOperation:op];
}

- (void)cancelDownloadingOperationWithLastURLString:(NSString *)lastURLString
{
    DownloaderOperation *op = [self.OPsCache objectForKey:lastURLString];
    if (op != nil) {
        [op cancel];
        [self.OPsCache removeObjectForKey:lastURLString];
    }
    
    /*
    // 取出上一次的下载操作,调用取消方法
    // cancel : 仅仅是改变了操作的状态而已(cancelled变为YES),并没有正真的取消
    [[self.OPsCache objectForKey:lastURLString] cancel];
    // 需要移除取消掉的操作对象
    [self.OPsCache removeObjectForKey:lastURLString];
    */
}

@end
