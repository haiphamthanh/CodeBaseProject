//
//  DefaultAppDelegate.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Swinject
import IQKeyboardManagerSwift

class DefaultAppDelegate {
	//+++ Internal ============
	private var window: UIWindow?
	private lazy var container = Container()
	
	// MARK: - ++++++ Can override functions =================================
	// 1. Register
	func setupSwinject(container: Container, window: UIWindow?) {
		// 1. Setup system register
		SwinjectSystem(container: container, window: window).startSettingUp()
		
		// 2. Setup others
		let appConnect = AppConnect(container: container, window: window)
		appConnect.setting
			.settingInternalTools()
			.settingExternalTools()
			.done()
		appConnect.notification
			.setting1()
			.setting2()
			.done()
		appConnect.background
			.setting1()
			.setting2()
			.done()
		appConnect.color
			.setting1()
			.setting2()
			.done()
		appConnect.theme
			.setting1()
			.setting2()
			.done()
	}
	
	// 2. initialize
	func initialize(with container: Container) {
	}
}

extension DefaultAppDelegate: AppDelegateProvider {
	// MARK: - ================================= =================================
	func app(_ app: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		let window = UIWindow()
		self.window = window
		
		initSystem(container: container, window: window)
		return true
	}
	
	func appWillResignActive(_ app: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}
	
	func appDidEnterBackground(_ app: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func appWillEnterForeground(_ app: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}
	
	func appDidBecomeActive(_ app: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func appWillTerminate(_ app: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
	func app(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		// no equiv. notification. return NO if the application can't open for some reason
		return false
	}
	
	// [START old_delegate]
	func app(_ app: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
		// no equiv. notification. return NO if the application can't open for some reason
		return false
	}
	
}

// MARK: - ================================= Private =================================
private extension DefaultAppDelegate {
	func initSystem(container: Container, window: UIWindow) {
		self.window = UIWindow()
		
		setupSwinjectTask(container: container, window: window)
		initTask(with: container)
		configTask(with: container)
		return completionTask(with: container)
	}
	
	// Register Task ----------
	func setupSwinjectTask(container: Container, window: UIWindow?) {
		return setupSwinject(container: container, window: window)
	}
	
	// Init Task ----------
	func initTask(with container: Container) {
		return initialize(with: container)
	}
	
	// Setup Task ----------
	func configTask(with container: Container) {
		configKeyboard()
		return configNetwork()
	}
	
	// Completion Task ----------
	func completionTask(with container: Container) {
		let appThem = container.sureResolve(AppThemeProvider.self)
		type(of: appThem.self).applyAppearanceDefaults()
		
		//TODO: Transfer to app after done all
//		appCoordinator.startProcess()
//			.subscribe()
//			.disposed(by: disposeBag)
	}
}

// MARK: - ================================= Other tasks =================================
private extension DefaultAppDelegate {
	// All sub Tasks --------------------------------------------------
	func configKeyboard() {
		IQKeyboardManager.shared.enable = true
		IQKeyboardManager.shared.enableAutoToolbar = false
		IQKeyboardManager.shared.shouldResignOnTouchOutside = true
		IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
	}
	
	func configNetwork() {
		//		LoadingManager.shared.startInternetTracking()
	}
}

