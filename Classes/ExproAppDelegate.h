//
//  ExproAppDelegate.h
//  Expro
//
//  Created by Eystein Bye on 4/29/10.
//  Copyright Adligo 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExproViewController;

@interface ExproAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ExproViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ExproViewController *viewController;

@end

