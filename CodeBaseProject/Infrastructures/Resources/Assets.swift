// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

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

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
