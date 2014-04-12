//
//  TKRSegueOption.m
//
//  Created by ToKoRo on 2014-04-12.
//

#import "TKRSegueOption.h"

@interface TKRSegueOption ()
@property (strong) id value;
@end 

@implementation TKRSegueOption

//----------------------------------------------------------------------------//
#pragma mark - Lifecycle
//----------------------------------------------------------------------------//

- (instancetype)initWithObject:(id)object
{
    if ((self = [super init])) {
        self.value = object;
    }
    return self;
}

+ (instancetype)optionWithObject:(id)object
{
    if ([object isKindOfClass:[TKRSegueOption class]]) {
        return object;
    } else {
        return [[TKRSegueOption alloc] initWithObject:object];
    }
}

//----------------------------------------------------------------------------//
#pragma mark - Public Interface
//----------------------------------------------------------------------------//
    
- (NSString *)stringValue
{
    if ([self.value respondsToSelector:@selector(stringValue)]) {
        return [self.value stringValue];
    } else if ([self.value isKindOfClass:[NSString class]]) {
        return self.value;
    } 
    return [self.value description];
}

- (NSNumber *)numberValue
{
    if ([self.value respondsToSelector:@selector(numberValue)]) {
        return [self.value numberValue];
    } else if ([self.value respondsToSelector:@selector(integerValue)]) {
        return @([self.value integerValue]);
    }
    return @([[self stringValue] integerValue]);
}

- (double)doubleValue
{
    if ([self.value respondsToSelector:@selector(doubleValue)]) {
        return [self.value doubleValue];
    }
    return [[self stringValue] doubleValue];
}

- (float)floatValue
{
    if ([self.value respondsToSelector:@selector(floatValue)]) {
        return [self.value floatValue];
    }
    return [[self stringValue] floatValue];
}

- (int)intValue
{
    if ([self.value respondsToSelector:@selector(intValue)]) {
        return [self.value intValue];
    }
    return [[self stringValue] intValue];
}

- (NSInteger)integerValue
{
    if ([self.value respondsToSelector:@selector(integerValue)]) {
        return [self.value integerValue];
    }
    return [[self stringValue] integerValue];
}

- (BOOL)boolValue
{
    if ([self.value respondsToSelector:@selector(boolValue)]) {
        return [self.value boolValue];
    }
    return [[self stringValue] boolValue];
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    if ([self.value respondsToSelector:@selector(setObject:atIndexedSubscript:)]) {
        [self.value setObject:obj atIndexedSubscript:idx];
    } else {
        NSAssert(false, @"This value can't respond to `setObject:atIndexedSubscript:`");
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    if ([self.value respondsToSelector:@selector(objectAtIndexedSubscript:)]) {
        return [self.value objectAtIndexedSubscript:idx];
    } else {
        NSAssert(false, @"This value can't respond to `objectAtIndexedSubscript:`");
        return nil;
    }
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    if ([self.value respondsToSelector:@selector(setObject:forKeyedSubscript:)]) {
        [self.value setObject:obj forKeyedSubscript:key];
    } else {
        NSAssert(false, @"This value can't respond to `setObject:forKeyedSubscript:`");
    }
}

- (id)objectForKeyedSubscript:(id)key
{
    if ([self.value respondsToSelector:@selector(objectForKeyedSubscript:)]) {
        return [self.value objectForKeyedSubscript:key];
    } else {
        NSAssert(false, @"This value can't respond to `objectForKeyedSubscript:`");
        return nil;
    }
}

//----------------------------------------------------------------------------//
#pragma mark - Private Methods
//----------------------------------------------------------------------------//

@end
