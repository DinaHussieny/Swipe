//
//  UIViewController+BannerView.m
//  ContactCars
//
//  Created by Dina Hussieny on 6/9/16.
//  Copyright © 2016 Sarmady. All rights reserved.
//

#import "UIViewController+BannerView.h"
#import <objc/runtime.h>
#import "InterstitialAdsView.h"

@implementation UIViewController (BannerView)

static NSUInteger eventsCount = 0;

- (void)swizzle_viewDidLoad {
    [self swizzle_viewDidLoad];
    
    IMP instanceForBannerView = [UIViewController instanceMethodForSelector:@selector(invokeBannerView)];
    void (*func)(id,SEL,...) = (void *)instanceForBannerView;
    func(self, @selector(invokeBannerView));
}

+ (void)load {
    Method original, swizzled;
    original = class_getInstanceMethod(self, @selector(viewDidLoad));
    swizzled = class_getInstanceMethod(self, @selector(swizzle_viewDidLoad));
    method_exchangeImplementations(original, swizzled);
}

- (void)invokeBannerView {
  
    InterstitialAdsView *adsManager = [InterstitialAdsView sharedInstance];
    [adsManager loadInterstitialAdRequest];
    NSUInteger currentEventsCount = [UIViewController eventsCount];
    
    if (currentEventsCount >= 1) {
        [adsManager presentInterstitialFromViewController:self.parentViewController];
    }
    
    [UIViewController setEventsCount:currentEventsCount + 1];

}

+ (NSUInteger)eventsCount {
    @synchronized(self) {
        return eventsCount;
    }
}

+ (void)setEventsCount:(NSUInteger)newEventsCount {
    @synchronized(self) {
        eventsCount = newEventsCount;
    }
}

@end
