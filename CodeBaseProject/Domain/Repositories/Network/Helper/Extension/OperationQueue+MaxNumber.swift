//
//  OperationQueue+MaxNumber.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

extension OperationQueue {
	convenience init(maxConcurrentOperationCount: Int) {
		self.init()
		self.maxConcurrentOperationCount = maxConcurrentOperationCount
	}
}
