//
//  User.m
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import "User.h"
#import "APIClient.h"
#import "NSDictionary+JsonString.h"
#import "NSString+DictionaryValue.h"
@implementation User
+ (AFHTTPRequestOperation *)getUser:(NSDictionary *)paramDic withBlock:(void (^)(User *user, NSError *error))block{
    
    NSLog(@"paramDic%@",paramDic);
    //直接发送json给服务器端   对应[AFJSONRequestSerializer serializer];
    NSDictionary *param = paramDic;
    
    //将请求参数转换为json后放入key为jsonString的字典中发送请求    对应[AFHTTPRequestSerializer serializer];
   // NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //[parameters setObject:[param dictionaryToJson] forKey:@"jsonString"];
    
    //服务器端写法见工程目录的server.php
    
    return [[APIClient sharedClient] POST:@"getUser.do" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        User *user =  [[User alloc] initWithDictionary:responseObject error:nil];
        
        block(user, nil);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (AFHTTPRequestOperation *)getSomeTypes:(NSDictionary *)paramDic
                             withBlock:(void (^)(NSDictionary *types, NSError *error))block{
    
    return [[APIClient sharedClient] POST:@"getTypes.do" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(responseObject, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
};


@end
