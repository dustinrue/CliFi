//
//  WiFi.m
//  CliFi
//
//  Created by Dustin Rue on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WiFi.h"
#import <CoreWLAN/CoreWLAN.h>


@implementation WiFi

@synthesize currentInterface;
@synthesize scanResults;
@synthesize ssidString;
@synthesize signalStrength;
@synthesize macAddress;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) doScan {
    NSError *err = nil;
    CWNetwork *currentNetwork = nil;
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:nil];
    
    NSLog(@"Attempting to do the scan");
    NSArray *supportedInterfaces = [CWInterface supportedInterfaces];
    self.currentInterface = [CWInterface interfaceWithName:[supportedInterfaces objectAtIndex:0]];

    self.scanResults = [NSMutableArray arrayWithArray:[self.currentInterface scanForNetworksWithParameters:params error:&err]];
    
  	if( err )
		NSLog(@"error: %@",err);
	else
		[self.scanResults sortUsingDescriptors:[NSArray arrayWithObject:[[[NSSortDescriptor alloc] initWithKey:@"ssid" ascending:YES selector:@selector	(caseInsensitiveCompare:)] autorelease]]];
    
    
    for (currentNetwork in self.scanResults) {
        
        NSLog(@"found ssid %@ with bssid %@ and RSSI %@",[currentNetwork ssid], [currentNetwork bssid], [currentNetwork rssi]);
    }
//	if( err )

//		[[NSAlert alertWithError:err] runModal];

}

- (void)dealloc
{
    [super dealloc];
}

@end
