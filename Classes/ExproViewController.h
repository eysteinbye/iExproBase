//
//  ExproViewController.h
//  Expro
//
//  Created by Eystein Bye on 4/29/10.
//  Copyright Adligo 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExproViewController : UIViewController<UIWebViewDelegate> {
	IBOutlet UIWebView *webView;
	IBOutlet UITextField *addressBar;
	IBOutlet UIActivityIndicatorView *activityIndicator;
}

@property(nonatomic,retain) UIWebView *webView;
@property(nonatomic,retain) UITextField *addressBar;
@property(nonatomic,retain) UIActivityIndicatorView * activityIndicator;

-(IBAction) gotoAddress:(id)sender;
-(IBAction) goBack:(id)sender;
-(IBAction) goForward:(id)sender;
-(IBAction) toggleZoom:(id)sender;
@end

