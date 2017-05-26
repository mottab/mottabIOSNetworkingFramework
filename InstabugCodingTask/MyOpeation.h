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
}

@property (strong) NSURLSessionTask *task;
@property (strong) NSMutableData *responseData;
@property (strong) NSString *identifier;
@property (strong) NSURL *nUrl;
@property (strong) NSDictionary *nUrlParameters;
@property Method nVerb;
@property (strong) NSURLSession *session;

@property (copy, nonatomic) myCompletion myCompletionBlock;

-(id)initWithURL:(NSURL *)url parameters:(NSDictionary *)parameters verb:(Method)verb andIdentifier:(NSString *)idntf;
- (void)setCompletionBlock:(void(^)(NSDictionary* response, NSError *error))finishBlock;

@end
