//
//  DrSkinManager.m
//  prepareForThem
//
//  Created by 王林芳 on 2018/12/5.
//  Copyright © 2018 王林芳. All rights reserved.
//

#import "DrSkinManager.h"
#define LocalSkinKey @"LocalSkinKey"
@implementation DrSkinManager

+ (void)loadDataForSkinSign{
    //请求主题相关的数据
}
+ (NSString *)localSkinSign{
    return [[NSUserDefaults standardUserDefaults]objectForKey:LocalSkinKey];
}
+ (void)setLocalSkinKey:(NSString *)skinSign{
    [[NSUserDefaults standardUserDefaults]setObject:skinSign forKey:LocalSkinKey];
}
+ (BOOL)isLoadNewSkin{
    if([self localSkinSign]){
        return YES;
    }
    return NO;
}

@end
