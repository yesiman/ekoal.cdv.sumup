//
//  sumupper.m
//  mysumup
//
//  Created by yesi on 04/12/2015.
//
//

#import "CDVSumup.h"
#import <SumupSDK/SumupSDK.h>

@implementation CDVSumup

-(void) log:(CDVInvokedUrlCommand *)command {
    [[NSBundle mainBundle] infoDictionary];
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString* apik = [infoDict objectForKey:@"SUMUP_API_KEY"];
    [SumupSDK setupWithAPIKey:apik];
    [SumupSDK presentLoginFromViewController:self.viewController
        animated:YES
        completionBlock:^(BOOL success, NSError *error) {
        if (error) {
            NSLog(@"%@", @"log error");
        }
    }];
}

-(void) pay:(CDVInvokedUrlCommand *)command {
    
    NSString *total = @"1.00";
    if ([total doubleValue] <= 0) {
        return;
    }
    SMPCheckoutRequest *request;
    request = [SMPCheckoutRequest requestWithTotal:[NSDecimalNumber decimalNumberWithString:@"10.00"] title:@"titre"
        currencyCode:[[SumupSDK currentMerchant] currencyCode]
        paymentOptions:SMPPaymentOptionAny];
        [SumupSDK checkoutWithRequest:request fromViewController:self.viewController completion:^(SMPCheckoutResult *result, NSError *error) {
        if ((error.code == SMPSumupSDKErrorAccountNotLoggedIn)) {
            NSLog(@"%@", @"SMPSumupSDKErrorAccountNotLoggedIn");
            return;
        }
        if ([error.domain isEqualToString:SMPSumupSDKErrorDomain]) {
            NSLog(@"%@", @"SMPSumupSDKErrorDomain");
            return;
        }
        if (result.success) {
            NSLog(@"%@", @"ok");
        }
        else { NSLog(@"%@", @"no success res"); }
    }];
    if (![SumupSDK checkoutInProgress]) {
        NSLog(@"%@", @"failed to start");
    }
    else { NSLog(@"%@", @"in progress"); }
}

@end
