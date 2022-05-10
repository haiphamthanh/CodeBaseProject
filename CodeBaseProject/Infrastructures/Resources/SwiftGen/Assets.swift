// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen
// https://6ary.medium.com/swiftgen-the-swift-code-generator-91c266671149

import SwiftUI

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum AppColor {
    internal static let colorBg = ColorAsset(name: "color_bg")
    internal static let colorLightYellow = ColorAsset(name: "color_lightYellow")
    internal static let colorPink = ColorAsset(name: "color_pink")
    internal static let colorRed = ColorAsset(name: "color_red")
  }
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let foodBell = ImageAsset(name: "food_bell")
    internal static let foodBurger1 = ImageAsset(name: "food_burger1")
    internal static let foodBurger2 = ImageAsset(name: "food_burger2")
    internal static let foodCart = ImageAsset(name: "food_cart")
    internal static let foodCupcake = ImageAsset(name: "food_cupcake")
    internal static let foodDeliveryMan = ImageAsset(name: "food_delivery-man")
    internal static let foodHamburger = ImageAsset(name: "food_hamburger")
    internal static let foodHeart = ImageAsset(name: "food_heart")
    internal static let foodHome = ImageAsset(name: "food_home")
    internal static let foodMapmaker = ImageAsset(name: "food_mapmaker")
    internal static let foodPizza = ImageAsset(name: "food_pizza")
    internal static let foodProfile = ImageAsset(name: "food_profile")
    internal static let foodSandwich = ImageAsset(name: "food_sandwich")
    internal static let foodSearch = ImageAsset(name: "food_search")
    internal static let linkedInPost1 = ImageAsset(name: "linkedIn_post1")
    internal static let linkedInPost2 = ImageAsset(name: "linkedIn_post2")
    internal static let linkedInPost3 = ImageAsset(name: "linkedIn_post3")
    internal static let linkedInPost4 = ImageAsset(name: "linkedIn_post4")
    internal static let linkedInUser1 = ImageAsset(name: "linkedIn_user1")
    internal static let linkedInUser2 = ImageAsset(name: "linkedIn_user2")
    internal static let linkedInUser3 = ImageAsset(name: "linkedIn_user3")
    internal static let linkedInUser4 = ImageAsset(name: "linkedIn_user4")
    internal static let linkedInUser5 = ImageAsset(name: "linkedIn_user5")
    internal static let linkedInAdd = ImageAsset(name: "linkedIn_Add")
    internal static let linkedInComment = ImageAsset(name: "linkedIn_comment")
    internal static let linkedInLikeButton = ImageAsset(name: "linkedIn_like-button")
    internal static let linkedInMessage = ImageAsset(name: "linkedIn_message")
    internal static let linkedinCircle = ImageAsset(name: "linkedin-circle")
    internal static let icCamera = ImageAsset(name: "ic_camera")
    internal static let icCart = ImageAsset(name: "ic_cart")
    internal static let icClose = ImageAsset(name: "ic_close")
    internal static let icFacebook = ImageAsset(name: "ic_facebook")
    internal static let icHome = ImageAsset(name: "ic_home")
    internal static let icOpen = ImageAsset(name: "ic_open")
    internal static let icSetting = ImageAsset(name: "ic_setting")
    internal static let imgMyAvatar = ImageAsset(name: "img_my_avatar")
    internal static let nike1 = ImageAsset(name: "nike_1")
    internal static let nike2 = ImageAsset(name: "nike_2")
    internal static let nike3 = ImageAsset(name: "nike_3")
    internal static let nike4 = ImageAsset(name: "nike_4")
    internal static let nikeBlack = ImageAsset(name: "nike_black")
    internal static let nikeBlue = ImageAsset(name: "nike_blue")
    internal static let nikeLogo = ImageAsset(name: "nike_logo")
    internal static let nikeShoe = ImageAsset(name: "nike_shoe")
    internal static let nikeSilver = ImageAsset(name: "nike_silver")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  fileprivate let name: String

  internal var color: Color {
	Color(self)
  }
}

internal extension Color {
  /// Creates a named color.
  /// - Parameter asset: the color resource to lookup.
  init(_ asset: ColorAsset) {
	let bundle = Bundle(for: BundleToken.self)
	self.init(asset.name, bundle: bundle)
  }
}

internal struct ImageAsset {
  fileprivate let name: String

  internal var image: Image {
	Image(name)
  }
}

internal extension Image {
  /// Creates a labeled image that you can use as content for controls.
  /// - Parameter asset: the image resource to lookup.
  init(_ asset: ImageAsset) {
	let bundle = Bundle(for: BundleToken.self)
	self.init(asset.name, bundle: bundle)
  }
}

private final class BundleToken {}
