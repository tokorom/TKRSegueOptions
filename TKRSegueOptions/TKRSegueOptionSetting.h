//
//  TKRSegueOptionSetting.h
//
//  Created by ToKoRo on 2014-04-12.
//

@interface TKRSegueOptionSetting : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)settingWithDictionary:(NSDictionary *)dictionary;

- (void)setupWithDictionary:(NSDictionary *)dictionary;

- (id)objectForKeyedSubscript:(id)key;

@end
