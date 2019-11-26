Pod::Spec.new do |s|
  s.name = 'TalkingDataSDK-AppAnalytics'
  s.version = '4.0.33'
  s.summary = 'TalkingData App Analytics 基础功能 SDK'
  s.homepage = 'https://github.com/ElfSundae/TalkingDataSDK-AppAnalytics'
  s.documentation_url = 'http://doc.talkingdata.com/posts/20'
  s.authors = { 'TalkingData' => 'https://www.talkingdata.com' }
  s.license = { :type => 'Copyright', :text => 'LICENSE Copyright Beijing Tendcloud Tianxia Technology Co., Ltd. All rights reserved.' }
  s.source = { :git => 'https://github.com/ElfSundae/TalkingDataSDK-AppAnalytics.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.source_files = 'TalkingData.h'
  s.vendored_libraries = 'libTalkingData.a'
  s.frameworks = 'AdSupport', 'CoreTelephony', 'CoreMotion', 'Security', 'SystemConfiguration'
  s.libraries = 'z', 'c++'
end
