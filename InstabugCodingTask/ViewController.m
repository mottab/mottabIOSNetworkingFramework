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
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.google.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from Google");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.apple.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from apple");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.stackoverflow.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from stackoverflow");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.appcoda.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from appcoda");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.samsung.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from samsung");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.linkedin.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from linkedin");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.instabug.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from instabug");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.raywenderlich.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from raywenderlish");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.github.com"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from github");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://www.ibtikar.net.sa"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from ibtikar");
    }];
    [_iNetwork fireRequest:[NSURL URLWithString:@"http://jsonplaceholder.typicode.com/posts/1"] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response) {
        NSLog(@"response from json");
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
