//
//  ItemPageViewController.m
//  SwipeDemo
//
//  Created by Dina Hussieny on 6/1/16.
//  Copyright © 2016 Dina Hussieny. All rights reserved.
//

#import "ItemPageViewController.h"
#import "ItemViewController.h"
#import <Masonry/Masonry.h>

@implementation ItemPageViewController

- (void)loadView {
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *view = [[UIView alloc] initWithFrame:applicationFrame];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                            options:nil];
    self.pageViewController.view.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(applicationFrame), CGRectGetHeight(applicationFrame));
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    [self addChildViewController:self.pageViewController];
    [view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [[NSMutableArray alloc]init];
    
    SItem *item = [[SItem alloc]init];
    item.itemName = @"One";
    [self.items addObject:item];
    
    item = [[SItem alloc]init];
    item.itemName = @"two";
    [self.items addObject:item];
    
    item = [[SItem alloc]init];
    item.itemName = @"three";
    [self.items addObject:item];
    
    item = self.items[self.initialItemIndex];
}

- (void)viewWillLayoutSubviews {
    [self.pageViewController setViewControllers:@[[self viewControllerAtIndex:self.initialItemIndex]]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    ItemViewController *currentItemViewController = (ItemViewController *)viewController;
    SItem *item = currentItemViewController.item;
    NSInteger index = [self.items indexOfObject:item] - 1;
    
    if (index < 0) {
        return nil;
    } else {
        return [self viewControllerAtIndex:index];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    ItemViewController *currentItemViewController = (ItemViewController *)viewController;
    SItem *item = currentItemViewController.item;
    NSInteger index = [self.items indexOfObject:item] + 1;
    
    if (index >= [self.items count]) {
        return nil;
    } else {
        return [self viewControllerAtIndex:index];
    }
}

- (ItemViewController *)viewControllerAtIndex:(NSInteger)index {
    ItemViewController *itemViewController = [[ItemViewController alloc] init];
    itemViewController.item = self.items[index];
    
    return itemViewController;
}
@end
