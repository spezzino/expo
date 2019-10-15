//
//  EXOtaPersistanceFactory.m
//  EXOta
//
//  Created by Michał Czernek on 11/10/2019.
//

#import "EXOtaPersistanceFactory.h"

@implementation EXOtaPersistanceFactory

NSMutableDictionary *persistances;

- (id)init
{
    persistances = [[NSMutableDictionary alloc] init];
    return self;
}

+ (id)sharedFactory
{
    static EXOtaPersistanceFactory *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[self alloc] init];
    });
    return factory;
}

- (EXOtaPersistance*)persistanceForId:(NSString* _Nullable)identifier
{
    if(identifier == nil)
    {
        NSArray *values = [persistances allValues];
        if([values count] == 1)
        {
            return values[0];
        } else
        {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Unable to determine which persistence to use! If you have more than one ExpoOTA, make sure you provide native packages manually with ids!" userInfo:nil];
        }
    } else
    {
        EXOtaPersistance *persistance = persistances[identifier];
        if(persistance == nil)
        {
            EXKeyValueStorage *storage = [[EXKeyValueStorage alloc] initWithId:identifier];
            persistance = [[EXOtaPersistance alloc] initWithStorage:storage];
            [persistances setValue:persistance forKey:identifier];
        }
        return persistance;
    }
}

@end
