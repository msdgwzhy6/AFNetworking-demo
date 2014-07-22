//
//  News.m
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import "News.h"
#import "APIClient.h"
#import "NSDictionary+Json.h"
#import "NSString+Dictionary.h"

@implementation News
+ (AFHTTPRequestOperation *)getNewsList:(NSDictionary *)paramDic
                              withBlock:(void (^)(NSArray *list, NSError *error))block{
   
    NSLog(@"paramDic%@",paramDic);
    
    return [[APIClient sharedClient] POST:@"getnewslist.do" parameters:paramDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *result = responseObject;
        NSLog(@"result =%@",result);
        NSArray *list = [result objectForKey:@"success"];
        if ([list isKindOfClass:[NSArray class]] && block) {
            
          NSMutableArray *result = [NSMutableArray arrayWithCapacity:list.count];
          [list enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
          [result addObject:[News objectFromDictionary:obj]];
          }];
            
          block(list, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (AFHTTPRequestOperation *)getNewsDataList:(NSDictionary *)paramDic
                              withBlock:(void (^)(NSArray *list, NSError *error))block{
    
    NSLog(@"paramDic%@",paramDic);
    
    return [[APIClient sharedClient] POST:@"getnewslist.do" parameters:paramDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *result = responseObject;
        NSLog(@"result =%@",result);
        NSArray *list = [result objectForKey:@"success"];
        if ([list isKindOfClass:[NSArray class]] && block) {
            block(list, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}
@end
