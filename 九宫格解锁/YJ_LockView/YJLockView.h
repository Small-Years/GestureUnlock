//
//  YJView.h
//  九宫格解锁
//
//  Created by yangjian on 2016/12/1.
//  Copyright © 2016年 yangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PwdStateSetting, //设置密码模式
    PwdStateResult //解锁模式
} PwdState;



@class YJLockView;

@interface YJLockView : UIView

/** btn图片*/
@property (nonatomic,strong)UIImage * btnImage;

/** 选中时的btn图片*/
@property (nonatomic,strong)UIImage * btnSelectdImgae;

/** 解锁错误的btn图片*/
@property (nonatomic,strong)UIImage * btnErrorImage;

/** 滑动时的颜色*/
@property (nonatomic,strong)UIColor * lineColor;

/** 解锁手势完成之后判断结果时调用的block */
@property(nonatomic,copy) BOOL(^sendReaultData)(NSString *str);

/** 设置密码的时候调用的Block (无返回值，直接将密码写到本地)*/
@property(nonatomic,copy) void(^setPwdData)(NSString *NewPwdStr);




-(instancetype)initWithFrame:(CGRect)frame WithMode:(PwdState) mode;

@end

