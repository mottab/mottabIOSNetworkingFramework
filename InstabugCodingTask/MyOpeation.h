//
//  MyOpeation.h
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/25/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"

@interface MyOpeation : NSOperation<NSURLSessionTaskDelegate>
{
    BOOL executing;
    BOOL finished;
    /// SessionTask is main task manager for requesting http url request
    NSURLSessionTask *_task;
    /// reponseData is the data returned back from the server as a response
    NSMutableData *_responseData;
    /// this identifer is used as a unix time unique id to each request.
    NSString *_identifier;
    NSURL *_nUrl;
    NSDictionary *_nUrlParameters;
    Method _nVerb;
    NSURLSession *_session;
}
/// Completion block fired when finished
@property (copy, nonatomic) myCompletion myCompletionBlock;
/// init NSOperation function is requested everytime the a new request is added to InstaNetworking
/// it's used to initialized the custom NSOperation (MyOperation)
///
/// - parameter url: url of the http link, like http://www.google.com
///
/// - parameter params: dictionary of the request as key-value pairs
///
/// - parameter verb: http method or verb is a Method enum type
///
/// - parameter idntf: the identifier used in each sessionConfiguration
///
/// - returns: void, nothing is returned from this function
-(id)initWithURL:(NSURL *)url parameters:(NSDictionary *)parameters verb:(Method)verb andIdentifier:(NSString *)idntf;
/// setCompletionBlock for the operation to be fired when finished.
///
/// - parameter is a completionBlock function returened with response and error if found
///
/// - return void: nothing returned back from this function
- (void)setCompletionBlock:(void(^)(NSDictionary* response, NSError *error))finishBlock;

@end
