//
//  SwipeCollectionViewController.m
//  SwipeDemo
//
//  Created by Dina Hussieny on 5/30/16.
//  Copyright © 2016 Dina Hussieny. All rights reserved.
//

#import "SwipeCollectionViewController.h"
#import "SwipeCollectionViewCell.h"
#import "SecondViewController.h"
#import "FirstViewController.h"
#import "ThirdViewController.h"

@interface SwipeCollectionViewController() {
    FirstViewController *firstViewControoler;
    SecondViewController *secondViewController;
    ThirdViewController *thirdViewController;
}

@property (nonatomic, strong) UICollectionViewFlowLayout *listLayout;
@property (nonatomic, strong) NSMutableArray *viewControllersArray;

@end

@implementation SwipeCollectionViewController

static NSString * const SwipeCollectionViewCellIdentifer = @"SwipeCollectionViewCellIdentifer";

-(instancetype)init {
    
    UICollectionViewLayout *collectionViewLayout;
    
    collectionViewLayout = self.listLayout;
    
    if (self = [super initWithCollectionViewLayout:collectionViewLayout]) {
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerClass:[SwipeCollectionViewCell class] forCellWithReuseIdentifier:SwipeCollectionViewCellIdentifer];
        [self.collectionView setPagingEnabled:YES];
    }
    
    firstViewControoler = [[FirstViewController alloc]init];
    secondViewController = [[SecondViewController alloc]init];
    thirdViewController = [[ThirdViewController alloc]init];
    self.viewControllersArray = [[NSMutableArray alloc]initWithObjects:firstViewControoler, secondViewController, thirdViewController, nil];
    
    return self;
}

- (UICollectionViewFlowLayout *)listLayout {
    if (!_listLayout) {
        _listLayout = [[UICollectionViewFlowLayout alloc] init];
        _listLayout.sectionInset = UIEdgeInsetsMake(2, 10, 2, 0.0f);
        [_listLayout setItemSize:CGSizeMake(150, 60)];
        [_listLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _listLayout.minimumLineSpacing = 5.0;
        
        
    }
    
    return _listLayout;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
     return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SwipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SwipeCollectionViewCellIdentifer forIndexPath:indexPath];
    
    UIViewController *viewController = [self.viewControllersArray objectAtIndex:indexPath.item];
    [cell.contentView addSubview: viewController.view];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}

@end
