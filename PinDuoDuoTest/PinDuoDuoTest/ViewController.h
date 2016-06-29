//
//  ViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>



#pragma mark   顶部图片传过来，要接受，需要全局变量，也要保证不被提前释放  ,声明成属性
#import "MainView.h"



@interface ViewController : UIViewController
#pragma mark 底部滚动视图
//@property(nonatomic,retain)UIScrollView*buttomScrollview;

@property(nonatomic,retain)MainView*mainView;


#pragma mark


@end

