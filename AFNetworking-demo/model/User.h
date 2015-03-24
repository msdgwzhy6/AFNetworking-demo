//
//  User.h
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface User : BaseModel
@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *mobile;
@property (strong, nonatomic) NSString *qq;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *photo;



+ (NSURLSessionDataTask *)getUser:(NSDictionary *)paramDic
                           withBlock:(void (^)(User *user, NSError *error))block;

+ (NSURLSessionDataTask *)getSomeTypes:(NSDictionary *)paramDic
                        withBlock:(void (^)(NSDictionary *types, NSError *error))block;

@end
