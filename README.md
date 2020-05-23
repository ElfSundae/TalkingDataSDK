# TalkingDataSDK AppAnalytics

[![Build status](https://github.com/ElfSundae/TalkingDataSDK-AppAnalytics/workflows/Build/badge.svg)](https://github.com/ElfSundae/TalkingDataSDK-AppAnalytics/actions?query=workflow%3ABuild)
![CocoaPods](https://img.shields.io/cocoapods/v/TalkingDataSDK-AppAnalytics)

仅包含 App Analytics 基础功能：常规app运营分析，包含应用启动、留存、用户分群、渠道统计、账户统计及漏斗分析等。

```ruby
pod 'TalkingDataSDK-AppAnalytics'
```

- Documentation: http://doc.talkingdata.com/posts/20
- Download SDK: http://doc.talkingdata.com/posts/58

### Example

```objc
#import <TalkingDataSDK-AppAnalytics/UIDevice+TalkingDataExtension.h>

NSString *UDID = [UIDevice.currentDevice talkingDataDeviceIdentifier];
```
