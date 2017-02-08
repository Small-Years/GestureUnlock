//
//  EditPwdViewController.m
//  九宫格解锁
//
//  Created by yangjian on 2016/12/6.
//  Copyright © 2016年 yangjian. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "YJ_SetPWDViewController.h"
#import "YJLockView.h"
#import "YJ_LockViewController.h"
#import "WSProgressHUD.h"



@interface YJ_SetPWDViewController ()

{
    NSString *pwdStr1;
    NSString *pwdStr2;
    BOOL isFirst;
}

@end

@implementation YJ_SetPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isFirst = YES;
    self.title = @"设置解锁密码";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imageView.image = [UIImage imageNamed:@"Home_refresh_bg"];
    [self.view addSubview:imageView];
    
    
//    YJLockView *lockView = [[YJLockView alloc]initWithFrame:CGRectMake(0, (SCREEN_HEIGHT-SCREEN_WIDTH)*0.5,SCREEN_WIDTH,SCREEN_WIDTH)];
    YJLockView *lockView = [[YJLockView alloc]initWithFrame:CGRectMake(0, (SCREEN_HEIGHT-SCREEN_WIDTH)*0.5,SCREEN_WIDTH,SCREEN_WIDTH) WithMode:PwdStateSetting];
    
    [lockView setBtnImage:[UIImage imageNamed:@"normal"]];
    [lockView setBtnSelectdImgae:[UIImage imageNamed:@"selected"]];
    [lockView setBtnErrorImage:[UIImage imageNamed:@"error"]];
    
    
    __weak typeof (self)vcs = self;
    lockView.setPwdData = ^(NSString *resultPwd){
        
        if (isFirst == YES) {
            pwdStr1 = resultPwd;
            isFirst = NO;
            vcs.title = @"请再次设置解锁密码";
            return;
        }else{
            pwdStr2 = resultPwd;
        }
        if ([pwdStr1 isEqualToString:pwdStr2]) {
            [[NSUserDefaults standardUserDefaults] setObject:resultPwd forKey:@"passWord"];
            if (self.navigationController.viewControllers.count > 1) {
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                YJ_LockViewController *vc = [[YJ_LockViewController alloc]init];
                [vcs.navigationController pushViewController:vc animated:YES];
            }
        }else{
            [WSProgressHUD showErrorWithStatus:@"两次设置的密码不一致"];
            vcs.title = @"设置解锁密码";
            isFirst = YES;
            pwdStr2 = @"";
            pwdStr1 = @"";
        }
    };
    
    [self.view addSubview:lockView];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

@end
