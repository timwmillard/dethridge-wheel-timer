//
//  AboutViewController.m
//  Dethridge Wheel Timer
//
//  Created by Tim Millard on 9/07/13.
//  Copyright (c) 2013 Timix Technology. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad
{
    NSString *localFilePath = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"] ;
    NSURLRequest *localRequest = [NSURLRequest requestWithURL:
                                  [NSURL fileURLWithPath:localFilePath]] ;
    
    [self.webView loadRequest:localRequest];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
