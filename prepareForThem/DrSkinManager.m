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
    dispatch_queue_t queue = dispatch_get_global_queue(
                                                       DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
//        NSURL *url = [NSURL URLWithString:@"http://www.icodeblog.com/wp-content/uploads/2012/08/zipfile.zip"];
        NSError *error = nil;
        // 2
//        NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"zip" ofType:@"zip"]];
        
        if(!error)
        {
            // 3
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *path = [paths objectAtIndex:0];
            NSString *zipPath = [path stringByAppendingPathComponent:@"zipfile.zip"];
            [data writeToFile:zipPath options:0 error:&error];
            if(!error)
            {
                NSLog(@"Save zip success");
                // TODO: Unzip
                ZipArchive *zip = [[ZipArchive alloc]init];
                if([zip UnzipOpenFile:zipPath]){
                    BOOL ret =[zip UnzipFileTo:DocumentPath overWrite:YES];
                    if(ret){
                        NSLog(@"Uzip Success");
                        //解压完成后删除压缩包
                        NSFileManager *fileManager = [NSFileManager defaultManager];
                        [fileManager removeItemAtPath:zipPath error:nil];
//                        NSString *zipName = [[DocumentPath lastPathComponent]stringByDeletingPathExtension];
                        NSString *imagePath = [NSString stringWithFormat:@"%@/zip/tab_1.png",DocumentPath];
                        NSLog(@"%@",imagePath);
                    }
                }
            }
            else
            {
                NSLog(@"Error saving file %@",error);
            }
        }
        else
        {
            NSLog(@"Error downloading zip file: %@", error);
        }
        
    });
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
