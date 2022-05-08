//
//  TopSearchView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//
/// https://blckbirds.com/post/how-to-create-a-search-bar-with-swiftui/
/// https://github.com/ioscreator/ioscreator

import SwiftUI

// ViewModel ===> View
protocol TopSearchViewModelViewSupport: AnyObject {
	func didSelected(fruit: TopSearchView.FruitItem)
}

struct TopSearchView {
	struct FruitItem: Identifiable {
		var id = UUID()
		var name: String = ""
	}
	
	private init() { }
}

// Properties is used for View
extension TopSearchView {
	class IProps: DefaultIProps<TopSearchViewModelViewSupport>, ObservableObject {
		func didSelected(fruit: FruitItem) {
			indViewModel?.didSelected(fruit: fruit)
		}
	}
}

// MARK: - ================================= View Layout =================================
extension TopSearchView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var props: IProps
		@State private var searchText = ""
		var searchResults: [FruitItem] {
			if searchText.isEmpty {
				return myFruits
			}
			
			return myFruits.filter { $0.name.contains(searchText) }
		}
		
		let myFruits = [
			FruitItem(name: "Apple 🍏"),
			FruitItem(name: "Banana 🍌"),
			FruitItem(name: "Blueberry 🫐"),
			FruitItem(name: "Strawberry 🍓"),
			FruitItem(name: "Avocado 🥑"),
			FruitItem(name: "Cherries 🍒"),
			FruitItem(name: "Mango 🥭"),
			FruitItem(name: "Watermelon 🍉"),
			FruitItem(name: "Grapes 🍇"),
			FruitItem(name: "Lemon 🍋"),
			FruitItem(name: "Apple 🍏"),
			FruitItem(name: "Banana 🍌"),
			FruitItem(name: "Blueberry 🫐"),
			FruitItem(name: "Strawberry 🍓"),
			FruitItem(name: "Avocado 🥑"),
			FruitItem(name: "Cherries 🍒"),
			FruitItem(name: "Mango 🥭"),
			FruitItem(name: "Watermelon 🍉"),
			FruitItem(name: "Grapes 🍇"),
			FruitItem(name: "Lemon 🍋")
		]
		
		var body: some View {
			
			if #available(iOS 15.0, *) {
				NavigationView {
					List(searchResults) { fruit in
						Button {
							didSelected(fruit: fruit)
						} label: {
							Text(fruit.name)
						}
						.listRowSeparatorTint(.gray)
					}
					.listStyle(.plain)
					.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
						ForEach(searchResults) { result in
							Text("Are you looking for \(result.name)?") .searchCompletion(result.name)
						}
					}
					.navigationTitle("Fruit")
				}
			} else {
				// https://stackoverflow.com/questions/56490963/how-to-display-a-search-bar-with-swiftui
			}
		}
		
		private func didSelected(fruit: FruitItem) {
			props.didSelected(fruit: fruit)
		}
	}
}

#if DEBUG
struct TopSearchView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopViewModelImpl()
		let props = TopSearchView.IProps(viewModel: viewModel)
		AnyView(TopSearchView.IView(props: props))
	}
}
#endif
