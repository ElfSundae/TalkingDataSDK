//
//  UIDevice+TalkingDataExtension.m
//  Example
//
//  Created by Elf Sundae on 2020/05/23.
//  Copyright © 2020 https://0x123.com. All rights reserved.
//

#import "UIDevice+TalkingDataExtension.h"
#import <TalkingDataSDK-AppAnalytics/TalkingData.h>

@implementation UIDevice (TalkingDataExtension)

- (NSString *)talkingDataDeviceIdentifier
{
    return [TalkingData getDeviceID];
}

@end
