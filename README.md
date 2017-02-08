# 手势解锁 九宫格解锁


使用方法：1、在工程中拖入YJ_LockView这个文件夹

2、在需要弹出手势解锁的界面调用

/** 解锁*/
YJLockView *lockView = [[YJLockView alloc]initWithFrame:frame WithMode:PwdStateResult];

3、设置密码界面

/** 设置密码*/
YJLockView *lockView = [[YJLockView alloc]initWithFrame:frame WithMode:PwdStateSetting];

二者的Block回调不一样，使用详情请查看demo

谢谢使用！
