//
//  ViewController.m
//  SegueWithIntents
//
//  Created by ytokoro on 4/9/14.
//  Copyright (c) 2014 tokoro. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "UIViewController+Intents.h"

@implementation ViewController

//----------------------------------------------------------------------------//
#pragma mark - UIViewController
//----------------------------------------------------------------------------//

/*
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
*/

//----------------------------------------------------------------------------//
#pragma mark - IBAction
//----------------------------------------------------------------------------//

- (IBAction)push
{
/*     [self performSegueWithIdentifier:@"Push" sender:nil]; */

    // オブジェクトを簡単に渡す
    [self performSegueWithIdentifier:@"Push" intent:@1];

    // Dictionary形式で複数渡す
    NSDictionary *intent = @{@"item": item, @"shop": shop};
    [self performSegueWithIdentifier:@"Push" intent:intent];

    // クラス形式できっちり渡す
    TKRIntent *intent = [TKRIntent intentWithObject:@"hello"];
    [self performSegueWithIdentifier:@"Push" intent:intent];
}

- (IBAction)modal
{
/*     [self performSegueWithIdentifier:@"Modal" sender:nil]; */
    

    [self performSegueWithIdentifier:@"Modal" sender:nil];
}

- (IBAction)unwindActionForSegue:(UIStoryboardSegue *)segue
{
}

@end
