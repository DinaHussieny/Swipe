//
//  ItemViewController.h
//  SwipeDemo
//
//  Created by Dina Hussieny on 6/1/16.
//  Copyright © 2016 Dina Hussieny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SItem.h"

@interface ItemViewController : UIViewController

@property (nonatomic, strong) SItem *item;
@property (nonatomic, strong) UILabel *titleLabel;

@end
