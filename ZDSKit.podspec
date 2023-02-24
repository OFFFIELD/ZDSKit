#
# Be sure to run `pod lib lint YCKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZDSKit'
  s.version          = '0.0.1'
  s.summary          = 'ZDSKit'
  s.description      = <<-DESC
    Zhi Da Swift Kit
    DESC
  s.license          = { :type => 'MIT', :text => <<-LICENSE
    MIT
    LICENSE
  }
  s.homepage         = 'https://github.com/OFFFIELD/ZDSKit'
  s.author           = { 'ZhiDa' => 'ios8899@126.com' }
  s.source           = { :git => 'https://github.com/OFFFIELD/ZDSKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  # s.source_files = 'ZDSKit/Classes/*'
  s.frameworks = 'UIKit', 'Foundation', 'AVKit', 'Photos', 'MediaPlayer', 'CoreLocation', 'CoreGraphics'
  # s.resource_bundles = {
  #   'ZDSKit' => ['ZDSKit/Assets/*.xcassets']
  # }
  
  #类扩展
  s.subspec 'ZDSAuth' do |ss|
      ss.source_files = 'ZDSKit/Classes/ZDSAuth/*'
  end
  
  #类扩展
  s.subspec 'ZDSExtension' do |ss|
      ss.source_files = 'ZDSKit/Classes/ZDSExtension/*'
  end
  
  #循环滚动
  s.subspec 'ZDSPageView' do |ss|
      ss.source_files = 'ZDSKit/Classes/YCPageView/*'
  end
  
  #占位符
  s.subspec 'ZDSPlaceholderBar' do |ss|
      ss.resource     = 'ZDSKit/Classes/ZDSPlaceholderBar/*.xcassets'
      ss.source_files = 'ZDSKit/Classes/ZDSPlaceholderBar/*'
      ss.dependency 'ZDSKit/ZDSExtension'
  end

end
