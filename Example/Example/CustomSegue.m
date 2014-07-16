//
//  CustomSegue.m
//
//  Created by ToKoRo on 2014-07-16.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform
{
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *viewController;
    viewController = [sourceViewController.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    [viewController takeOverSegueOptionsFromViewController:self.destinationViewController];
    [self.sourceViewController presentViewController:viewController animated:YES completion:nil];
}
    
@end
