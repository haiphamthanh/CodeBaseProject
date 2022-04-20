//
//  DomainRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

import Swinject

class DomainRegister {
	private weak var container: Container!
	init(_ container: Container) {
		self.container = container
	}
	
	func start() {
		registerNetworks()
		registerLocals()
		registerRepositories()
		registerUseCases()
	}
}

private extension DomainRegister {
	func registerNetworks() {
		container.register(UserNetwork.self) { _ in return UserNetworkImpl() }
	}
	
	func registerLocals() {
		container.register(UserLocal.self) { _ in return UserLocalImpl() }
	}
	
	func registerRepositories() {
		container.register(UserRepository.self) { _ in UserRepositoryImpl () }
	}
	
	func registerUseCases() {
		container.register(UseCases.self) { _ in UseCasesImpl() }
		
		// Individual Usecases
		container.register(UserUseCase.self) { _ in UserAdapter() }
	}
}
