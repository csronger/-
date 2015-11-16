//
//  CSRNewsNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CSRNewsNetManager.h"

#define kNewsPath @"http://api.iclient.ifeng.com/ClientNews"
#define kGv       @"gv":@"4.6.5"
#define kAv       @"av":@0
#define kProid    @"proid":@"ifengnews"
#define kOS       @"os":@"ios_9.1"
#define kVt       @"vt":@5
#define kScreen   @"screen":@"1242x2208"
#define kPublishid  @"publishid":@4002
#define kUid       @"uid":@"bf782cc84bbe869503494a0a64322ba9c0e6aa7c"

#define kSetId(string, dic)     [dic setObject:string forKey:@"id"];
#define kSetType(string, dic)   [dic setObject:string forKey:@"type"];

@implementation CSRNewsNetManager

+ (id)getNewsInfoWithType:(InfoType)type kCompletionHandle
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kGv, kAv, kProid, kOS, kVt, kScreen, kPublishid, kUid}];
    switch (type) {
        case InfoTypeTouTiao: {
            kSetId(@"SYLB10,SYDT10,SYRECOMMEND", params)
            break;
        }
        case InfoTypeYuLe: {
            kSetId(@"YL53,FOCUSYL53", params)
            break;
        }
        case InfoTypeLiShi: {
            kSetId(@"LS153,FOCUSLS153", params)
            break;
        }
        case InfoTypeKeJi: {
            kSetId(@"KJ123,FOCUSKJ123", params)
            break;
        }
        case InfoTypeWenHua: {
            kSetId(@"WH25,FOCUSWH25", params)
            break;
        }
        case InfoTypeDuanZi: {
    
            break;
        }
        case InfoTypeMeiNv: {
        
            break;
        }
        default: {
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    return [self GET:kNewsPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([CSRNewsModel objectArrayWithKeyValuesArray:responseObj].firstObject, error);
    }];
}
@end
