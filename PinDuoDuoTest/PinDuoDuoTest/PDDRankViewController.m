//
//  PDDRankViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PDDRankViewController.h"
#import "rankTool.h"

#import <UIImageView+WebCache.h>

@interface PDDRankViewController ()<UITableViewDataSource,UITableViewDelegate,rankToolDelegate>

@end

@implementation PDDRankViewController

//创建表

-(UITableView*)rankTableView
{
  if (_rankTableView==nil) {
        _rankTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        [self.view addSubview:_rankTableView];
        _rankTableView.delegate=self;
        _rankTableView.dataSource=self;
        _rankTableView.backgroundColor=[UIColor greenColor];
        
      
  }

  return _rankTableView;
}




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title=@"海淘专区";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
 
    _country_listArray=[[NSMutableArray alloc]init];
    _promotion_listArray=[[NSMutableArray alloc]init];
    _goods_listArray=[[NSMutableArray alloc]init];
    
    [self rankTableView];
    NSLog(@"%f",self.view.frame.size.width);
    
    rankTool*ranlTL=[[rankTool alloc]init];
    
    [ranlTL sendRequestForGetData:[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/v2/haitaov2?page=1&size=50"]];
    
    
#pragma mark 代理传值，先遵循代理
    ranlTL.delegate=self;
    


    
    //[self rankTableView];
                                
}
#pragma mark rankTool   delegate method
-(void)sendData:(rankTool *)rankTool country_listArray:(NSMutableArray *)country_listArray promotion_listArray:(NSMutableArray *)promotion_listArray goods_listArray:(NSMutableArray *)goods_listArray
{
    
    //接受数据
    self.country_listArray=country_listArray;
    self.promotion_listArray=promotion_listArray;
    self.goods_listArray=goods_listArray;
    
    
    
}

-(void)failToGetData:(rankTool *)rankTool error:(NSError *)error
{
    NSLog(@"rankError===%@",error);
}

#pragma mark tableView datasource  and  delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 1;
    }
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID=@"cell";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
#pragma mark *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'UITableView (<UITableView: 0x7fe2fb180600; frame = (0 0; 414 736); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x7fe2fcbd52a0>; layer = <CALayer: 0x7fe2fcb66660>; contentOffset: {0, -64}; contentSize: {414, 2288}>) failed to obtain a cell from its dataSource (<PDDRankViewController: 0x7fe2fa491440>)'如果不写下边的那些，哪怕是实验，都有可能崩溃了。。一直崩溃。。。http://www.cnblogs.com/ygm900/archive/2013/06/13/3134425.html
    

    
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
    
    
    
    
    return cell;
}


@end
