//
//  AppDelegate.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation

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

