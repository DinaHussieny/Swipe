//
//  ItemPageViewController.h
//  SwipeDemo
//
//  Created by Dina Hussieny on 6/1/16.
//  Copyright © 2016 Dina Hussieny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemViewController.h"

@interface ItemPageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign) NSUInteger initialItemIndex;
@end
