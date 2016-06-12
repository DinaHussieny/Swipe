//
//  InterstitialAdsView.h
//  ContactCars
//
//  Created by Dina Hussieny on 6/12/16.
//  Copyright © 2016 Sarmady. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface InterstitialAdsView : NSObject

+ (instancetype)sharedInstance;

- (BOOL)adsEnabled;

- (void)loadInterstitialAdRequest;
- (void)presentInterstitialFromViewController:(UIViewController *)viewController;

@end
