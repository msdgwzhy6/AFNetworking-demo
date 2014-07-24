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
}
-(void)loadUserData{
    
    NSDictionary *param = @{@"username": @"skyfox",@"password":@"org"};
    [User getUser:param withBlock:^(User *user, NSError *error) {
        if (error) {
            NSLog(@"网络请求失败");
            return;
        }
        self.userName.text = user.username?:@"";
        self.qq.text = user.userqq?:@"";
        self.email.text = user.useremail?:@"";
        [self.headPhoto setImageWithURL:user.avatarImageURL placeholderImage:nil];
    }];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newsTouched:(id)sender {
    NewsViewController *news = [[NewsViewController alloc]init];
    [self.navigationController pushViewController:news animated:YES];
}

- (IBAction)touched:(id)sender {
    [self loadUserData];
}
@end
