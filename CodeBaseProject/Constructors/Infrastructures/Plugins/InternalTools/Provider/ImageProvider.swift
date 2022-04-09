//
//  ImageProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

protocol ImageProvider {
	// Menu
	var logo: UIImage { get }
	
	// Menu
	var leftMenuIcon: UIImage { get }
	var rightMenuIcon: UIImage { get }
	
	// Intro
	var intros: [UIImage] { get }
	
	// Home
	var tabbars: [UIImage] { get }
	
	// User profile
	var avatar: UIImage { get }
}
