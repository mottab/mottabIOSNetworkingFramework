//
//  MyOpeation.m
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/25/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#import "MyOpeation.h"

@implementation MyOpeation

- (id)initWithURL:(NSURL *)url parameters:(NSDictionary *)parameters verb:(Method)verb andIdentifier:(NSString *)idntf
{
    if (self = [super init]) {
        _nUrl = url;
        _nUrlParameters = parameters;
        _nVerb = verb;
        executing = NO;
        finished = NO;
        _identifier = idntf;
    }
    return self;
}

- (void)main {
    @try {
        BOOL isDone = NO;
        if ([self isCancelled] || isDone) {
            // Do some work
            [self willChangeValueForKey:@"isFinished"];
            finished = YES;
            [self didChangeValueForKey:@"isFinished"];
            return;
        }
        // If the operation is not canceled, begin executing the task.
        if([self isReady]) {
            [self willChangeValueForKey:@"isExecuting"];
            [NSThread detachNewThreadSelector:@selector(executeURLRequest) toTarget:self withObject:nil];
            executing = YES;
            [self didChangeValueForKey:@"isExecuting"];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}


- (void)executeURLRequest {
    NSError * err;
    NSData * jsonData;
    NSString * myString;
    NSString *postLength;
    if(_nUrlParameters != nil) {
        jsonData = [NSJSONSerialization  dataWithJSONObject:_nUrlParameters options:0 error:&err];
        myString = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
        postLength = [NSString stringWithFormat:@"%d", (int)[myString length]];
    }
    NSString *httpMethod = @"";
    switch (_nVerb) {
        case POST:
            httpMethod = @"POST";
            break;
        case DELETE:
            httpMethod = @"DELETE";
            break;
        case GET:
            httpMethod = @"GET";
            break;
        case PUT:
            httpMethod = @"PUT";
            break;
        default:
            break;
    }
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    [urlRequest setURL:_nUrl];
    [urlRequest setHTTPMethod:httpMethod];
    [urlRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:[myString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionConfiguration *sessionConfig;
    float timeout = 5 * 60.0f;
    BOOL iOS8OrNew = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0);
    if (iOS8OrNew) {
        sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:_identifier];
        urlRequest.timeoutInterval = timeout;
    }
    else {
        sessionConfig = [NSURLSessionConfiguration backgroundSessionConfiguration:_identifier];
        sessionConfig.timeoutIntervalForRequest = timeout;
    }
    _responseData = [[NSMutableData alloc] init];
    _session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    _task = [_session dataTaskWithRequest:urlRequest];
    [_task resume];
}
/*
 NSDictionary *responseDict = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
 [self completeOperationWithBlock:responseDict];

 */
- (BOOL)isConcurrent {
    return YES;
}

- (BOOL)isExecuting {
    return executing;
}

- (BOOL)isFinished {
    return finished;
}

- (void)completeOperationWithBlock:(NSDictionary*)dict andError:(NSError *)error {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    executing = NO;
    finished = YES;
    //(myCompletion)dict
    if(self.myCompletionBlock)
        self.myCompletionBlock(dict, error);
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setCompletionBlock:(void(^)(NSDictionary* response, NSError * error))finishBlock {
    self.myCompletionBlock = finishBlock;
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (error) {
        NSLog(@"%@ failed: %@", task.originalRequest.URL, error);
    }
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:_responseData options:0 error:nil];
    if (response) {
        //NSLog(@"response = %@", response);
        [self completeOperationWithBlock:response andError:error];
    } else {
        NSString *responseString = [[NSString alloc] initWithData:_responseData encoding:NSASCIIStringEncoding];
        //NSLog(@"responseData = %@", responseString);
        NSDictionary *dic = [NSDictionary dictionaryWithObject:responseString forKey:@"text/html"];
        [self completeOperationWithBlock:dic andError:error];
    }
}

@end
