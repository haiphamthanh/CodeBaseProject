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
	pod 'Google-Mobile-Ads-SDK'
#	pod 'SwiftyAds' # https://github.com/crashoverride777/swifty-ads
	
	#Animations
#	https://github.com/Toni77777/awesome-swiftui-libraries#Animation
# https://github.com/onmyway133/awesome-swiftui#animation
	
	# Pods for Design pattern
	# Dependency injection
	pod 'Swinject'
	pod 'RxSwift'
#	pod 'RxRelay' # Check later to make Rx mapping to Combine https://kean.blog/post/rxui
	
	# Pods for Network
	# Checking
	pod 'ReachabilitySwift'
	
	# Pods for presentation
	# Dialog
	pod 'PopupDialog'
#	pod 'ExytePopupView' # Check later to SwifUI Usage https://github.com/exyte/PopupView
	# Toast
	pod 'Toast-Swift'
	# keyboard
	pod 'IQKeyboardManagerSwift'
	
end

target "CodeBaseProject" do
	shared_pods
end
