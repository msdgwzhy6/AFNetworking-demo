//
//  AppDelegate.h
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;


@property (strong, nonatomic) User *user;
+(AppDelegate*)APP;
@end
