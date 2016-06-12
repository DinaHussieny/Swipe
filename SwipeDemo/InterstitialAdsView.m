//
//  InterstitialAdsView.m
//  ContactCars
//
//  Created by Dina Hussieny on 6/12/16.
//  Copyright © 2016 Damlag. All rights reserved.
//

#import "InterstitialAdsView.h"

@interface InterstitialAdsView ()

@property (nonatomic, strong) DFPInterstitial *interstitial;
@property (nonatomic, assign) BOOL loadedInterstitialRequest;
@property (nonatomic, strong) DFPBannerView *splashScreeenBannerView;

@end

@implementation InterstitialAdsView

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (BOOL)adsEnabled {
    return YES;
}

- (void)loadInterstitialAdRequest {
    DFPRequest *request = [DFPRequest request];
    request.testDevices = @[kGADSimulatorID];
    [self.interstitial loadRequest:request];

}

- (void)presentInterstitialFromViewController:(UIViewController *)viewController {
    if (self.interstitial.isReady && !self.interstitial.hasBeenUsed) {
        [self.interstitial presentFromRootViewController:viewController];
    }
}

- (DFPInterstitial *)interstitial {
    if (!_interstitial) {
        _interstitial = [[DFPInterstitial alloc] initWithAdUnitID:@"/7524/Mobile-Contactcars.com/Pager-Interstitial"];
    }
    
    return _interstitial;
}


@end
