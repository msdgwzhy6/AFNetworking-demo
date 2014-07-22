//
//  User.m
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import "User.h"
#import "APIClient.h"
#import "NSDictionary+Json.h"
#import "NSString+Dictionary.h"
@implementation User
+ (AFHTTPRequestOperation *)getUser:(NSDictionary *)paramDic withBlock:(void (^)(User *user, NSError *error))block{
    
    NSLog(@"paramDic%@",paramDic);
    
    return [[APIClient sharedClient] POST:@"getuser.do" parameters:paramDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *result = responseObject;
        
        User *user =  [User objectFromDictionary:[result objectForKey:@"success"]];
        
        block(user, nil);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
