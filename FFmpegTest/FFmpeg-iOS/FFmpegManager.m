//
//  FFmpegManager.m
//  FFmpegTest
//
//  Created by iOS_Onion on 2019/6/20.
//  Copyright © 2019 iOS_Onion. All rights reserved.
//

#import "FFmpegManager.h"
#import "ffmpeg.h"

@implementation FFmpegManager

+ (FFmpegManager *)sharedManager{
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [FFmpegManager new];
    });
    
    return instance;
}

- (void)runCmdWithArray:(NSArray *)array
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self runCmd:array];
    });
    
}

- (void)runCmd:(NSArray *)array
{
    if (array == NULL || array.count <=0)
    {
        return;
    }
    // 将OC对象转换为对应的C对象
    int argc = (int)array.count;
    char** argv = (char**)malloc(sizeof(char*)*argc);
    for(int i=0; i < argc; i++) {
        argv[i] = (char*)malloc(sizeof(char)*1024);
        strcpy(argv[i],[[array objectAtIndex:i] UTF8String]);
    }
    
#if DEBUG
    // 打印日志
    NSString *finalCommand = @"ffmpeg 运行参数:";
    for (NSString *temp in array) {
        finalCommand = [finalCommand stringByAppendingFormat:@"%@",temp];
    }
    NSLog(@"%@",finalCommand);
#endif
    
    // 传入指令数及指令数组
    int result =  ffmpeg_main(argc,argv);
    if (result >=0)
    {
        NSLog(@"指令执行成功");
    }else
    {
        NSLog(@"指令执行失败");
    }
}


@end
