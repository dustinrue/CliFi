//
//  WiFi.h
//  CliFi
//
//  Created by Dustin Rue on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CWInterface, CWNetwork;
@interface WiFi : NSObject {
    NSString *ssidString;
    NSString *signalStrength;
    NSString *macAddress;
    NSMutableArray *scanResults;
    CWInterface *currentInterface;
@private
    
}

@property(readwrite, retain) CWInterface *currentInterface;
@property(readwrite, retain) NSMutableArray *scanResults;
@property(readwrite, retain) NSString *ssidString;
@property(readwrite, retain) NSString *signalStrength;
@property(readwrite, retain) NSString *macAddress;

- (void) doScan;

@end
