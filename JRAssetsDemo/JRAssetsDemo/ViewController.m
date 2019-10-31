//
//  ViewController.m
//  JRAssetsDemo
//
//  Created by jinrui on 2019/10/31.
//  Copyright © 2019 tulip. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+JRHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = self.view.bounds;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.image = [UIImage jr_img_2];
    [self.view addSubview:imgView];
}


@end
