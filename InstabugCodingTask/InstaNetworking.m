//
//  InstaNetworking.m
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/25/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#import "InstaNetworking.h"

@implementation InstaNetworking

-(id)init {
    if(self = [super init]) {
        _opQueue = [[NSOperationQueue alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reachabilityChanged)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
        reachability = [Reachability reachabilityForInternetConnection];
        [reachability startNotifier];
        [self reachabilityChanged];
    }
    return self;
}

-(void)fireRequest:(NSURL *)url parameters:(NSDictionary *)params andVerb:(Method)verb withCompletionBlock:(myCompletion) compBlock {
    NSDate *date = [NSDate date];
    _mOperation = [[MyOpeation alloc] initWithURL:url parameters:params verb:verb andIdentifier:[NSString stringWithFormat:@"%f", [date timeIntervalSince1970]]];
    [_mOperation setCompletionBlock:^(NSDictionary *response) {
        compBlock(response);
    }];
    [_opQueue addOperation:_mOperation];
}

-(void)reachabilityChanged {
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    if(remoteHostStatus == NotReachable) {
        // no internet
    }
    else if (remoteHostStatus == ReachableViaWiFi) {
        // wifi
        _opQueue.maxConcurrentOperationCount = 6;
    }
    else if (remoteHostStatus == ReachableViaWWAN) {
        // 3G
        _opQueue.maxConcurrentOperationCount = 2;
    }
}

@end
