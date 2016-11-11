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
    [SumupSDK setupWithAPIKey:@"b3f3ae70-043d-4f23-821b-a5c9e2fefe76"];
    
    [SumupSDK presentLoginFromViewController:self.viewController
                                    animated:YES
                             completionBlock:^(BOOL success, NSError *error) {
                                 if (error) {
                                     NSLog(@"%@", @"log error");
                                     // errors are handled within the SDK, there should be no need
                                     // for your app to display any error message
                                 }
                                 
                                 
                             }];
}

-(void) pay:(CDVInvokedUrlCommand *)command {
    
    
    
                                 NSString *total = @"1.00";
                                 
                                 if ([total doubleValue] <= 0) {
                                     return;
                                 }
                                 
                                 SMPCheckoutRequest *request;
                                 request = [SMPCheckoutRequest requestWithTotal:[NSDecimalNumber decimalNumberWithString:@"10.00"]
                                                                          title:@"titre"
                                                                   currencyCode:[[SumupSDK currentMerchant] currencyCode]
                                                                 paymentOptions:SMPPaymentOptionAny];
                                 
                                 // the foreignTransactionID is an optional parameter and can be used
                                 // to retrieve a transaction from SumUp's API. See -[SMPCheckoutRequest foreignTransactionID]
                                 //[request setForeignTransactionID:[NSString stringWithFormat:@"your-unique-identifier-%@", [[NSProcessInfo processInfo] globallyUniqueString]]];
                                 
                                 [SumupSDK checkoutWithRequest:request fromViewController:self.viewController completion:^(SMPCheckoutResult *result, NSError *error) {
                                     if ((error.code == SMPSumupSDKErrorAccountNotLoggedIn)) {
                                         NSLog(@"%@", @"SMPSumupSDKErrorAccountNotLoggedIn");
                                         return;
                                     }
                                     
                                     if ([error.domain isEqualToString:SMPSumupSDKErrorDomain]) {
                                         NSLog(@"%@", @"SMPSumupSDKErrorDomain");
                                         return;
                                     }
                                     
                                     
                                     //NSLog([NSString stringWithFormat:@"%@ - %@", result.success ? @"Thank you" : @"No charge", result.transactionCode]);
                                     //[self showResultsString:[NSString stringWithFormat:@"%@ - %@", result.success ? @"Thank you" : @"No charge", result.transactionCode]];
                                     
                                     if (result.success) {
                                         NSLog(@"%@", @"ok");
                                         
                                     }
                                     else { NSLog(@"%@", @"no success res"); }
                                 }];
                                 
                                 // something went wrong checkout was not started
                                 if (![SumupSDK checkoutInProgress]) {
                                     NSLog(@"%@", @"failed to start");
                                     //[self showResultsString:@"failed to start checkout"];
                                 }
                                 else { NSLog(@"%@", @"in progress"); }
                                 
    
    
}

@end
