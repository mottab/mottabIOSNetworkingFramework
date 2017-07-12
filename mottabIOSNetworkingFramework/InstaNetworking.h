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
#import "InstaImageView.h"

@interface InstaNetworking : NSObject
{
    Reachability* reachability;
    /// OperationQueue is used to manage operations that runs concurrently
    NSOperationQueue *_opQueue;
    /// mOperation is NSOperation class that used to manage the network operation itself
    MyOpeation *_mOperation;
}

/// FireRequest function is requested everytime the developer needs to make HTTP URL Request
///
/// - parameter url: url of the http link, like http://www.google.com
///
/// - parameter params: dictionary of the request as key-value pairs
///
/// - parameter verb: http method or verb is a Method enum type
///
/// - parameter compBlock: the completion block fired with the response object returned from the request
///
/// - returns: void, nothing is returned from this function
-(void)fireRequest:(NSURL *)url parameters:(NSDictionary *)params andVerb:(Method)verb withCompletionBlock:(myCompletion) compBlock;
/// Using this function in the appDelegate, the developer enables background app preocessing.
+ (void)setupBackgroundNetworking;
@end
