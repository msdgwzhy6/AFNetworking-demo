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
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *userqq;
@property (strong, nonatomic) NSString *useremail;
@property (strong, nonatomic) NSURL *avatarImageURL;


+ (NSURLSessionDataTask *)getUser:(NSDictionary *)paramDic
                           withBlock:(void (^)(User *user, NSError *error))block;

@end
