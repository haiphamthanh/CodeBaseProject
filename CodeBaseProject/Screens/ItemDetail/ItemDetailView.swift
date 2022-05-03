//
//  ItemDetailView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI
import RxSwift

// ViewModel ===> View
protocol ItemDetailViewModelViewSupport {
	func gotoSomeWhere()
	var title: Observable<String> { get }
}

struct ItemDetailView {
	private init() { }
}

// Properties is used for View
extension ItemDetailView {
	class IPros: DefaultIPros<ItemDetailViewModelViewSupport>, ObservableObject {
		@Published private(set) var title: String = "0"
		private let disposeBag = DisposeBag()
		
		override init(viewModel: ViewModelRule) {
			super.init(viewModel: viewModel)
			
			// View Model Adapter to
			indViewModel?.title
				.subscribe(onNext: didChangedTitle)
				.disposed(by: disposeBag)
		}
		
		func gotoSomeWhere() {
			indViewModel?.gotoSomeWhere()
		}
		
		func didChangedTitle(_ title: String) {
			self.title = title
		}
	}
}

// MARK: - ================================= View Layout =================================
extension ItemDetailView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var body: some View {
			ZStack {
				Color.green.edgesIgnoringSafeArea(.all) //<-- Important!!! Add this modifier to the background Color
				VStack {
					Text("Detail View")
					Button("Go to some where") {
						pros.gotoSomeWhere()
					}
					.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
					.background(Color.red)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity) //<-- Important!!! Make full background
				.background(Color.blue.edgesIgnoringSafeArea(.bottom)) //<-- Important!!! We need to ignore color instead of focusing to frame
				.toolbar {
					ToolbarItem(placement: .principal) {
						HStack {
							Image(systemName: "sun.min.fill")
							Text(pros.title)
								.font(.headline)
						}
					}
				}
			}
			.onDisappear {
				self.pros.invalidate()     // << here !!
			}
		}
	}
}
