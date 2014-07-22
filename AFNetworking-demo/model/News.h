//
//  News.h
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import "BaseModel.h"

@interface News : BaseModel
@property (strong, nonatomic) NSString *newsID;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *detailurl;


+ (NSURLSessionDataTask *)getNewsList:(NSDictionary *)paramDic
                        withBlock:(void (^)(NSArray *list, NSError *error))block;

@end
