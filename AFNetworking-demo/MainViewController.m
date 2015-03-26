//
//  MainViewController.m
//  AFNetworking-demo
//
//  Created by Jakey on 14-7-22.
//  Copyright (c) 2014年 Jakey. All rights reserved.
//

#import "MainViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "NewsViewController.h"
#import "NSDictionary+JsonString.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"主页";
    self.headPhoto.layer.cornerRadius = self.headPhoto.frame.size.width/2;
    self.headPhoto.layer.masksToBounds = YES;


}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (![AppDelegate APP].user) {
        
        LoginViewController *login = [[LoginViewController alloc]init];
        [login finished:^(User *user) {
            self.userName.text = user.name?:@"";
            self.qq.text = user.qq?:@"";
            self.email.text = user.email?:@"";
            [self.headPhoto setImageWithURL:[NSURL URLWithString:user.photo]];
        }];
        
        [self presentViewController:login animated:YES completion:nil];

    }
}



- (IBAction)newsTouched:(id)sender {
    NewsViewController *news = [[NewsViewController alloc]init];
    [self.navigationController pushViewController:news animated:YES];
}

//json 中各种类型的取法
- (IBAction)typeTouched:(id)sender {
    [User getSomeTypes:nil withBlock:^(NSDictionary *types, NSError *error) {
        if (error) {
            [JKAlert showMessage:@"提示" message:@"网络请求失败"];
            return;
        }
        [JKAlert showMessage:@"提示" message:[types jsonString]];
        
        NSDictionary *dic = [types objectForKey:@"object"];    
        NSArray *array = [types objectForKey:@"array"];
        NSString *string = [types objectForKey:@"string"];
        NSString *dateSting = [types objectForKey:@"dateSting"];
        NSDate *date = [Util dateWithTimeInterval:[types objectForKey:@"date"]];
        NSNumber *number = [types objectForKey:@"number"];
        NSNull *null = [types objectForKey:@"null"];
        
        
    }];
}


@end
