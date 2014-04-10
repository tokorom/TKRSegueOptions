//
//  UIViewController+Intents.m
//
//  Created by ToKoRo on 2014-04-09.
//

#import "UIViewController+Intents.h"
#import <objc/runtime.h>

const char UIViewControllerIntentsPropertyValueKey[] = "UIViewController+Intents.value";

@implementation UIViewController (Intents)
    
- (void)performSegueWithIdentifier:(NSString *)identifier intent:(id)intent
{
    [self performSegueWithIdentifier:identifier sender:nil intent:intent];
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender intent:(id)intent
{
    [self setIntent:intent];
    [self performSegueWithIdentifier:identifier sender:sender];
}

- (id)intent
{
    id value = objc_getAssociatedObject(self, UIViewControllerIntentsPropertyValueKey);
    return value;
}

- (void)setIntent:(id)intent
{
    objc_setAssociatedObject(self, UIViewControllerIntentsPropertyValueKey, intent, OBJC_ASSOCIATION_RETAIN);
}

@end
