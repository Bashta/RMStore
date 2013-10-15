//
//  RMStoreAppReceiptVerificatorTests.m
//  RMStore
//
//  Created by Hermes on 10/15/13.
//  Copyright (c) 2013 Robot Media. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "RMStoreAppReceiptVerificator.h"
#import <OCMock/OCMock.h>

@interface RMStoreAppReceiptVerificatorTests : SenTestCase

@end

@implementation RMStoreAppReceiptVerificatorTests {
    RMStoreAppReceiptVerificator *_verificator;
}

- (void)setUp
{ SKIP_IF_VERSION(NSFoundationVersionNumber_iOS_6_1)
    [super setUp];
    _verificator = [[RMStoreAppReceiptVerificator alloc] init];
}

- (void)testVerifyTransaction_transaction_nil_nil
{ SKIP_IF_VERSION(NSFoundationVersionNumber_iOS_6_1)
    id transaction = [OCMockObject mockForClass:[SKPaymentTransaction class]];
    [_verificator verifyTransaction:transaction success:nil failure:nil];
}

- (void)testVerifyTransaction_transaction_block_block_fail
{ SKIP_IF_VERSION(NSFoundationVersionNumber_iOS_6_1)
    id transaction = [OCMockObject mockForClass:[SKPaymentTransaction class]];
    [_verificator verifyTransaction:transaction success:^{
        STFail(@"");
    } failure:^(NSError *error) {
        STAssertNotNil(error, @"");
    }];
}

- (void)testVerifyAppReceipt_NO
{ SKIP_IF_VERSION(NSFoundationVersionNumber_iOS_6_1)
    BOOL result = [_verificator verifyAppReceipt];
    STAssertFalse(result, @"");
}

- (void)testBundleIdentifier_default
{ SKIP_IF_VERSION(NSFoundationVersionNumber_iOS_6_1)
    NSString *expected = [[NSBundle mainBundle] bundleIdentifier];
    NSString *result = _verificator.bundleIdentifier;
    STAssertEqualObjects(expected, result, @"");
}

- (void)testBundleIdentifier_set
{ SKIP_IF_VERSION(NSFoundationVersionNumber_iOS_6_1)
    NSString *expected = @"test";
    _verificator.bundleIdentifier = expected;
    NSString *result = _verificator.bundleIdentifier;
    STAssertEqualObjects(expected, result, @"");
}

- (void)testBundleVersion_default
{ SKIP_IF_VERSION(NSFoundationVersionNumber_iOS_6_1)
    NSString *expected = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *result = _verificator.bundleVersion;
    STAssertEqualObjects(expected, result, @"");
}

- (void)testBundleVersion_set
{ SKIP_IF_VERSION(NSFoundationVersionNumber_iOS_6_1)
    NSString *expected = @"2.0";
    _verificator.bundleVersion = expected;
    NSString *result = _verificator.bundleVersion;
    STAssertEqualObjects(expected, result, @"");
}

@end
