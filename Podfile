source 'https://github.com/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'

target 'RealmCRUD' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Realm
  pod 'RealmSwift', '~>2.5.0'

  target 'RealmCRUDTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RealmCRUDUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  puts("Update debug pod settings to speed up build time")
  Dir.glob(File.join("Pods", "**", "Pods*{debug,Private}.xcconfig")).each do |file|
    File.open(file, 'a') { |f| f.puts "\nDEBUG_INFORMATION_FORMAT = dwarf" }
  end
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

