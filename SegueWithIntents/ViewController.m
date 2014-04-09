//
//  ViewController.m
//  SegueWithIntents
//
//  Created by ytokoro on 4/9/14.
//  Copyright (c) 2014 tokoro. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@implementation ViewController

//----------------------------------------------------------------------------//
#pragma mark - UIViewController
//----------------------------------------------------------------------------//

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSDictionary *)intents
{
    if ([@"Push" isEqualToString:segue.identifier]) {

        UIViewController *destinationViewController = segue.destinationViewController;

        if ([destinationViewController isKindOfClass:[NextViewController class]]) {
            NextViewController* nextViewController = (NextViewController *)destinationViewController;
            nextViewController.number = @1;
        } 
    } else if ([@"Modal" isEqualToString:segue.identifier]) {

        UIViewController *destinationViewController = segue.destinationViewController;

        if ([destinationViewController isKindOfClass:[NextViewController class]]) {
            NextViewController* nextViewController = (NextViewController *)destinationViewController;
            nextViewController.number = @2;
        } 
    }
}

//----------------------------------------------------------------------------//
#pragma mark - IBAction
//----------------------------------------------------------------------------//

- (IBAction)push
{
    [self performSegueWithIdentifier:@"Push" sender:nil];
}

- (IBAction)modal
{
    [self performSegueWithIdentifier:@"Modal" sender:nil];
}

- (IBAction)unwindActionForSegue:(UIStoryboardSegue *)segue
{
}

@end
