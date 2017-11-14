//
//  ViewController.m
//  TestProject_NativeAdvanced
//
//  Created by Charles on 2017/11/14.
//  Copyright © 2017年 cf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<GADAdLoaderDelegate,GADNativeContentAdLoaderDelegate,GADVideoControllerDelegate>
{
    UIImageView *adimg;
    UILabel *titleLabel;
    UILabel *bodyLabel;
    UIButton *btn;
}

@property(nonatomic, strong) GADAdLoader *adLoader;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    adimg = [[UIImageView alloc]initWithFrame:CGRectMake(67, 65, 200, 150)];
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(67, 35, 258, 28)];
    bodyLabel = [[UILabel alloc]initWithFrame:CGRectMake(67, 215, 277, 33)];
    btn = [[UIButton alloc]initWithFrame:CGRectMake(67, 260, 111, 33)];
    [self.view addSubview:adimg];
    [self.view addSubview:titleLabel];
    [self.view addSubview:bodyLabel];
    [self.view addSubview:btn];
    
    NSMutableArray *adTypes = [[NSMutableArray alloc] init];
    [adTypes addObject:kGADAdLoaderAdTypeNativeContent];
    
    GADVideoOptions *videoOptions = [[GADVideoOptions alloc] init];
    self.adLoader = [[GADAdLoader alloc] initWithAdUnitID:@"ca-app-pub-8209631657973607/7053501007" rootViewController:self adTypes:adTypes options:@[ videoOptions ]];
    self.adLoader.delegate = self;
    [self.adLoader loadRequest:[GADRequest request]];

}

- (void)adLoader:(GADAdLoader *)adLoader didReceiveNativeContentAd:(GADNativeContentAd *)nativeContentAd
{
    [adimg setImage:((GADNativeAdImage *)nativeContentAd.images.firstObject).image];
    titleLabel.text = nativeContentAd.headline;
    bodyLabel.text = nativeContentAd.body;
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:nativeContentAd.callToAction forState:UIControlStateNormal];
    
    NSDictionary *dict = @{GADNativeContentHeadlineAsset:titleLabel,GADNativeContentImageAsset:adimg};
    NSDictionary *dict1 = @{GADNativeContentBodyAsset:bodyLabel};
    [nativeContentAd registerAdView:self.view clickableAssetViews:dict nonclickableAssetViews:dict1];
    
}

- (void)adLoader:(GADAdLoader *)adLoader didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"error");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
