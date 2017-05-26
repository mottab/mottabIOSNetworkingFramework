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

@interface InstaNetworking : NSObject
{
    Reachability* reachability;
}
@property (nonatomic, strong) NSOperationQueue *opQueue;
@property (nonatomic, strong) MyOpeation *mOperation;
/// FireRequest function is requested everytime the developer needs to make HTTP URL Request
///
/// - parameter url: url of the http link, like http://www.google.com
/// - parameter params: dictionary of the request as key-value pairs
/// - parameter verb: http method or verb is a Method enum type
/// - parameter compBlock: the completion block fired with the response object returned from the request
///
/// - returns: void, nothing is returned from this function
-(void)fireRequest:(NSURL *)url parameters:(NSDictionary *)params andVerb:(Method)verb withCompletionBlock:(myCompletion) compBlock;
+ (void)setupBackgroundNetworking;
@end
