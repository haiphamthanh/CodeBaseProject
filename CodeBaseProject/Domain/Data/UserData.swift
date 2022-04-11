//
//  UserData.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

struct UserData {
	struct Info {
		public let id: Int
		public let actived: Bool
		public let name: String?
		public let hireable: Bool?
		public let location: String?
		public let bio: String?
	}
	
	struct Email {
		public let email: String
		public let verified: Bool
		public let primary: Bool
		public let visibility: String?
	}
	
	let info: Info?
	let email: Email?
	
	// Init
	init(user: UserEntity? = nil, mail: UserEmailEntity? = nil) {
		self.info = user?.asData()
		self.email = mail?.asData()
	}
}

// MARK: Translation supporting
extension UserEntity: DataConvertible {
	typealias DataType = UserData.Info
	
	func asData() -> DataType {
		return UserData.Info(id: id,
							 actived: actived,
							 name: name,
							 hireable: hireable,
							 location: location,
							 bio: bio)
	}
}


extension UserEmailEntity: DataConvertible {
	typealias DataType = UserData.Email
	
	func asData() -> DataType {
		UserData.Email(email: email,
					   verified: verified,
					   primary: primary,
					   visibility: visibility)
	}
}
