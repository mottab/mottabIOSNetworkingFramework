//
//  InstaNetworkingTests.m
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/26/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InstaNetworking.h"

@interface InstaNetworkingTests : XCTestCase

@property (nonatomic) InstaNetworking *iNetToTest;

@property (nonatomic, strong) NSString *baseURL;

@end

@implementation InstaNetworkingTests

- (void)setUp {
    [super setUp];
    _iNetToTest = [[InstaNetworking alloc] init];
    _baseURL = @"https://jsonplaceholder.typicode.com";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRequestsGetNoParams {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Done"];
    [_iNetToTest fireRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@/posts/1",_baseURL]] parameters:nil andVerb:GET withCompletionBlock:^(NSDictionary *response, NSError *error) {
        if(!response)
            XCTAssertNotNil(error);
        if(!error)
            XCTAssertNotNil(response);
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:50.0 handler:nil];
}

- (void)testRequestsGetWithParams {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Done"];
    [_iNetToTest fireRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@/posts",_baseURL]] parameters:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"comments"] andVerb:GET withCompletionBlock:^(NSDictionary *response, NSError *error) {
        if(!response)
            XCTAssertNotNil(error);
        if(!error)
            XCTAssertNotNil(response);
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:50.0 handler:nil];
}

- (void)testRequestsPostNoParams {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Done"];
    [_iNetToTest fireRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@/posts",_baseURL]] parameters:nil andVerb:POST withCompletionBlock:^(NSDictionary *response, NSError *error) {
        if(!response)
            XCTAssertNotNil(error);
        if(!error)
            XCTAssertNotNil(response);
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:50.0 handler:nil];
}

- (void)testRequestsPutNoParams {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Done"];
    [_iNetToTest fireRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@/posts/1",_baseURL]] parameters:nil andVerb:PUT withCompletionBlock:^(NSDictionary *response, NSError *error) {
        if(!response)
            XCTAssertNotNil(error);
        if(!error)
            XCTAssertNotNil(response);
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:50.0 handler:nil];
}

- (void)testRequestsDeleteNoParams {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Done"];
    [_iNetToTest fireRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@/posts/1",_baseURL]] parameters:nil andVerb:DELETE withCompletionBlock:^(NSDictionary *response, NSError *error) {
        if(!response)
            XCTAssertNotNil(error);
        if(!error)
            XCTAssertNotNil(response);
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:50.0 handler:nil];
}

@end
