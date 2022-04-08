//
//  AppUserData.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

struct AppUserData: Identifiable {
	enum Level: String {
		case guest
		case silver
		case gold
		case diamon
	}
	
	struct Info: Identifiable {
		let id: String
		let actived: Bool
		let name: String?
		let hireable: Bool?
		let location: String?
		let bio: String?
		let level: Level
	}
	
	struct Email: Identifiable {
		let id: String
		let email: String
		let verified: Bool
		let primary: Bool
		let visibility: String?
	}
	
	private(set) var id: String
	private(set) var info: Info
	private(set) var email: Email?
	
	mutating func update(_ info: Info, email: Email?, acceptNilValue: Bool = true) {
		self.id = info.id
		self.info = info
		if acceptNilValue {
			self.email = email
		}
	}
}


// MARK: Translation supporting
extension UserData.Info: AppDataPresentation {
	typealias AppModelType = AppUserData.Info
	
	func asAppModel() -> AppModelType {
		return AppUserData.Info(id: "\(id)",
								 actived: actived,
								 name: name,
								 hireable: hireable,
								 location: location,
								 bio: bio,
								 level: .gold)
	}
}


extension UserData.Email: AppDataPresentation {
	typealias AppModelType = AppUserData.Email
	
	func asAppModel() -> AppModelType {
		return AppUserData.Email(id: "id",
								  email: email,
								  verified: verified,
								  primary: primary,
								  visibility: visibility)
	}
}
