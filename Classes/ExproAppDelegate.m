//
//  ExproAppDelegate.m
//  Expro
//
//  Created by Eystein Bye on 4/29/10.
//  Copyright Adligo 2010. All rights reserved.
//

#import "ExproAppDelegate.h"
#import "ExproViewController.h"

@implementation ExproAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
