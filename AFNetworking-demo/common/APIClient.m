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
        
        NSString *baseApiURL = [NSString stringWithFormat:SERVER_INTERFACES,SERVER_IP];
        
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
    
    return _sharedClient;
}
@end
