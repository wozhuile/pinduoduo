//
//  ViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
#import "NetWorkRequestModel.h"
#import "DataModels.h"

#import "goods_listTableViewCell.h"
#import "home_recommend_subjectsTableViewCell.h"
#import "home_super_brandTableViewCell.h"

static  NSString*goodsCell=@"goods_list";

static  NSString*home_recommend_subjectsCell=@"home_recommend_subjects";
static  NSString*home_super_brandCell=@"home_super_brand";


#import <UIImageView+WebCache.h>



@interface ViewController ()<NetWorkRequestModelDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //_buttomDataTableView.scrollEnabled=NO;

    
    _goods_listArray=[[NSMutableArray alloc]init];
    _home_recommend_subjectsArray=[[NSMutableArray alloc]init];
    _home_super_brandArray=[[NSMutableArray alloc]init];
    _dataArray=[[NSMutableArray alloc]init];
    
    //_dataArray=[[NSMutableArray alloc]initWithArray:@{_home_super_brandArray}];
    //_dataArray=[[NSMutableArray alloc]initWithObjects:_home_super_brandArray,_home_recommend_subjectsArray,_goods_listArray, nil];
  
    _dataArray=[[NSMutableArray alloc]init];
    
    
   // self.view.frame
#pragma mark 不知道为什么在初始化里边赋值和调用就出来效果了。应该是加载先后导致的吧，
    _mainView=[[MainView alloc]initWithFrame:self.view.frame];
    //[mainVIew CreateButtomScrollViewWithWidth:self.view.frame.size.width withHeight:self.view.frame.size.height];
   
    
    NetWorkRequestModel*netModel=[[NetWorkRequestModel alloc]init];
    
    [netModel topScrollViewImage];
    
    
#pragma mark  第一次运行的时候崩溃了，底部数据URL书写错误
    [netModel buttomDataRequest];
 
    
    
#pragma mark page and timer
   // [_mainView CreatePageControl];
    
#pragma mark 代理传值过来了。。。获取顶部图片URL。先声明代理
    netModel.delegate=self;
    
    //[_mainView  CreateMiddleScrollView];
    
    
    #pragma mark 暂时拿一张来试试
    
    /*NSString*str=@"http://omsproductionimg.yangkeduo.com/images/goods/425/SY6fRexYypFRtRiQdKzxo3RMrXZVR1bI.jpg";
    NSURL*url=[NSURL URLWithString:str];
    [mainVIew CreateTopScrollViewWithUrl:url];*/
    
    //[self.view addSubview:_mainView];
    
    
    
    
#pragma mark 表创建和代理  注意：CGRectGetMaxY(_mainView.buttomScrollView.frame)-CGRectGetMaxY(_mainView.middleView.frame)计算出来的高度
    _buttomDataTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mainView.middleView.frame), CGRectGetWidth(self.view.frame), CGRectGetMaxY(_mainView.buttomScrollView.frame)*15-CGRectGetMaxY(_mainView.middleView.frame)) style:UITableViewStylePlain];
    
    _buttomDataTableView.backgroundColor=[UIColor greenColor];
     _buttomDataTableView.delegate=self;
    
    
    
#pragma mark 这里没有实现，怎么运行数据都没有出来；
    _buttomDataTableView.dataSource=self;
    
    [_mainView.buttomScrollView addSubview:_buttomDataTableView];
   
    
#pragma mark 先写一个死值！
    _buttomDataTableView.rowHeight=268;
    
#pragma mark 暂时用个分割线
    _buttomDataTableView.separatorColor=[UIColor grayColor];
    
    
    [self.view addSubview:_mainView];
    
    
#pragma mark 注册单元格
   // [_buttomDataTableView registerClass:[goods_listTableViewCell Class]forCellReuseIdentifier:goodsCell];
    [_buttomDataTableView registerNib:[UINib nibWithNibName:@"goods_listTableViewCell" bundle:nil]   forCellReuseIdentifier:goodsCell];
    [_buttomDataTableView registerNib:[UINib nibWithNibName:@"home_recommend_subjectsTableViewCell" bundle:nil] forCellReuseIdentifier:home_recommend_subjectsCell];
    
     [_buttomDataTableView registerNib:[UINib nibWithNibName:@"home_super_brandTableViewCell" bundle:nil] forCellReuseIdentifier:home_super_brandCell];
    
    
#pragma mark  隐藏滚动条
    _buttomDataTableView.showsVerticalScrollIndicator=NO;
    
}



#pragma mark 顶部图片遵循代理后。实现方法，
-(void)sucessToGetImageURL:(NetWorkRequestModel *)netWorkRequestModel url:(NSMutableArray *)urlArray
{
    
    //for (int i=0; i<urlArray.count; i++) {
        
     //   NSURL*url=[urlArray objectAtIndex:i];
#pragma mark 这么取值喝传值本来没有错误的，，但是到里边滚动视图的时候，，又一次循环取值了。。导致这里传值一次赋值一次进去，里边就重新调用一次，也就创新创建移除滚动视图喝图片，导致每次赋值还是第一个图片的   
#pragma mark 要想办法救赋值一次，也就是里边方法久调用创建一次，，那就不应该在这里循环取值了。。应该到里边的for循环在取值赋值，这里就应该把数组先传进去，，要懂得灵活。。
        [_mainView CreateTopScrollViewWithUrl:urlArray];
        
    //}
    
}

-(void)failToGetImageURL:(NetWorkRequestModel *)etWorkRequestModel error:(NSError *)error
{
    NSLog(@"%@",error);
}


#pragma mark 底层最大的滚动视图，contentsize要根据内容数据来设置，这里就先设置一个值先试试，不知道为什么不用表来重用，应该是用集合试图来展示了。还有这个界面和海淘界面差不多，应该考虑外边封装！



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // self.navigationItem.title=@"#wewqe#";
 
#pragma mark   bug，，在加载完成后设置不滚动的属性也可以解决刚刚的问题：/*tableView和scrollView滚动起冲突，tableview不能滚动
    
  /*  tableView也是继承的scrollView，所以在滚动的时候也会触发scrollView的代理方法，在scrollViewDidScroll中做一下类型判断就可以了。
    
    
    
    代码：
    
    
    
    - (void)scrollViewDidScroll:(UIScrollView *)scrollView
    {
        if ([scrollView isKindOfClass:[UITableView class]]) {
            NSLog(@"------是列表---");
        }
        else {
            NSLog(@"------是滚动试图----");
        }
    }*/
    
    
    _buttomDataTableView.scrollEnabled=NO;

    
   // MainView*mainVIew=[[MainView alloc]init];
   // [mainVIew CreateButtomScrollView];
    
    
#pragma mark 背景颜色和条颜色区别！
    
    //self.navigationController.navigationBar.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"拼多多商城";
    //self.navigationController.navigationBar.barTintColor=[UIColor grayColor];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
    //self.navigationController.alpha=0.1;
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


#pragma mark 底部数据处理, 代理遵循了。。就直接实现方法就好
-(void)sucessToGetData:(NetWorkRequestModel *)netWorkRequestModel modelData:(PDDHomeData *)modelData
{
    //成功了。完成任务，注释吧！准备tableview创建和数组布局了
    //NSLog(@"modelData===%@",modelData);
    
    /*  //数组都可以得到对应数据了，在这里处理数组得到数据麼？
     PDDHomeData*modelData=[PDDHomeData modelObjectWithDictionary:responseObject];
     
     #pragma mark 先试试数组可以取出来完整的麼   也是够了。。打的时候不提示！！！！！！要慢慢复制过来！！
     //NSLog(@"超值大牌的:=%@--count:=%lu",modelData.homeSuperBrand.goodsList,(unsigned long)modelData.homeSuperBrand.goodsList.count);
     
     //NSLog(@"查看更多等:=%@--count=%lu",modelData.homeRecommendSubjects,(unsigned long)modelData.homeRecommendSubjects.count);
     
     //NSLog(@"最多的数据:%@--count:%lu",modelData.goodsList,(unsigned long)modelData.goodsList.count);

     */
    
    
    _home_super_brandArray=(NSMutableArray*)modelData.homeSuperBrand.goodsList;
    _home_recommend_subjectsArray=(NSMutableArray*)modelData.homeRecommendSubjects;
    _goods_listArray=(NSMutableArray*)modelData.goodsList;
    //[_dataArray addObjectsFromArray:@{_home_super_brandArray:_home_recommend_subjectsArray,_goods_listArray:}];
    
#pragma mark  position 纪录
    _home_super_brandPosition=modelData.homeSuperBrand.position;
   // _home_recommend_subjectsPosition=modelData.homeRecommendSubjects;
   // PDDHomeRecommendSubjects*recommentSub=modelData.homeRecommendSubjects;
    
    for (PDDHomeRecommendSubjects*recommentSub in modelData.homeRecommendSubjects) {
#pragma mark 如果是数组，就先从数组里边取出来对象，在取属性
        _home_recommend_subjectsPosition=recommentSub.position;
        
    }
  
    
    
#pragma mark 用这种方法添加就不会错，下边的返回多少行也没有错！    说
#pragma mark  下边的3个数组count加括号后，不崩溃了。，，，这里也就不需要的
    //[_dataArray addObject:_home_recommend_subjectsArray];
    // [_dataArray addObject:_home_super_brandArray];
    //[_dataArray addObject:_goods_listArray];
#pragma mark 这样后，数据看起来是有了，，但是输出一看就3个，，是不崩溃了，，但是。。。
    //NSLog(@"_dataArray===%@===%lu",_dataArray,(unsigned long)_dataArray.count);
    
#pragma mark 得到数据进行刷新 
    [_buttomDataTableView reloadData];
}

-(void)failToGetData:(NetWorkRequestModel *)etWorkRequestModel error:(NSError *)error
{
    NSLog(@"%@",error);
}


#pragma mark table datasource and delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //for (NSMutableArray*dataArrat in _dataArray ) {
        //return _dataArray.count;
    //}
    
    
    
   // return _dataArray.count;
    
    //return _goods_listArray.count;
    
   // NSLog(@"%lu",_home_super_brandArray.count+_home_recommend_subjectsArray.count+_goods_listArray.count);
    
#pragma mark  其实只要加一个大括号就可以了。。。为什么搞得这么多
    return (_home_super_brandArray.count+_home_recommend_subjectsArray.count+_goods_listArray.count);
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
#pragma mark  还有两个大数组数据处理，一个是超值大牌，一个是推荐！，都是有一个关键字 ：position！！我们要根据它来进行插入！
    
   
    
    
    
    
    //UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    goods_listTableViewCell*goodCell=[tableView dequeueReusableCellWithIdentifier:goodsCell];
    //if (goodCell==nil) {
      //  goodCell=[[goods_listTableViewCell alloc]init];
        //NSArray*array=[[NSBundle mainBundle]loadNibNamed:@" goods_listTableViewCell" owner:nil options:nil];
        
#pragma mark 暂时设置选中状态没有
        //goodCell.selectionStyle=UITableViewCellSelectionStyleNone;
       //goodCell=[array objectAtIndex:0];
    //}
#pragma mark 放在这里外边就可以实现点击状态没有！  证明了注册单元格后，不需要再次去创建！
     goodCell.selectionStyle=UITableViewCellSelectionStyleNone;
    //goodCell.textLabel.text=@"erewrewr";
    
    PDDGoodsList*goodsLists=[_goods_listArray objectAtIndex:indexPath.row];
    //[NSURL URLWithString:<#(nonnull NSString *)#>];
    
    //NSLog(@"goodsLists===%@",goodsLists);
    
    [goodCell.good_listImageView sd_setImageWithURL:[NSURL URLWithString:goodsLists.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
    goodCell.goods_name.text=goodsLists.goodsName;
    
  
    goodCell.customer_num.text=[NSString stringWithFormat:@"%d人团",(int)goodsLists.group.customerNum ];
    goodCell.price.text=[NSString stringWithFormat:@"$%.2f",goodsLists.group.price/100];
    
    //goodCell.goods_name.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    
    return goodCell;
}

#pragma mark  滚动冲突@！！！ 不过在这里的话，会先向上滚动一下才不会滚动了。还有就是可以在viewwillappear等方法里边处理，效果还好！不能在viewdidload方法里边，没加载好不起作用    /*tableView和scrollView滚动起冲突，tableview不能滚动

/*tableView也是继承的scrollView，所以在滚动的时候也会触发scrollView的代理方法，在scrollViewDidScroll中做一下类型判断就可以了。



代码：



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]]) {
        NSLog(@"------是列表---");
    }
    else {
        NSLog(@"------是滚动试图----");
    }
}*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]]) {
        //NSLog(@"------是列表---");
        //_buttomDataTableView.scrollEnabled=NO;
    }
    else {
        NSLog(@"------是滚动试图----");
    }
}



@end
