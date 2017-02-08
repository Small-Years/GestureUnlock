//
//  ViewController.m
//  九宫格解锁
//
//  Created by yangjian on 2016/12/1.
//  Copyright © 2016年 yangjian. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "YJ_LockViewController.h"
#import "YJ_SetPWDViewController.h"
#import "WSProgressHUD.h"
#import "YJLockView.h"


@interface YJ_LockViewController (){
}

@end

@implementation YJ_LockViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    设置背景图
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imageView.image = [UIImage imageNamed:@"Home_refresh_bg"];
    [self.view addSubview:imageView];
    
    CGFloat RightButtonX = [UIScreen mainScreen].bounds.size.width -160;
    UIButton * _navRightButton  = [[UIButton alloc]initWithFrame:CGRectMake(RightButtonX, 30, 150, 50)];
    [_navRightButton setTitle:@"重新设置密码" forState:UIControlStateNormal];
    _navRightButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_navRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_navRightButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_navRightButton];
    
    
    
    //解锁界面
    YJLockView *lockView = [[YJLockView alloc]initWithFrame:CGRectMake(0, (SCREEN_HEIGHT-SCREEN_WIDTH)*0.5,SCREEN_WIDTH,SCREEN_WIDTH) WithMode:PwdStateResult];
    
    [lockView setBtnImage:[UIImage imageNamed:@"normal"]];
    [lockView setBtnSelectdImgae:[UIImage imageNamed:@"selected"]];
    [lockView setBtnErrorImage:[UIImage imageNamed:@"error"]];
    [self.view addSubview:lockView];
    
    //解锁手势完成之后判断密码是否正确
    lockView.sendReaultData = ^(NSString *resultPwd){
//        从本地获取保存的密码
        NSString *savePwd = [[NSUserDefaults standardUserDefaults]objectForKey:@"passWord"];
        
        if ([savePwd isEqualToString:resultPwd]) {//密码相同，解锁成功
            
            [WSProgressHUD showSuccessWithStatus:@"解锁成功！"];
            
            return YES;
        }else{
            
            [WSProgressHUD showErrorWithStatus:@"解锁失败！"];
            
            return NO;
        }
    };
    
}



-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

-(void)popView{
    YJ_SetPWDViewController *vc = [[YJ_SetPWDViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
