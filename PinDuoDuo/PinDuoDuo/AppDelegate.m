//
//  AppDelegate.m
//  PinDuoDuo
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "PDDHotViewController.h"
#import "PDDRankViewController.h"
#import "PDDSearchViewController.h"
#import "PDDMeViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
#pragma mark 属性文字
    [self setUpTabBarItemTextAttributes];
    
#pragma mark tabbarController
    UITabBarController*rootBarController=[[UITabBarController alloc]init];
     //self.window.rootViewController=rootBarController;
    
    ViewController*HomeVC=[[ViewController alloc]init];
    
    
    UINavigationController*HomeNVC=[[UINavigationController alloc]initWithRootViewController:HomeVC];
    //HomeVC.navigationItem=[[UINavigationItem alloc]initWithTitle:@""];
    //UINavigationItem*HomeItem=[[UINavigationItem alloc]initWithTitle:@""];
#pragma mark 在这里这样直接赋值，显示不出来，，应该是控制器没有加载完全呢。所以背景颜色和标题可以去控制器里边写
    //HomeNVC.navigationItem.title=@"拼多多商城";
    HomeNVC.navigationBar.tintColor=[UIColor redColor];

    HomeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"home"] selectedImage:[[UIImage imageNamed:@"home-hl"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    HomeNVC.navigationBar.backgroundColor=[UIColor greenColor];
   
#pragma mark 添加导航
    
    PDDHotViewController*HotVC=[[PDDHotViewController alloc]init];
    HotVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"热榜" image:[UIImage imageNamed:@"rank"] selectedImage:[[UIImage imageNamed:@"rank-hl"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController*HotNVC=[[UINavigationController alloc]initWithRootViewController:HotVC];

    HotNVC.navigationItem.title=@"排行榜";
    
    
    
    
    PDDRankViewController*RankVC=[[PDDRankViewController alloc]init];
    RankVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"海陶" image:[UIImage imageNamed:@"oversea"] selectedImage:[[UIImage imageNamed:@"oversea-hl"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController*RankNVC=[[UINavigationController alloc]initWithRootViewController:RankVC];
    
    RankNVC.navigationItem.title=@"海淘专区";

    
    
    
    
    PDDSearchViewController*SearchVC=[[PDDSearchViewController alloc]init];
    SearchVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"搜索" image:[UIImage imageNamed:@"search"] selectedImage:[[UIImage imageNamed:@"search-hl"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController*SearchNVC=[[UINavigationController alloc]initWithRootViewController:SearchVC];
    
    SearchNVC.navigationItem.title=@"搜索";
    
    
    
    PDDMeViewController*MeVC=[[PDDMeViewController alloc]init];
    MeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:[UIImage imageNamed:@"me"] selectedImage:[[UIImage imageNamed:@"me-hl"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController*MeNVC=[[UINavigationController alloc]initWithRootViewController:MeVC];
    
    MeNVC.navigationItem.title=@"个人中心";
    
    
    
#pragma mark 轻轻的加个灰色，刚刚好可以淡淡的显示出来，很好的区别出来窗口的白色和标签控制器的颜色
   //rootBarController.tabBar.backgroundColor=[UIColor redColor];//注意区别，结合导航后，就不会刚刚合适了。
    
   // rootBarController.tabBar.translucent = YES;
    //rootBarController.tabBar.tintColor=[UIColor redColor];
   // rootBarController.tabBar.barTintColor=[UIColor whiteColor];
    
    rootBarController.tabBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];;
   // rootBarController.tabBar.alpha=0.5;
    
    //rootBarController.viewControllers=@[HomeVC,HotVC,RankVC,SearchVC,MeVC];
#pragma mark 添加导航后
    rootBarController.viewControllers=@[HomeNVC,HotNVC,RankNVC,SearchNVC,MeNVC];
    
    
    self.window.rootViewController=rootBarController;
    //self.window.rootViewController=rootBarController;
    
    
    
    return YES;
}
//设置文字颜色
-(void)setUpTabBarItemTextAttributes
{
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    
    
#pragma mark 设置红色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    
    //设置文字属性
    UITabBarItem *tabBar =[UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.CEO.PinDuoDuo" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"PinDuoDuo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"PinDuoDuo.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
