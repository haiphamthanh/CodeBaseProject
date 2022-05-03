//
//  TopVideoView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI
import RxSwift

// ViewModel ===> View
protocol TopVideoViewModelViewSupport: AnyObject {
	// MARK: Broadcasting object
	var counting: Observable<Int> { get }
}

struct TopVideoView {
	private init() { }
}

// Properties is used for View
extension TopVideoView {
	class IPros: DefaultIPros<TopVideoViewModelViewSupport>, ObservableObject {
		private let disposeBag = DisposeBag()
		@Published private(set) var counting: String = "0"
		
		override init(viewModel: ViewModelRule) {
			super.init(viewModel: viewModel)
			
			// View Model Adapter to
			let onNextCounting = strongify(self, closure: { (instance, number: Int) in
				instance.counting = "\(number)"
			})
			indViewModel?.counting
				.subscribe(onNext: onNextCounting)
				.disposed(by: disposeBag)
		}
	}
}

// MARK: - ================================= View Layout =================================
extension TopVideoView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text(TabbarType.video.info.name)
				Spacer()
				
				Text("Loading... Please wait for a minutes")
				Text(pros.counting)
				Spacer()
			}
		}
	}
}


#if DEBUG
struct TopVideoView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopViewModelImpl()
		let props = TopVideoView.IPros(viewModel: viewModel)
		AnyView(TopVideoView.IView(pros: props))
	}
}
#endif
