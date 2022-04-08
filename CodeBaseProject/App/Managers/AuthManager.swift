//
//  AuthManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

class AuthManager: ObservableObject {
	enum AuthState {
		case unChecked
		case error(message: String)
		case unVerifiedEmail
		case unActived
		case inValidUser
		case validUser
	}
	
	//MARK: - Instance
	static let shared = AuthManager()
	private let networkService: NetworkServiceProtocol
	private var runningTask: Task<(), Never>?
	private init() {
		// TODO: Make DI
		// TODO: Check allocate many times
		let networkProvider = NetProvider()
		let useCaseProvider = NetUseCaseProvider(networkProvider)
		self.networkService = NetworkService(usecaseProvider: useCaseProvider)
	}
	
	//MARK: - Outputs
	@Published private(set) var forceLogout = false
	@Published private(set) var authState: AuthState = .unChecked
	@Published private(set) var level: AppUserData.Level? = nil
	private var appUserData: AppUserData? {
		didSet {
			didChange(appUserData)
		}
	}
	
	//MARK: - Actions
	func loadUserInfo() {
		runningTask = Task { [weak self] in
			let result = await networkService.user.userInfo(inputUrl: UrlInputUserInfo(userId: "123", gender: nil))
			
			switch result {
			case .success(let userData):
				updateUserInformation(from: userData)
			case .failure(let error):
				//TODO: Handle load error
				print(error)
			}
			
			self?.runningTask = nil
		}
	}
	
	func signOut() {
		if let runningTask = runningTask, !runningTask.isCancelled {
			runningTask.cancel()
		}
		
		let notification = Notification(name: AppUserData.didSignOut, object: nil, userInfo: nil)
		NotificationCenter.default.post(notification)
	}
}

private extension AuthManager {
	private func updateUserInformation(from userData: UserData?) {
		guard let userData = userData, let infoData = userData.info?.asAppModel() else {
			return
		}
		
		//TODO: Translate to AppUserModel
		let emailData = userData.email?.asAppModel()
		let appUserData = AppUserData(id: "", info: infoData, email: emailData)
		self.appUserData = appUserData
	}
	
	private func didChange(_ appUserData: AppUserData?) {
		// Authentication processing
		guard let appUserData = appUserData else {
			forceLogout = true
			return
		}
		
		var authState: AuthState = .unChecked
		
		// if email available
		if let email = appUserData.email, !email.verified {
			authState = .unVerifiedEmail
		}
		
		let info = appUserData.info
		if !info.actived {
			authState = .unActived
		}
		
		if info.id.isEmpty {
			authState = .inValidUser
		}
		
		switch authState {
		case .validUser:
			let notification = Notification(name: AppUserData.didSigned,
											object: nil,
											userInfo: [AppUserData.signedUserInfoKey: appUserData])
			NotificationCenter.default.post(notification)
		case .unChecked, .unVerifiedEmail, .error, .inValidUser, .unActived:
			forceLogout = true
			let notification = Notification(name: AppUserData.didForceSignOut, object: nil, userInfo: nil)
			NotificationCenter.default.post(notification)
		}
		
		self.authState = authState
		self.level = info.level
	}
}

