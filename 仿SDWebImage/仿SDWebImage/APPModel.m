//
//  APPModel.m
//  01-异步下载网络图片
//
//  Created by HM on 16/9/17.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "APPModel.h"

@implementation APPModel

+ (instancetype)appWithDict:(NSDictionary *)dict
{
    APPModel *app = [[APPModel alloc] init];
    
    // KVC实现字典转模型
    [app setValuesForKeysWithDictionary:dict];
    
    return app;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %@ - %@",self.name,self.download,self.icon];
}

@end
