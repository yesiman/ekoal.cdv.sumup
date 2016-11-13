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
    SMPCheckoutRequest *request;
    NSString* amount = [command.arguments objectAtIndex:0];
    CDVPluginResult* pluginResult = nil;
    request = [SMPCheckoutRequest requestWithTotal:[NSDecimalNumber decimalNumberWithString:amount] title:@"titre"
        currencyCode:[[SumupSDK currentMerchant] currencyCode]
        paymentOptions:SMPPaymentOptionAny];
        [SumupSDK checkoutWithRequest:request fromViewController:self.viewController completion:^(SMPCheckoutResult *result, NSError *error) {
        
            CDVPluginResult* pluginResult = nil;
            
        if ((error.code == SMPSumupSDKErrorAccountNotLoggedIn)) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR  messageAsString:@"SMPSumupSDKErrorAccountNotLoggedIn"];
        }
        if ([error.domain isEqualToString:SMPSumupSDKErrorDomain]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR  messageAsString:@"SMPSumupSDKErrorDomain"];
        }
        if (result.success) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
        }
        else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"no success res"];
        }
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
    if (![SumupSDK checkoutInProgress]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to start"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    else { NSLog(@"%@", @"in progress"); }
}

@end
