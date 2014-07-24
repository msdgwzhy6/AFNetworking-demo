//
//  APIClient.m
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import "APIClient.h"

static dispatch_once_t onceToken;
static APIClient *_sharedClient = nil;

@implementation APIClient
+ (instancetype)sharedClient {
    
    dispatch_once(&onceToken, ^{
        
        NSString *baseApiURL = @"http://api.skyfox.org/";
        
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:baseApiURL]];
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
        
        [_sharedClient.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    NSLog(@"3G网络已连接");
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    NSLog(@"WiFi网络已连接");
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    NSLog(@"网络连接失败");
                    break;
                    
                default:
                    break;
            }
        }];
        [_sharedClient.reachabilityManager startMonitoring];
    });
    
#warning:需要设置 很重要
//TODO:需要设置 很重要
    
//http://blog.csdn.net/xn4545945/article/details/37945711 详细介绍
//http://samwize.com/2012/10/25/simple-get-post-afnetworking/
    
    //发送json数据
    _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
    //响应json数据
    _sharedClient.responseSerializer  = [AFJSONResponseSerializer serializer];

    //发送二进制数据
    //_sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
    //响应二进制数据
    //_sharedClient.responseSerializer  = [AFHTTPResponseSerializer serializer];
    
    //设置响应内容格式
    _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    return _sharedClient;
}
@end
