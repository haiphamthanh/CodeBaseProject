//
//  ModelIdTreeManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/05/2022.
//

import Foundation

class ModelIdTreeManager {
	class ModelIdNode {
		private let id: UUID
		private(set) var child = [ModelIdNode]()
		init(id: UUID) {
			self.id = id
		}
	}
	
	static let shared = ModelIdTreeManager()
	private init() { }
	private var modelIdTree: ModelIdNode?
	
	/// Everytime when we present some view that dont confirm to model - view rule, you should call these functions
	/// 	lockModel: to prevent model is released (Before present your view)
	/// 	unLockModel: to make everything become normal state (After your view was dissapeared)
	private var isLocking = false
}

// MARK: - ================================= Usage =================================
extension ModelIdTreeManager {
	func isLeafNode(id: UUID) -> Bool {
		print("\(#function) is called")
		if isLocking {
			return false
		}
		
		return modelIdTree?
			.findModel(id: id)?
			.isLeafNode ?? false
	}
	
	func attach(_ id: UUID?, to rootId: UUID?) {
		print("\(#function) is called")
		guard let id = id else {
			return
		}
		
		if modelIdTree == nil {
			return createTree(by: id)
		}
		
		guard let rootId = rootId else {
			return
		}
		
		let model = modelIdTree?.findModel(id: rootId)
		model?.insertChildToLast(node: ModelIdNode(id: id))
	}
	
	func deAttach(_ id: UUID) -> Bool {
		print("\(#function) is called")
		return modelIdTree?
			.findRootModel(id: id)?
			.removeChild(id: id) ?? false
	}
	
	func lockModel() {
		isLocking = true
	}
	
	func unLockModel() {
		isLocking = false
	}
}

// MARK: - ================================= Private =================================
private extension ModelIdTreeManager {
	func createTree(by rootModelId: UUID) {
		print("\(#function) is called \(String(describing: modelIdTree))")
		self.modelIdTree = ModelIdNode(id: rootModelId)
	}
}

// MARK: - ================================= Helper =================================
extension ModelIdTreeManager.ModelIdNode {
	var isLeafNode: Bool {
		return child.isEmpty
	}
	
	func insertChildToLast(node: ModelIdTreeManager.ModelIdNode) {
		child.append(node)
	}
	
	func removeChild(id: UUID) -> Bool {
		child.removeAll(where: {$0.id == id})
		return true
	}
	
	func findModel(id: UUID) -> ModelIdTreeManager.ModelIdNode? {
		print("\(#function) is called")
		if self.id == id {
			return self
		}
		
		return findModelNode(by: id, models: child)
	}
	
	func findRootModel(id: UUID) -> ModelIdTreeManager.ModelIdNode? {
		if self.id == id {
			return self
		}
		
		return findRootModelNode(by: id, root: self, models: self.child)
	}
}

private extension ModelIdTreeManager.ModelIdNode {
	func findModelNode(by id: UUID, models: [ModelIdTreeManager.ModelIdNode]) -> ModelIdTreeManager.ModelIdNode? {
		if models.isEmpty {
			return nil
		}
		
		var module: ModelIdTreeManager.ModelIdNode? = nil
		for model in models {
			if model.id == id {
				return model
			}
			
			module = findModelNode(by: id, models: model.child)
		}
		
		return module
	}
	
	func findRootModelNode(by id: UUID,
						   root: ModelIdTreeManager.ModelIdNode,
						   models: [ModelIdTreeManager.ModelIdNode]) -> ModelIdTreeManager.ModelIdNode? {
		if models.isEmpty {
			return nil
		}
		
		if models.contains(where: {$0.id == id}) {
			return root
		}
		
		var module: ModelIdTreeManager.ModelIdNode? = nil
		for model in models {
			module = findRootModelNode(by: id,
									   root: model,
									   models: model.child)
		}
		
		return module
	}
}
