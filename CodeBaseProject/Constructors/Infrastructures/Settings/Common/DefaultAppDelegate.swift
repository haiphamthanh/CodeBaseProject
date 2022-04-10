//
//  DefaultAppDelegate.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Swinject

class DefaultAppDelegate {
	//+++ Internal ============
	private var window: UIWindow?
	private var container = Container()
	
	// MARK: - ++++++ Can override functions =================================
	// 1. Register
	func setupSwinject(container: Container, window: UIWindow?) {
		// 1. Setup system register
		SwinjectSystem(container: container, window: window).startSettingUp()
		
		// 2. Setup others
	}
	
	// 2. initialize
	func initialize(with container: Container) {
	}
	
	func setupGlobalThings(with container: Container) {
		// Global setup in subclass
	}
}

extension DefaultAppDelegate: AppDelegateProvider {
	// MARK: - ================================= =================================
	func app(_ app: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
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
	func initSystem(container: Container, window: UIWindow?) {
		setupSwinjectTask(container: container, window: window)
		initTask(with: container)
		configTask(with: container)
		return completedTask(with: container)
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
//		setupKeyboard()
//		setupNetwork()
//		return setupGlobalThings(from: container)
	}
	
	// Completion Task ----------
	func completedTask(with container: Container) {
//		type(of: appThem.self).applyAppearanceDefaults()
//
//		appCoordinator.startProcess()
//			.subscribe()
//			.disposed(by: disposeBag)
	}
}

//import Swinject
//import RxSwift
//import IQKeyboardManagerSwift
//import UserNotifications
//
//class BaseAppDelegate: UIResponder {
//	// MARK: - ================================= Properties =================================
//	//+++ Singleton ============
//	class func shared<T: BaseAppDelegate>() -> T {
//		return UIApplication.shared.delegate as! T
//	}
//
//	//+++ Internal ============
//	private var pWindow: UIWindow?
//	private var pContainer = Container()
//	private let disposeBag = DisposeBag()
//
//	//+++ Usage ============
//	private var mainService: MainServiceProtocol!
//	private var registerService: RegisterAppServiceProtocol!
//	private var appCoordinator: AppCoordinatorProtocol!
//	private var appThem: ThemeServiceProtocol!
//
//	// MARK: - ================================= initSystem =================================
//
//	// 1. Register
//	func register(container: Container, window: UIWindow) {
//		container.register(ThemeServiceProtocol.self, factory: { _ in BaseThemeService() })
//		container.register(MainServiceProtocol.self) { _ in BaseMainService() }
//		container.register(RegisterAppServiceProtocol.self) { _ in BaseRegisterApp(container: container, window: window) }
//	}
//
//	// 2. initialize
//	func initialize(container: Container) {
//		appThem = container.sureResolve(ThemeServiceProtocol.self)
//		mainService = container.sureResolve(MainServiceProtocol.self)
//		registerService = container.sureResolve(RegisterAppServiceProtocol.self)
//		return appCoordinator = container.sureResolve(AppCoordinatorProtocol.self)
//	}
//
//	func setupGlobalThings(from container: Container) {
//		// Global setup in subclass
//	}
//}
//
//// MARK: - ================================= Extension =================================
//extension BaseAppDelegate: UIApplicationDelegate, UNUserNotificationCenterDelegate {
//	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//		pWindow = UIWindow()
//
//		initSystem(container: pContainer, window: pWindow!)
//		return mainService.app(application, didFinishLaunchingWithOptions: launchOptions)
//	}
//
//	func applicationWillResignActive(_ application: UIApplication) {
//		return mainService.appWillResignActive(application)
//	}
//
//	func applicationDidEnterBackground(_ application: UIApplication) {
//		return mainService.appDidEnterBackground(application)
//	}
//
//	func applicationWillEnterForeground(_ application: UIApplication) {
//		return mainService.appWillEnterForeground(application)
//	}
//
//	func applicationDidBecomeActive(_ application: UIApplication) {
//		return mainService.appDidBecomeActive(application)
//	}
//
//	func applicationWillTerminate(_ application: UIApplication) {
//		return mainService.appWillTerminate(application)
//	}
//
//	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//		return mainService.app(app, open: url, options: options)
//	}
//
//	func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//		return mainService.app(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
//	}
//}
//
//// MARK: - ================================= Private =================================
//extension BaseAppDelegate {
//	var container: Container {
//		return pContainer
//	}
//
//	var window: UIWindow? {
//		return pWindow
//	}
//}
//
//// MARK: - ================================= Private =================================
//private extension BaseAppDelegate {
//	func initSystem(container: Container, window: UIWindow) {
//		registerTask(container: container, window: window)
//		initTask(container: container)
//		setupTask()
//
//		return completionTask()
//	}
//
//	// Register Task ----------
//	func registerTask(container: Container, window: UIWindow) {
//		return register(container: container, window: window)
//	}
//
//	// Init Task ----------
//	func initTask(container: Container) {
//		return initialize(container: container)
//	}
//
//	// Setup Task ----------
//	func setupTask() {
//		setupKeyboard()
//		setupNetwork()
//		return setupGlobalThings(from: container)
//	}
//
//	// Completion Task ----------
//	func completionTask() {
//		type(of: appThem.self).applyAppearanceDefaults()
//
//		appCoordinator.startProcess()
//			.subscribe()
//			.disposed(by: disposeBag)
//	}
//
//	// All sub Tasks --------------------------------------------------
//	func setupKeyboard() {
//		IQKeyboardManager.shared.enable = true
//		IQKeyboardManager.shared.enableAutoToolbar = false
//		IQKeyboardManager.shared.shouldResignOnTouchOutside = true
//		IQKeyboardManager.shared.toolbarDoneBarButtonItemText = LocalizedString.doneButton()
//	}
//
//	func setupNetwork() {
//		//		LoadingManager.shared.startInternetTracking()
//	}
//}

