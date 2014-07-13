//
//  TKRSegueOption.h
//
//  Created by ToKoRo on 2014-04-12.
//

@interface TKRSegueOption : NSObject

@property (readonly) id value;
@property (readonly) NSString *stringValue;
@property (readonly) NSNumber *numberValue;
@property (readonly) double doubleValue;
@property (readonly) float floatValue;
@property (readonly) int intValue;
@property (readonly) NSInteger integerValue;
@property (readonly) BOOL boolValue;

- (instancetype)initWithObject:(id)object;
+ (instancetype)optionWithObject:(id)object;

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;
- (id)objectForKeyedSubscript:(id)key;

@end
