//
//  UIViewController+SegueOptions.m
//
//  Created by ToKoRo on 2014-04-09.
//

#import "UIViewController+SegueOptions.h"
#import <objc/runtime.h>

const char UIViewControllerSegueOptionsPropertiesKey[] = "UIViewController+SegueOptions.properties";
static NSString * const UIViewControllerSegueOptionsPostKey = @"UIViewController+SegueOptions.post";
static NSString * const UIViewControllerSegueOptionsGotKey = @"UIViewController+SegueOptions.got";

@implementation UIViewController (SegueOptions)

//----------------------------------------------------------------------------//
#pragma mark - Public Interface
//----------------------------------------------------------------------------//
    
- (void)performSegueWithIdentifier:(NSString *)identifier options:(id)options
{
    [self performSegueWithIdentifier:identifier sender:nil options:options];
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender options:(id)options
{
    if (options) {
        TKRSegueOption *option;
        if ([options isKindOfClass:[TKRSegueOption class]]) {
            option = options;
        } else {
            option = [TKRSegueOption optionWithObject:options];
        }
        self.tkr_properties[UIViewControllerSegueOptionsPostKey][identifier] = option;
    } else {
        [self.tkr_properties[UIViewControllerSegueOptionsPostKey] removeObjectForKey:identifier];
    }
    [self performSegueWithIdentifier:identifier sender:sender];
}

- (id)segueOptions
{
    return self.tkr_properties[UIViewControllerSegueOptionsGotKey];
}

//----------------------------------------------------------------------------//
#pragma mark - UIViewController
//----------------------------------------------------------------------------//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSMutableDictionary *properties = [segue.sourceViewController tkr_properties];
    id options = properties[UIViewControllerSegueOptionsPostKey][segue.identifier];
    [self tkr_updateSegueOptions:options forViewController:segue.destinationViewController];

    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = segue.destinationViewController;
        [self tkr_updateSegueOptions:options forViewController:navigationController.viewControllers.lastObject];
    } else if ([segue.destinationViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = segue.destinationViewController;
        for (UIViewController *viewController in tabBarController.viewControllers) {
            [self tkr_updateSegueOptions:options forViewController:viewController];
        }
    } 
}

#pragma clang diagnostic pop

//----------------------------------------------------------------------------//
#pragma mark - Accessors
//----------------------------------------------------------------------------//

- (NSMutableDictionary *)tkr_properties
{
    NSMutableDictionary *properties = objc_getAssociatedObject(self, UIViewControllerSegueOptionsPropertiesKey);
    if (!properties) {
        properties = [NSMutableDictionary dictionary];
        properties[UIViewControllerSegueOptionsPostKey] = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, UIViewControllerSegueOptionsPropertiesKey, properties, OBJC_ASSOCIATION_RETAIN);
    }
    return properties;
}

- (void)tkr_updateSegueOptions:(id)options forViewController:(UIViewController *)viewController
{
    NSMutableDictionary *properties = [viewController tkr_properties];
    if (options) {
        properties[UIViewControllerSegueOptionsGotKey] = options;
    } else {
        [properties removeObjectForKey:UIViewControllerSegueOptionsGotKey];
    }
}

@end
