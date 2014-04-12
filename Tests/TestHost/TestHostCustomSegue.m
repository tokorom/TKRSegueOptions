//
//  TestHostCustomSegue.m
//
//  Created by ToKoRo on 2014-04-12.
//

#import "TestHostCustomSegue.h"

@implementation TestHostCustomSegue

- (void)perform
{
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;

    [source.navigationController pushViewController:destination animated:NO];
}

@end
