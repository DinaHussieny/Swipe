//
//  ItemViewController.m
//  SwipeDemo
//
//  Created by Dina Hussieny on 6/1/16.
//  Copyright © 2016 Dina Hussieny. All rights reserved.
//

#import "ItemViewController.h"
#import "SItem.h"
#import <Masonry/Masonry.h>

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.titleLabel.text = self.item.itemName;
    [self.view addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).with.offset(100);
        make.width.equalTo(@(120));
        make.top.equalTo(self.view).with.offset(100);
        make.height.equalTo(@(100));
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
    }
    
    return  _titleLabel;
}


@end
