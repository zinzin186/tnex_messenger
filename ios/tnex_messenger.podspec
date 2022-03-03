#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint tnex_messenger.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'tnex_messenger'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*.{swift,xib,pdf,png}'
  s.resource_bundles = ["Classes/*/*.{png,xib,xcassets}", "Classes/*/*/*.{png,xib,xcassets}", "Classes/*/*/*/*.{png,xib,xcassets}", "Classes/*/*/*/*/*.{png,xib,xcassets}"]
  s.resources = 'Assets/*.png'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.dependency 'MatrixSDK'
  s.dependency 'KeychainAccess'
  s.dependency 'SDWebImage', '~> 5.0'
  s.dependency 'PureLayout'
  s.dependency 'InputBarAccessoryView'
end
