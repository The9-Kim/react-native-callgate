require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-callgate"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "https://h-brick.com.git", :tag => "#{s.version}" }

  
  s.source_files = "ios/**/*.{h,m,mm,swift}"
  # s.pod_target_xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(SRCROOT)/../../node_modules/react-native-callgate/ios' }
  s.xcconfig = { 
    # here on LDFLAG, I had to set -l and then the library name (without lib prefix although the file name has it).
    #  'USER_HEADER_SEARCH_PATHS' => '"${PROJECT_DIR}/.."/',
   "FRAMEWORK_SEARCH_PATHS" => '"${PODS_ROOT}/../../node_modules/react-native-callgate/ios/Library"',
  }

  s.dependency "React-Core"
end
