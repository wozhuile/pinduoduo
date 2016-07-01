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
//#import "DataModels.h"
#import "PDDHotViewController.h"
#import "PDDGoodsList.h"
#import "PDDHomeData.h"
#import "PDDGroup.h"
#import "PDDHomeRecommendSubjects.h"
#import "PDDHomeSuperBrand.h"
#import "PDDRankViewController.h"
//#import "PDDHomeSuperBrand.h"//重复导入上边


#import "goods_listTableViewCell.h"
#import "home_recommend_subjectsTableViewCell.h"
#import "home_super_brandTableViewCell.h"

static  NSString*goodsCell=@"goods_list";

static  NSString*home_recommend_subjectsCell=@"home_recommend_subjects";
static  NSString*home_super_brandCell=@"home_super_brand";


#import <UIImageView+WebCache.h>


#import <MJRefresh.h>


@interface ViewController ()<NetWorkRequestModelDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //_buttomDataTableView.scrollEnabled=NO;

    _recommentPositionArray=[[NSMutableArray alloc]init];
    
    _goods_listArray=[[NSMutableArray alloc]init];
    _home_recommend_subjectsArray=[[NSMutableArray alloc]init];
    _home_super_brandArray=[[NSMutableArray alloc]init];
    _dataArray=[[NSMutableArray alloc]init];
  
   // self.view.frame
#pragma mark 不知道为什么在初始化里边赋值和调用就出来效果了。应该是加载先后导致的吧，
    _mainView=[[MainView alloc]initWithFrame:self.view.frame];
    //[mainVIew CreateButtomScrollViewWithWidth:self.view.frame.size.width withHeight:self.view.frame.size.height];
   
    
    _netModel =[[NetWorkRequestModel alloc]init];
    
    
    
    //[_netModel topScrollViewImage:@"http://apiv2.yangkeduo.com/subjects"];
    //http://apiv2.yangkeduo.com/subjects
    
#pragma mark  第一次运行的时候崩溃了，底部数据URL书写错误
    
    
    
    
    
    // Set the callback（一Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
   // MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        
        
        //[_netModel topScrollViewImage:@"http://apiv2.yangkeduo.com/subjects"];
        
        //[_netModel buttomDataRequest:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"];
    //}];
    // Set the ordinary state of animated images
    //NSArray*imgArrayOne=[[NSArray alloc]initWithObjects:@"520.gif",@"520.gif",@"520.gif",@"520.gif", nil];

    // NSArray*imgArrayTwo=[[NSArray alloc]initWithObjects:@"520.gif",@"520.gif",@"520.gif",@"520.gif", nil];
     //[header setImages:imgArrayOne forState:MJRefreshStateIdle];
    // Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
     //[header setImages:imgArrayOne forState:MJRefreshStatePulling];
    // Set the refreshing state of animated images
    //[header setImages:imgArrayTwo forState:MJRefreshStateRefreshing];
    // Set header
    //_mainView.buttomScrollView.header = header;
    
    //[_mainView.buttomScrollView.header beginRefreshing];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 刷新表格
//       // [self.tableView reloadData];
//        
//        // 拿到当前的下拉刷新控件，结束刷新状态
//        [  _mainView.buttomScrollView.header endRefreshing];
//    });

    
    //[netModel buttomDataRequest:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"];
    //@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"
 
    
    
#pragma mark page and timer
   // [_mainView CreatePageControl];
    
#pragma mark 代理传值过来了。。。获取顶部图片URL。先声明代理
    _netModel.delegate=self;
    
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
    
    
    
#pragma mark  妈蛋。。刷新版本不对。不是最新的mj_header
    //开始刷新  表刷新不了，，滚动也刷新不了啊。。  都是 _mainView.buttomScrollView的话，进来的时候刷新了，。。。但是之后就不行来，不知道是不是viewwillappear哪里设置了不滚动？？
#pragma mark 可以刷新了，，但是是回去设置的那个buttomScrollView的滚动属性，之前是no，现在是yes了。。
    _mainView.buttomScrollView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
#pragma mark 放进来后，，外边不需要写了。。。
        [_netModel topScrollViewImage:@"http://apiv2.yangkeduo.com/subjects"];
        
        [_netModel buttomDataRequest:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"];
    }];
    
    [_mainView.buttomScrollView.header beginRefreshing];
    
    
#pragma mark 下拉刷新喝上啦加载都不好，，还有个bug就是表数据源数组明明都至少有57个，为什么出来显示的时候就是没有这么多cell。。是不是就是那边的底部滚动视图影响了？？我设置大小了还是一样不可以的，，为什么？其实都不用这么麻烦吧？直接就用表。然后分3个区，前边的两个区就0行就好啊。。现在最下边是滚动，然后放表，，真的够bug多的。。刷新没用滚动的，，表刷新也不行了／／／，，在海陶那个试试吧／／／
    
    _mainView.buttomScrollView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [_netModel topScrollViewImage:@"http://apiv2.yangkeduo.com/subjects"];
        
        [_netModel buttomDataRequest:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"];
    }];

    
    
    
#pragma mark 注册单元格
   // [_buttomDataTableView registerClass:[goods_listTableViewCell Class]forCellReuseIdentifier:goodsCell];
    [_buttomDataTableView registerNib:[UINib nibWithNibName:@"goods_listTableViewCell" bundle:nil]   forCellReuseIdentifier:goodsCell];
#pragma mark  不用xib了，，这里注册也不要再写了。。因为我xib上都标记一样的了。。就算下边还是重新创建来单元格，，但是注册的还是也会参加进来，，所以刚刚什么都搞好，但是这里没有注释，结果也是什么都没有出来，，出来的还是xib 的
    //[_buttomDataTableView registerNib:[UINib nibWithNibName:@"home_recommend_subjectsTableViewCell" bundle:nil] forCellReuseIdentifier:home_recommend_subjectsCell];
    
     //[_buttomDataTableView registerNib:[UINib nibWithNibName:@"home_super_brandTableViewCell" bundle:nil] forCellReuseIdentifier:home_super_brandCell];
    
    
#pragma mark  隐藏滚动条
    _buttomDataTableView.showsVerticalScrollIndicator=NO;
    
}

//-(void)loadNewData
//{
    //[_netModel topScrollViewImage:@"http://apiv2.yangkeduo.com/subjects"];
    
    //[_netModel buttomDataRequest:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"];
//}

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
    
    
   // _home_super_brandArray=(NSMutableArray*)modelData.homeSuperBrand.goodsList;
    //_home_recommend_subjectsArray=(NSMutableArray*)modelData.homeRecommendSubjects;
    //_goods_listArray=(NSMutableArray*)modelData.goodsList;
#pragma mark  妈蛋的。上边强转后还是cfNsarray类型，也就是NSArray类型，，还必须⚠初始化才不会崩溃！！！！！！
     /*reason: '-[__NSArrayI insertObject:atIndex:]: unrecognized selector s*/
    _home_super_brandArray=[[NSMutableArray alloc]initWithArray:modelData.homeSuperBrand.goodsList];
    _home_recommend_subjectsArray=[[NSMutableArray alloc]initWithArray:modelData.homeRecommendSubjects];
    
   // _recommentArray=[[NSMutableArray alloc]initWithArray:modelData.homeRecommendSubjects];
    //[_home_recommend_subjectsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    //}];
    
    _goods_listArray=[[NSMutableArray alloc]initWithArray:modelData.goodsList];
 
    
#pragma mark 给了position啦，，那就插入，应该来到数据源得到这里进行处理，还是用遍历插入。。  其实3个数据源，就是同样的，插入遍历就好，数据源归一   注意：把数据源都归一了，，在多少行哪里就应该久返回一个goods的count久可以了。
    //[_home_super_brandArray enumerateObjectsUsingBlock:^(PDDHomeSuperBrand*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
       // NSLog(@"_goods_listArray===%@",_goods_listArray);
        
        //插入的位置就是position
        //[_goods_listArray insertObject:obj atIndex:obj.position];
        
        // NSLog(@"_goods_listArray==%@",_goods_listArray);
#pragma mark 这样总结遍历本来就错误了吧，要知道这个_home_super_brandArray里边不在只是一个对象了，而是里边对象里边的数组了，，，在这里就是9个。。而position代表的应该是和数组平级，也就对应取出来一个，，现在对数组遍历，，取出来的不在是平级关系了，，也不难怪报错崩溃：  这个就直接插入对象吧？或者酒总结插入数组的方法也可以,就不遍历了
        /*-[PDDGoodsList position]: unrecognized selector sent to instance 0x7ffe5a8bee30
         2016-06-30 19:53:32.602 PinDuoDuoTest[8914:278829] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[PDDGoodsList position]: unrecognized selector sent to instance 0x7ffe5a8bee30'
*/
    //}];
    
    
    //[_goods_listArray insertObjects:_home_super_brandArray atIndexes:modelData.homeSuperBrand.position];
    //试试看。。可以先输出看看前后变化没。。是放一个数组（里边也有数组），把这个大数组当作一个对象来做，还是就传类对象？
    //NSLog(@"_goods_listArray111111==%@",_goods_listArray);
   // [_goods_listArray insertObject:_home_super_brandArray atIndex:modelData.homeSuperBrand.position];
    /*reason: '-[__NSArrayI insertObject:atIndex:]: unrecognized selector s*/
   // NSLog(@"_goods_listArray22222==%@",_goods_listArray);
    
   // NSMutableArray*homeBrandArray=[[NSMutableArray alloc]initWithArray:_home_super_brandArray];
    
    //self.goods_listArray=homeBrandArray;
   // NSLog(@"_goods_listArray111111==%@",_goods_listArray);
    [self.goods_listArray insertObject:modelData.homeSuperBrand atIndex:modelData.homeSuperBrand.position];
    
   // NSLog(@"_goods_listArray222==%@",_goods_listArray);
    
  //NSLog(@"_goods_listArray1111==%@",_goods_listArray);
    [_home_recommend_subjectsArray enumerateObjectsUsingBlock:^(PDDHomeRecommendSubjects*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
#pragma mark 虽然给的position是8什么的，但是之前我没有进行加1，所以位置还是不对，至少，现在加1位置就对了，，哪些布局没有出来，可能是布局的控件不对，或者覆盖了，可以直接在cell哪里创建试试看效果出来没，，然后理解了在进行封装
        
        
        
         //[_goods_listArray insertObject:obj atIndex:obj.position];
        [_goods_listArray insertObject:obj atIndex:obj.position+1];//加1试试
#pragma mark 数组获取，为了subject  为了URL
        /*Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[PDDHomeRecommendSubjects imageUrl]: unrecognized se*/
        _recommentArray=[[NSMutableArray alloc]initWithArray:obj.goodsList];
        
       // NSLog(@"_goods_listArray222==%@",_goods_listArray);
    }];

      //[_goods_listArray addObject:_home_super_brandArray];
    //NSLog(@"_goods_listArray333==%@",_goods_listArray);

    
    
    
    
    
    
//    
//      //1.将添加的数据,放入数组中
//      // [_dataArray addObject:newData];
//  
//      //2.插入单元格
//      NSIndexPath *cellIndexPath = [NSIndexPath indexPathForRow:_home_super_brandPosition inSection:0];
//      NSArray *array = [NSArray arrayWithObjects:cellIndexPath, nil];
//      [_buttomDataTableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
//    
//    
//    
    
    //[_dataArray addObjectsFromArray:@{_home_super_brandArray:_home_recommend_subjectsArray,_goods_listArray:}];
    
#pragma mark  position 纪录
    _home_super_brandPosition=modelData.homeSuperBrand.position;
   // _home_recommend_subjectsPosition=modelData.homeRecommendSubjects;
   // PDDHomeRecommendSubjects*recommentSub=modelData.homeRecommendSubjects;
    
    for (PDDHomeRecommendSubjects*recommentSub in modelData.homeRecommendSubjects) {
#pragma mark 如果是数组，就先从数组里边取出来对象，在取属性
        //_home_recommend_subjectsPosition=recommentSub.position;
        
        
#pragma mark 这里这样记录，居然就保留来最后一个的值！！ 看来要输出看看的。。也要保留到数组里边去
        NSNumber*nub=[[NSNumber alloc]initWithInt:recommentSub.position];
        [_recommentPositionArray addObject:nub];
    }
  
    
    
    //[_goods_listArray addObject:_home_super_brandArray];
    
    
    
    //1.将添加的数据,放入数组中
    // [_dataArray addObject:newData];
    
    //2.插入单元格
    //NSIndexPath *cellIndexPath = [NSIndexPath indexPathForRow:_home_super_brandPosition inSection:0];
   // NSArray *array = [NSArray arrayWithObjects:cellIndexPath, nil];
    //[_buttomDataTableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
    
    
    
    
    
    
#pragma mark 用这种方法添加就不会错，下边的返回多少行也没有错！    说
#pragma mark  下边的3个数组count加括号后，不崩溃了。，，，这里也就不需要的
    //[_dataArray addObject:_home_recommend_subjectsArray];
    // [_dataArray addObject:_home_super_brandArray];
    //[_dataArray addObject:_goods_listArray];
#pragma mark 这样后，数据看起来是有了，，但是输出一看就3个，，是不崩溃了，，但是。。。
    //NSLog(@"_dataArray===%@===%lu",_dataArray,(unsigned long)_dataArray.count);
    
    
    //结束刷新
    [_mainView.buttomScrollView.header endRefreshing];
    
#pragma mark 记得设置结束
    [_mainView.buttomScrollView.footer endRefreshing];
    
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
    
    
//    [_goods_listArray addObject:_home_super_brandArray];
//    
//    //1.将添加的数据,放入数组中
//    // [_dataArray addObject:newData];
//    
//    //2.插入单元格
//    NSIndexPath *cellIndexPath = [NSIndexPath indexPathForRow:3 inSection:0];
//    NSArray *array = [NSArray arrayWithObjects:cellIndexPath, nil];
//    [tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];

    /*崩溃错误   Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid update: invalid number of rows in section 0.  The number of rows contained in an existing section after the update (3) must be equal to the number of rows contained in that section before the update (4), plus or minus the number of rows inserted or deleted from that section (1 inserted, 0 deleted) and plus or minus the number of rows moved into or out of that section (0 moved in, 0 moved out).'
*/
    
    
    
    
    
    //for (NSMutableArray*dataArrat in _dataArray ) {
        //return _dataArray.count;
    //}
    
    
    
   // return _dataArray.count;
    
    //return _goods_listArray.count;
    
   // NSLog(@" count===== %lu",_home_super_brandArray.count+_home_recommend_subjectsArray.count+_goods_listArray.count);
    
#pragma mark  其实只要加一个大括号就可以了。。。为什么搞得这么多
   // return (_home_super_brandArray.count+_home_recommend_subjectsArray.count+_goods_listArray.count);//上边数据源已经插入了，，，就不需要都返回count了。。只要goods，，的就可以了 ，可以输出试试的
    
    return _goods_listArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    

    
    id obj=[_goods_listArray objectAtIndex:indexPath.row];
    
    
    
    
    
    if ([obj isKindOfClass:[PDDHomeRecommendSubjects class]]) {
        
        
        PDDHomeRecommendSubjects*pddRecomment=obj;
        //NSLog(@"%f",pddRecomment.position);
        
        
        home_recommend_subjectsTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:home_recommend_subjectsCell];
        if (cell==nil) {
            
            
            cell=[[home_recommend_subjectsTableViewCell alloc]init];
            
            
#pragma mark 现在刷新没有bug了，下边是重用或者说xib方法创建了单元格的，然后拖拽的控件都可以找到，然后再下边创建的控件也都可以找到，，那是没刷新才可以找到而且赋值成功了，但是如果刷新了，那就不可以了。也就是只会出现这里的红色，，现在要明白，自定义最好就是手写代码而不是要xib的也有然后手写也有，这就容易导致刷新啊什么的bug，第一次数据可能没错，但是刷新就有错误了。
            
            //cell = [[[NSBundle mainBundle] loadNibNamed:@"home_recommend_subjectsTableViewCell" owner:nil options:nil] lastObject];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        
        
        //
        //        NSInteger tap=22;//22还可以，。，26和30都不太好
        //        NSInteger btnWidth=(cell.frame.size.width*2-11*9)/10+15;//加大一些，不会感觉空空的
        //
        //        UIScrollView*_MiddleScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 45, cell.frame.size.width, 200)];
        //        _MiddleScrollView.backgroundColor=[UIColor greenColor];
        //        _MiddleScrollView.contentSize=CGSizeMake(cell.frame.size.width*2.5+btnWidth, 100);
        //        _MiddleScrollView.bounces=NO;
        //        _MiddleScrollView.showsVerticalScrollIndicator=NO;
        //
        //        _MiddleScrollView.showsHorizontalScrollIndicator=NO;
        //
        //
        //        [cell.contentView addSubview:_MiddleScrollView];
        //
        //
        //       // UIImageView*imagShow=nil;
        //        for (int i=0 ; i<10; i++) {
        //
        //            NSLog(@"1111111===%lu",(unsigned long)i);
        //
        //
        //          UIImageView*imagShow=[[UIImageView alloc]initWithFrame:CGRectMake(tap+(tap+btnWidth)*i, 5, btnWidth+8, btnWidth)];
        //            imagShow.tag=i+30;
        //            imagShow.backgroundColor=[UIColor redColor];
        //            [_MiddleScrollView addSubview:imagShow];
        //             UILabel*labe=[[UILabel alloc]initWithFrame:CGRectMake(tap+(tap+btnWidth)*i, btnWidth, btnWidth+8, btnWidth)];
        //            labe.backgroundColor=[UIColor orangeColor];
        //            labe.tag=i+60;
        //            labe.numberOfLines=0;
        //            labe.font=[UIFont systemFontOfSize:12];
        //            labe.textColor=[UIColor blackColor];
        //            [_MiddleScrollView addSubview:labe];
        //
        //
        //            UILabel*pricelabel=[[UILabel alloc]initWithFrame:CGRectMake(tap+(tap+btnWidth)*i, CGRectGetMaxY(labe.frame), btnWidth, 20)];
        //            labe.backgroundColor=[UIColor purpleColor];
        //            pricelabel.tag=i+75;
        //            pricelabel.font=[UIFont systemFontOfSize:14];
        //            pricelabel.textColor=[UIColor redColor];
        //            [_MiddleScrollView addSubview:pricelabel];
        //
        //        }
        
        [pddRecomment.goodsList enumerateObjectsUsingBlock:^(PDDGoodsList*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            
          //   NSLog(@"2222222===%lu",(unsigned long)idx);
            
            UIImageView*img=[cell.contentView viewWithTag:idx+30];
            [img sd_setImageWithURL:[NSURL URLWithString:obj.hdThumbUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            UILabel*lab=[cell.contentView viewWithTag:idx+60];
            lab.text=obj.goodsName;
            
            
            
            UILabel*pricelabel=[cell.contentView viewWithTag:idx+75];
            
            
            
            pricelabel.text=[NSString stringWithFormat:@"$%.2f",obj.price/100];
            
            
        }];
        
        UILabel*sub=[cell.contentView viewWithTag:22];
        sub.text=pddRecomment.subject;
        
        //cell.subject.text=pddRecomment.subject;
        return cell;
    }
    
    
    //        goods_listTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:goodsCell];
    //         cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if ([obj isKindOfClass:[PDDGoodsList class]]) {
        PDDGoodsList*goodsLists=obj;
        goods_listTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:goodsCell];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell.good_listImageView sd_setImageWithURL:[NSURL URLWithString:goodsLists.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
        
        cell.goods_name.text=goodsLists.goodsName;
        
        cell.customer_num.text=[NSString stringWithFormat:@"%d人团",(int)goodsLists.group.customerNum ];
        cell.price.text=[NSString stringWithFormat:@"$%.2f",goodsLists.group.price/100];
        
        return cell;
        
    }
    
    
    else{
        home_super_brandTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:home_super_brandCell];
        
        if (cell==nil ) {
            cell=[[home_super_brandTableViewCell alloc]init];
            
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
        }
        
        [_home_super_brandArray enumerateObjectsUsingBlock:^(PDDGoodsList * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIImageView*img=[cell.contentView viewWithTag:100+idx];
            [img sd_setImageWithURL:[NSURL URLWithString:obj.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            
            
            UILabel*labe=(UILabel*)[cell.contentView viewWithTag:10+idx];
            //labe.text=[NSString stringWithFormat:@"$%.2f",obj.price/100];
            labe.textColor=[UIColor redColor];
            
            
        }];
        
        
        
        
        return cell;
        
        
    }
    
    
    
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
