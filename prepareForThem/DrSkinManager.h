//
//  DrSkinManager.h
//  prepareForThem
//
//  Created by 王林芳 on 2018/12/5.
//  Copyright © 2018 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define Name_Resource @"HolidaySkin"
#define DocumentPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject]stringByAppendingPathComponent:Name_Resource];
@interface DrSkinManager : NSObject
+ (NSString *)localSkinSign;
+ (void)setLocalSkinKey:(NSString *)skinSign;
+ (BOOL)isLoadNewSkin;
+ (void)loadDataForSkinSign;
@end

NS_ASSUME_NONNULL_END
