//
//  AboutViewController.h
//  Dethridge Wheel Timer
//
//  Created by Tim Millard on 9/07/13.
//  Copyright (c) 2013 Timix Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)closeView:(id)sender;

@end
