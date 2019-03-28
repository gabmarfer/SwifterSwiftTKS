#
# Be sure to run `pod lib lint SwifterSwiftTKS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwifterSwiftTKS'
  s.version          = '1.0.0'
  s.summary          = 'A set of SwifterSwift extensions used in TKS projects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A set of SwifterSwift extensions used in TKS projects. Extensions are customized in order to remove warnings and deprecated methods
                       DESC

  s.homepage         = 'https://github.com/gabmarfer/SwifterSwiftTKS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gabmarfer' => 'gabriel.martelo@gmail.com' }
  s.source           = { :git => 'https://github.com/gabmarfer/SwifterSwiftTKS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.3'

  s.source_files = 'SwifterSwiftTKS/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwifterSwiftTKS' => ['SwifterSwiftTKS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
