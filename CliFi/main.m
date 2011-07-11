//
//  main.m
//  CliFi
//
//  Created by Dustin Rue on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiFi.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
    
    WiFi *scanner = [WiFi alloc];
    
    [scanner doScan];
    
    [pool drain];
    return 0;
}

