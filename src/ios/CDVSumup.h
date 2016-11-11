//
//  sumupper.h
//  mysumup
//
//  Created by yesi on 04/12/2015.
//
//
#import <Cordova/CDV.h>

@interface CDVSumup : CDVPlugin

-(void) log:(CDVInvokedUrlCommand*)command;
-(void) pay:(CDVInvokedUrlCommand*)command;

@end
