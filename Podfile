# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

#target 'CodeBaseProject' do
#  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!
#
#  # Pods for CodeBaseProject
#
#  target 'CodeBaseProjectTests' do
#    inherit! :search_paths
#    # Pods for testing
#  end
#
#  target 'CodeBaseProjectUITests' do
#    # Pods for testing
#  end
#
#end


# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

workspace 'CodeBaseProject'
project 'CodeBaseProject.xcodeproj'

def shared_pods
	# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
	use_frameworks!
	
	# Pods for utils
	pod 'SwifterSwift' # –Over 500 in 1– for iOS, macOS, tvOS and watchOS
	pod 'SwiftDate' # The best way to deal with Dates & Time Zones in Swift
	pod 'Introspect'
	
	# Pods for Design pattern
	# Dependency injection
	pod 'Swinject'
	
	
	# Pods for presentation
	# Dialog
	pod 'PopupDialog'
	# Toast
	pod 'Toast-Swift'
	# keyboard
	pod 'IQKeyboardManagerSwift'
	
end

target "CodeBaseProject" do
	shared_pods
end
