//
//  TKRSegueOptionsSwizzling.m
//
//  Created by ToKoRo on 2014-04-11.
//

#import "TKRSegueOptionsSwizzling.h"
#import <objc/runtime.h>

//----------------------------------------------------------------------------//
#pragma mark - UIViewController
//----------------------------------------------------------------------------//

@interface UIViewController (SegueOptionsSwizzling)
- (void)backup_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
@end

@implementation UIViewController (SegueOptionsSwizzling)

- (void)backup_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self backup_prepareForSegue:segue sender:sender];
}

@end

//----------------------------------------------------------------------------//
#pragma mark - TKRSegueOptionsSwizzling
//----------------------------------------------------------------------------//

@implementation TKRSegueOptionsSwizzling

+ (void)load
{
    [self swizzleSegueMethods];
}

+ (void)swizzleSegueMethods
{
    Method backup = class_getInstanceMethod([UIViewController class], @selector(backup_prepareForSegue:sender:));
    Method actual = class_getInstanceMethod([UIViewController class], @selector(prepareForSegue:sender:));
    method_exchangeImplementations(actual, backup);
}
    
@end
