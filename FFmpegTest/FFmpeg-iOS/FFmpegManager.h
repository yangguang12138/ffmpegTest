//
//  FFmpegManager.h
//  FFmpegTest
//
//  Created by iOS_Onion on 2019/6/20.
//  Copyright © 2019 iOS_Onion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFmpegManager : NSObject

- (void)runCmdWithArray:(NSArray *)array;

+ (FFmpegManager *)sharedManager;

@end

NS_ASSUME_NONNULL_END
