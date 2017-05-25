//
//  InstaNetworking.h
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/25/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import "MyOpeation.h"

typedef void(^myCompletion)(NSDictionary*);

@interface InstaNetworking : NSObject
{
    Reachability* reachability;
}
@property (nonatomic, strong) NSOperationQueue *opQueue;
@property (nonatomic, strong) MyOpeation *mOperation;
-(void)fireRequest:(NSURL *)url parameters:(NSDictionary *)params andVerb:(Method)verb withCompletionBlock:(myCompletion) compBlock;

@end
