//
//  ExproViewController.m
//  Expro
//
//  Created by Eystein Bye on 4/29/10.
//  Copyright Adligo 2010. All rights reserved.
//

#import "ExproViewController.h"

@implementation ExproViewController

@synthesize webView, addressBar, activityIndicator;

-(void)viewDidLoad {
	[super viewDidLoad];
	NSString *urlAddress = @"http://iphone.exprobase.com";
	
	NSURL *url = [NSURL URLWithString:urlAddress];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	[webView loadRequest:requestObj];
	//[addressBar setText:urlAddress];
	
	// Ved å sette denne så kan jeg bruke eventene fra wevView
	webView.delegate = self;
}

-(IBAction)gotoAddress:(id) sender { 
	NSURL *url;
	NSURL *UserInput = [NSURL URLWithString:[addressBar text]];
	
	if ([[UserInput scheme] isEqualToString:@"http"]) {
		url = [NSURL URLWithString:[addressBar text]];
	}else {
		NSString *searchWord = addressBar.text;
		NSString *searchURL =@"http://iphone.exprobase.com/Search.aspx?q=";
		NSString *foobar = [searchURL stringByAppendingString:searchWord];
		url = [NSURL URLWithString:(foobar)];
	}
	
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	// Clear the address field.. ready for new search query
	[addressBar setText:@""];

	[webView loadRequest:requestObj];
	[addressBar resignFirstResponder];
}

-(IBAction) goBack:(id)sender{
	[webView goBack];	
}

-(IBAction) goForward:(id)sender{
	[webView goForward];	
}

-(IBAction) toggleZoom:(id)sender{
	NSString *zoomURL =@"http://iphone.exprobase.com/Zoom.aspx";
	NSURL *url = [NSURL URLWithString:(zoomURL)];
	
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	[webView loadRequest:requestObj];
	[addressBar resignFirstResponder];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{ 
	[activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{ 
	[activityIndicator stopAnimating];
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType{ 
	if (navigationType==UIWebViewNavigationTypeLinkClicked) {
		NSURL *URL = [request URL];
		if ([[URL scheme] isEqualToString:@"http"]) {
			[addressBar setText:[URL absoluteString]];
			[self gotoAddress:nil];
		}
		return NO;
	}
	return YES;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
/*
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
	// Reload page after orientation shift
	// Makes the page reload and ajust to new width
	[webView reload];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
