//
//  BaseModel.h
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface BaseModel : JSONModel
- (NSString *)json;
- (NSDictionary *)dictionary;
@end
