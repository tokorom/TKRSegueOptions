//
//  TKRSegueOptionSetting.m
//
//  Created by ToKoRo on 2014-04-12.
//

#import "TKRSegueOptionSetting.h"

@interface TKRSegueOptionSetting ()
@property (strong) NSDictionary *settingMap;
@end 

@implementation TKRSegueOptionSetting

//----------------------------------------------------------------------------//
#pragma mark - Lifecycle
//----------------------------------------------------------------------------//

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if ((self = [super init])) {
        [self setupWithDictionary:dictionary];
    }
    return self;
}
    
+ (instancetype)settingWithDictionary:(NSDictionary *)dictionary
{
    return [[TKRSegueOptionSetting alloc] initWithDictionary:dictionary];
}

//----------------------------------------------------------------------------//
#pragma mark - Public Interface
//----------------------------------------------------------------------------//

- (void)setupWithDictionary:(NSDictionary *)dictionary
{
    self.settingMap = dictionary;
}

- (id)objectForKeyedSubscript:(id)key
{
    return self.settingMap[key];
}

@end
