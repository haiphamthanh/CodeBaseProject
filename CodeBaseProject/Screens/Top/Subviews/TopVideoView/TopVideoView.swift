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
	class IProps: DefaultIProps<TopVideoViewModelViewSupport>, ObservableObject {
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
		@ObservedObject var props: IProps
		@State private var animationAmount = 1.0
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text(TabbarType.video.info.name)
				
				Spacer()
				
				Button("Schedule Local Notification") {
					// find out what are the user's notification preferences
					UNUserNotificationCenter.current().getNotificationSettings { (settings) in
						
						// we're only going to create and schedule a notification
						// if the user has kept notifications authorized for this app
						guard settings.authorizationStatus == .authorized else { return }
						
						// create the content and style for the local notification
						let content = UNMutableNotificationContent()
						
						// #2.1 - "Assign a value to this property that matches the identifier
						// property of one of the UNNotificationCategory objects you
						// previously registered with your app."
						content.categoryIdentifier = "debitOverdraftNotification"
						
						// create the notification's content to be presented
						// to the user
						content.title = "DEBIT OVERDRAFT NOTICE!"
						content.subtitle = "Exceeded balance by $300.00."
						content.body = "One-time overdraft fee is $25. Should we cover transaction?"
						content.sound = UNNotificationSound.default
						content.userInfo = ["This is sample key": "This is sample value"]
						
						// #2.2 - create a "trigger condition that causes a notification
						// to be delivered after the specified amount of time elapses";
						// deliver after 10 seconds
						let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
						
						// create a "request to schedule a local notification, which
						// includes the content of the notification and the trigger conditions for delivery"
						//								let uuidString = UUID().uuidString
						let uuidString = AppNotificationData.didReceiveNotification.rawValue
						let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
						
						// "Upon calling this method, the system begins tracking the
						// trigger conditions associated with your request. When the
						// trigger condition is met, the system delivers your notification."
						UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
						
					} // end getNotificationSettings
				}
				
				Text("Loading... Please wait for a minutes")
				Text(props.counting)
				//
				//				Button("Tap Me") {
				//					print("This is Button")
				//				}
				//				.padding(50)
				//				.foregroundColor(.white)
				//				.clipShape(Circle())
				//				.overlay(
				//					Circle()
				//						.stroke(.red)
				//						.scaleEffect(animationAmount)
				//						.opacity(2 - animationAmount)
				//						.animation(
				//							.easeInOut(duration: 1)
				//							.repeatForever(autoreverses: false),
				//							value: animationAmount
				//						)
				//				)
				//				.onAppear {
				//					animationAmount = 2
				//				}
				Spacer()
				
			}
		}
	}
}


#if DEBUG
struct TopVideoView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopViewModelImpl()
		let props = TopVideoView.IProps(viewModel: viewModel)
		AnyView(TopVideoView.IView(props: props))
	}
}
#endif
