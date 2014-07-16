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
static NSString * const UIViewControllerSegueOptionsSettingKey = @"UIViewController+SegueOptions.setting";

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
        TKRSegueOption *option = [TKRSegueOption optionWithObject:options];
        self.tkr_properties[UIViewControllerSegueOptionsPostKey][identifier] = option;
    } else {
        [self.tkr_properties[UIViewControllerSegueOptionsPostKey] removeObjectForKey:identifier];
    }
    [self performSegueWithIdentifier:identifier sender:sender];
}

- (void)takeOverSegueOptionsFromViewController:(UIViewController *)viewController
{
    [self.class tkr_updateSegueOptions:viewController.segueOptions forViewController:self];
}

- (id)segueOptions
{
    return self.tkr_properties[UIViewControllerSegueOptionsGotKey];
}

- (TKRSegueOptionSetting *)segueOptionSetting
{
    return nil;
}

- (id)segueOptionsForSegue:(UIStoryboardSegue *)segue
{
    return nil;
}

//----------------------------------------------------------------------------//
#pragma mark - UIViewController
//----------------------------------------------------------------------------//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (!segue.identifier) {
        return;
    }

    id options;
    TKRSegueOptionSetting *setting = self.tkr_properties[UIViewControllerSegueOptionsSettingKey];
    if (!setting) {
        setting = [self segueOptionSetting];
        if (setting) {
            self.tkr_properties[UIViewControllerSegueOptionsSettingKey] = setting;
        }
    }
    options = [self segueOptionsForSegue:segue];
    if (!options && setting[segue.identifier]) {
        id (^block)(void) = setting[segue.identifier];
        options = [TKRSegueOption optionWithObject:block()];
    }

    NSMutableDictionary *properties = [segue.sourceViewController tkr_properties];
    id got = properties[UIViewControllerSegueOptionsPostKey][segue.identifier];
    options = got ?: options;
    [self.class tkr_updateSegueOptions:options forViewController:segue.destinationViewController];

    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = segue.destinationViewController;
        [self.class tkr_updateSegueOptions:options forViewController:navigationController.viewControllers.lastObject];
    } else if ([segue.destinationViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = segue.destinationViewController;
        for (UIViewController *viewController in tabBarController.viewControllers) {
            [self.class tkr_updateSegueOptions:options forViewController:viewController];
        }
    } 

    [self.tkr_properties[UIViewControllerSegueOptionsPostKey] removeObjectForKey:segue.identifier];
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

+ (void)tkr_updateSegueOptions:(id)options forViewController:(UIViewController *)viewController
{
    NSMutableDictionary *properties = [viewController tkr_properties];
    if (options) {
        properties[UIViewControllerSegueOptionsGotKey] = options;
    } else {
        [properties removeObjectForKey:UIViewControllerSegueOptionsGotKey];
    }
}

@end
