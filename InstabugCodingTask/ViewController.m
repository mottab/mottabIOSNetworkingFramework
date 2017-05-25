//
//  ViewController.m
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/25/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#import "ViewController.h"
#import "InstaNetworking.h"

@interface ViewController ()

@property (nonatomic, strong) InstaNetworking *iNetwork;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _iNetwork = [[InstaNetworking alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
