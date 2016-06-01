//
//  AppDelegate.m
//  SwipeDemo
//
//  Created by Dina Hussieny on 5/30/16.
//  Copyright © 2016 Dina Hussieny. All rights reserved.
//

#import "AppDelegate.h"
#import "SwipeCollectionViewController.h"
#import "ItemPageViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    ItemPageViewController *itemPageViewController = [[ItemPageViewController alloc]init];
    SwipeCollectionViewController *swipeCollectionViewController = [[SwipeCollectionViewController alloc]init];
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = itemPageViewController;
    [self.window makeKeyAndVisible];

    return YES;
}


@end
