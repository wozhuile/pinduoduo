//
//  textFieldTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "textFieldTableViewCell.h"

@implementation textFieldTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _middleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 414, 60)];
        //_middleView.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:_middleView];
        
        
        _fruitImage=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_middleView.frame)+10, 5, 45, 45)];
        _fruitImage.image=[UIImage imageNamed:@"Snip20160628_10"];
        [_middleView addSubview:_fruitImage];
        
        _middleTF=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_fruitImage.frame), 25, CGRectGetMaxX(_middleView.frame)-140, 30)];
        _middleTF.placeholder=@"请输入'参团专享码'";
        //_middleTF.backgroundColor=[UIColor greenColor];
        _middleTF.borderStyle=UITextBorderStyleLine;
        
        
#pragma mark 点击键盘return，，就键盘下去
        [ _middleTF addTarget:self action:@selector(middleTextField) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        
#pragma mark 占位符颜色和大小:http://blog.csdn.net/ck89757/article/details/38730961
        //[_middleTF  setValue:[UIColor blackColor] forKey:@"placeholderLabel.textColor"];
        UIColor *color = [UIColor blackColor];
        //UIFont*fondtt=[UIFont systemFontOfSize:12];
        _middleTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入'参团专享码'" attributes:@{NSForegroundColorAttributeName: color}]; //,@{NSFontAttributeName:fondtt}];
        
        _middleTF.layer.borderColor=[UIColor redColor].CGColor;
        _middleTF.layer.borderWidth=1.0f;
        [_middleView addSubview:_middleTF];
        
        _alertBtn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_fruitImage.frame), 5, CGRectGetMaxX(_middleView.frame)-100, 20)];
        //_alertBtn.backgroundColor=[UIColor purpleColor];
        [_alertBtn setImage:[UIImage imageNamed:@"question_mark"] forState:0];
        [_alertBtn setTitle:@"0.1元一个猫山王榴莲APP专享团进行中" forState:0];
        
        _alertBtn.contentEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);//慢慢调节下
        _alertBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -50, 0, 0);
        _alertBtn.imageEdgeInsets=UIEdgeInsetsMake(0, -90, 0, 0);
#pragma mark 设置下文字大小;
        _alertBtn.titleLabel.font=[UIFont systemFontOfSize:12];//12左右就差不多
        //不设置字体颜色就是白色的
        [_alertBtn setTitleColor:[UIColor blackColor] forState:0];
        
        
#pragma mark 点击弹出来对话框
        [_alertBtn addTarget:self action:@selector(alertButton) forControlEvents:UIControlEventTouchUpInside];
        [_middleView addSubview:_alertBtn];
        
        
        
#pragma mark 确认按钮
        _comfirmBtn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_middleTF.frame)+20, 25, 50, CGRectGetHeight(_middleTF.frame))];
        [_comfirmBtn setTitle:@"确认" forState:0];
        [_comfirmBtn setTitleColor:[UIColor whiteColor] forState:0];
        [_comfirmBtn  addTarget:self action:@selector(comfirmButton) forControlEvents:UIControlEventTouchUpInside];
        _comfirmBtn.backgroundColor=[UIColor redColor];
        [_middleView addSubview:_comfirmBtn];

    }
    
    
    return self;
}



-(void)middleTextField
{
    //键盘下去
}
-(void)alertButton
{
    //暂时先这样，文字大小等需要自定义的
    _alertView=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"APP专享码需要好友分享才可以获得" delegate:self cancelButtonTitle:@"立即开团" otherButtonTitles: nil];
    [_alertView show];
}
-(void)comfirmButton
{
    //点击确认还没有处理
}


@end
