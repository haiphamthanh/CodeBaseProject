//
//  AppStoryViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

import RxSwift

// MARK: - ================================= Story support =================================
extension AppStoryViewModelImpl: AppStoryViewModelStorySupport {
	var isAppValid: Observable<Bool> { _isAppValid }
}
