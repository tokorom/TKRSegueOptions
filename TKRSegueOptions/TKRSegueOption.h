//
//  TKRSegueOption.h
//
//  Created by ToKoRo on 2014-04-12.
//

@interface TKRSegueOption : NSObject

- (instancetype)initWithObject:(id)object;
+ (instancetype)optionWithObject:(id)object;

- (id)value;
- (NSString *)stringValue;
- (NSNumber *)numberValue;
- (double)doubleValue;
- (float)floatValue;
- (int)intValue;
- (NSInteger)integerValue;
- (BOOL)boolValue;

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;
- (id)objectForKeyedSubscript:(id)key;

@end
