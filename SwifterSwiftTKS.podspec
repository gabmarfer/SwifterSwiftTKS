#
# Be sure to run `pod lib lint SwifterSwiftTKS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwifterSwiftTKS'
  s.version          = '1.0.3'
  s.summary          = 'A set of SwifterSwift extensions used in TKS projects.'
  s.description      = <<-DESC
A set of SwifterSwift extensions used in TKS projects. Extensions are customized in order to remove warnings and deprecated methods
                       DESC

  s.homepage         = 'https://github.com/gabmarfer/SwifterSwiftTKS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gabmarfer' => 'gabriel.martelo@gmail.com' }
  s.source           = { :git => 'https://github.com/gabmarfer/SwifterSwiftTKS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.3'
  s.swift_version = '5.0'
  s.source_files = 'SwifterSwiftTKS/Classes/**/*'
end
