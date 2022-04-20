//
//  UsefulColors.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

struct FlatColor {
	struct Green {
		static let Fern = UsefulColors.color6ABB72
		static let MountainMeadow = UsefulColors.color3ABB9D
		static let ChateauGreen = UsefulColors.color4DA664
		static let PersianGreen = UsefulColors.color2CA786
	}
	
	struct Blue {
		static let PictonBlue = UsefulColors.color5CADCF
		static let Mariner = UsefulColors.color3585C5
		static let CuriousBlue = UsefulColors.color4590B6
		static let Denim = UsefulColors.color2F6CAD
		static let Chambray = UsefulColors.color485675
		static let BlueWhale = UsefulColors.color29334D
	}
	
	struct Violet {
		static let Wisteria = UsefulColors.color9069B5
		static let BlueGem = UsefulColors.color533D7F
		static let Violet = UsefulColors.color2E0E4A
	}
	
	struct Yellow {
		static let Energy = UsefulColors.colorF2D46F
		static let Turbo = UsefulColors.colorF7C23E
	}
	
	struct Orange {
		static let NeonCarrot = UsefulColors.colorF79E3D
		static let Sun = UsefulColors.colorEE7841
	}
	
	struct Red {
		static let TerraCotta = UsefulColors.colorE66B5B
		static let Valencia = UsefulColors.colorCC4846
		static let Cinnabar = UsefulColors.colorDC5047
		static let WellRead = UsefulColors.colorB33234
	}
	
	struct Gray {
		static let AlmondFrost = UsefulColors.colorA28F85
		static let WhiteSmoke = UsefulColors.colorEFEFEF
		static let Iron = UsefulColors.colorD1D5D8
		static let IronGray = UsefulColors.color75706B
		static let Dark = UsefulColors.colorDARK
		static let Darker = UsefulColors.colorDARKER
	}
}

private enum UsefulColors {
	static let
	// MARK: FLAT
	// green
	color6ABB72 = #colorLiteral(red: 0.41568627450980394, green: 0.7333333333333333, blue: 0.4470588235294118, alpha: 1.0),
	color3ABB9D = #colorLiteral(red: 0.22745098039215686, green: 0.7333333333333333, blue: 0.615686274509804, alpha: 1.0),
	color4DA664 = #colorLiteral(red: 0.30196078431372547, green: 0.6509803921568628, blue: 0.39215686274509803, alpha: 1.0),
	color2CA786 = #colorLiteral(red: 0.17254901960784313, green: 0.6549019607843137, blue: 0.5254901960784314, alpha: 1.0),
	// blue
	color5CADCF = #colorLiteral(red: 0.3607843137254902, green: 0.6784313725490196, blue: 0.8117647058823529, alpha: 1.0),
	color3585C5 = #colorLiteral(red: 0.20784313725490197, green: 0.5215686274509804, blue: 0.7725490196078432, alpha: 1.0),
	color4590B6 = #colorLiteral(red: 0.27058823529411763, green: 0.5647058823529412, blue: 0.7137254901960784, alpha: 1.0),
	color2F6CAD = #colorLiteral(red: 0.1843137254901961, green: 0.4235294117647059, blue: 0.6784313725490196, alpha: 1.0),
	color485675 = #colorLiteral(red: 0.2823529411764706, green: 0.33725490196078434, blue: 0.4588235294117647, alpha: 1.0),
	color29334D = #colorLiteral(red: 0.1607843137254902, green: 0.2, blue: 0.30196078431372547, alpha: 1.0),
	// violet
	color9069B5 = #colorLiteral(red: 0.5647058823529412, green: 0.4117647058823529, blue: 0.7098039215686275, alpha: 1.0),
	color533D7F = #colorLiteral(red: 0.3254901960784314, green: 0.23921568627450981, blue: 0.4980392156862745, alpha: 1.0),
	color2E0E4A = #colorLiteral(red: 0.1824713349, green: 0.05745834857, blue: 0.2901484072, alpha: 1),
	// yellow
	colorF2D46F = #colorLiteral(red: 0.9490196078431372, green: 0.8313725490196079, blue: 0.43529411764705883, alpha: 1.0),
	colorF7C23E = #colorLiteral(red: 0.9686274509803922, green: 0.7607843137254902, blue: 0.24313725490196078, alpha: 1.0),
	// orange
	colorF79E3D = #colorLiteral(red: 0.9686274509803922, green: 0.6196078431372549, blue: 0.23921568627450981, alpha: 1.0),
	colorEE7841 = #colorLiteral(red: 0.9333333333333333, green: 0.47058823529411764, blue: 0.2549019607843137, alpha: 1.0),
	// red
	colorE66B5B = #colorLiteral(red: 0.9019607843137255, green: 0.4196078431372549, blue: 0.3568627450980392, alpha: 1.0),
	colorCC4846 = #colorLiteral(red: 0.8, green: 0.2823529411764706, blue: 0.27450980392156865, alpha: 1.0),
	colorDC5047 = #colorLiteral(red: 0.8627450980392157, green: 0.3137254901960784, blue: 0.2784313725490196, alpha: 1.0),
	colorB33234 = #colorLiteral(red: 0.7019607843137254, green: 0.19607843137254902, blue: 0.20392156862745098, alpha: 1.0),
	// gray
	colorA28F85 = #colorLiteral(red: 0.6352941176470588, green: 0.5607843137254902, blue: 0.5215686274509804, alpha: 1.0),
	colorEFEFEF = #colorLiteral(red: 0.9372549019607843, green: 0.9372549019607843, blue: 0.9372549019607843, alpha: 1.0),
	colorD1D5D8 = #colorLiteral(red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8470588235294118, alpha: 1.0),
	color75706B = #colorLiteral(red: 0.4588235294117647, green: 0.4392156862745098, blue: 0.4196078431372549, alpha: 1.0),
	colorDARK 	= #colorLiteral(red: 0.180, green: 0.235, blue: 0.266, alpha: 1),
	colorDARKER = #colorLiteral(red: 0.161, green: 0.208, blue: 0.235, alpha: 1),
	
	// MARK: OTHERS
	colorF0F8FF = #colorLiteral(red: 0.9411764705882353, green: 0.9725490196078431, blue: 1.0, alpha: 1.0),
	colorFAEBD7 = #colorLiteral(red: 0.9803921568627451, green: 0.9215686274509803, blue: 0.8431372549019608, alpha: 1.0),
	color00FFFF = #colorLiteral(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),
	color7FFFD4 = #colorLiteral(red: 0.4980392156862745, green: 1.0, blue: 0.8313725490196079, alpha: 1.0),
	colorF0FFFF = #colorLiteral(red: 0.9411764705882353, green: 1.0, blue: 1.0, alpha: 1.0),
	colorF5F5DC = #colorLiteral(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.8627450980392157, alpha: 1.0),
	colorFFE4C4 = #colorLiteral(red: 1.0, green: 0.8941176470588236, blue: 0.7686274509803922, alpha: 1.0),
	color000000 = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0),
	colorFFEBCD = #colorLiteral(red: 1.0, green: 0.9215686274509803, blue: 0.803921568627451, alpha: 1.0),
	color0000FF = #colorLiteral(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
	color8A2BE2 = #colorLiteral(red: 0.5411764705882353, green: 0.16862745098039217, blue: 0.8862745098039215, alpha: 1.0),
	colorA52A2A = #colorLiteral(red: 0.6470588235294118, green: 0.16470588235294117, blue: 0.16470588235294117, alpha: 1.0),
	colorDEB887 = #colorLiteral(red: 0.8705882352941177, green: 0.7215686274509804, blue: 0.5294117647058824, alpha: 1.0),
	color5F9EA0 = #colorLiteral(red: 0.37254901960784315, green: 0.6196078431372549, blue: 0.6274509803921569, alpha: 1.0),
	color7FFF00 = #colorLiteral(red: 0.4980392156862745, green: 1.0, blue: 0.0, alpha: 1.0),
	colorD2691E = #colorLiteral(red: 0.8235294117647058, green: 0.4117647058823529, blue: 0.11764705882352941, alpha: 1.0),
	colorFF7F50 = #colorLiteral(red: 1.0, green: 0.4980392156862745, blue: 0.3137254901960784, alpha: 1.0),
	color6495ED = #colorLiteral(red: 0.39215686274509803, green: 0.5843137254901961, blue: 0.9294117647058824, alpha: 1.0),
	colorFFF8DC = #colorLiteral(red: 1.0, green: 0.9725490196078431, blue: 0.8627450980392157, alpha: 1.0),
	colorDC143C = #colorLiteral(red: 0.8627450980392157, green: 0.0784313725490196, blue: 0.23529411764705882, alpha: 1.0),
	color00008B = #colorLiteral(red: 0.0, green: 0.0, blue: 0.5450980392156862, alpha: 1.0),
	color008B8B = #colorLiteral(red: 0.0, green: 0.5450980392156862, blue: 0.5450980392156862, alpha: 1.0),
	colorB8860B = #colorLiteral(red: 0.7215686274509804, green: 0.5254901960784314, blue: 0.043137254901960784, alpha: 1.0),
	colorA9A9A9 = #colorLiteral(red: 0.6627450980392157, green: 0.6627450980392157, blue: 0.6627450980392157, alpha: 1.0),
	color006400 = #colorLiteral(red: 0.0, green: 0.39215686274509803, blue: 0.0, alpha: 1.0),
	colorBDB76B = #colorLiteral(red: 0.7411764705882353, green: 0.7176470588235294, blue: 0.4196078431372549, alpha: 1.0),
	color8B008B = #colorLiteral(red: 0.5450980392156862, green: 0.0, blue: 0.5450980392156862, alpha: 1.0),
	color556B2F = #colorLiteral(red: 0.3333333333333333, green: 0.4196078431372549, blue: 0.1843137254901961, alpha: 1.0),
	colorFF8C00 = #colorLiteral(red: 1.0, green: 0.5490196078431373, blue: 0.0, alpha: 1.0),
	color9932CC = #colorLiteral(red: 0.6, green: 0.19607843137254902, blue: 0.8, alpha: 1.0),
	color8B0000 = #colorLiteral(red: 0.5450980392156862, green: 0.0, blue: 0.0, alpha: 1.0),
	colorE9967A = #colorLiteral(red: 0.9137254901960784, green: 0.5882352941176471, blue: 0.47843137254901963, alpha: 1.0),
	color8FBC8F = #colorLiteral(red: 0.5607843137254902, green: 0.7372549019607844, blue: 0.5607843137254902, alpha: 1.0),
	color483D8B = #colorLiteral(red: 0.2823529411764706, green: 0.23921568627450981, blue: 0.5450980392156862, alpha: 1.0),
	color2F4F4F = #colorLiteral(red: 0.1843137254901961, green: 0.30980392156862746, blue: 0.30980392156862746, alpha: 1.0),
	color00CED1 = #colorLiteral(red: 0.0, green: 0.807843137254902, blue: 0.8196078431372549, alpha: 1.0),
	color9400D3 = #colorLiteral(red: 0.5803921568627451, green: 0.0, blue: 0.8274509803921568, alpha: 1.0),
	colorFF1493 = #colorLiteral(red: 1.0, green: 0.0784313725490196, blue: 0.5764705882352941, alpha: 1.0),
	color00BFFF = #colorLiteral(red: 0.0, green: 0.7490196078431373, blue: 1.0, alpha: 1.0),
	color696969 = #colorLiteral(red: 0.4117647058823529, green: 0.4117647058823529, blue: 0.4117647058823529, alpha: 1.0),
	color1E90FF = #colorLiteral(red: 0.11764705882352941, green: 0.5647058823529412, blue: 1.0, alpha: 1.0),
	colorB22222 = #colorLiteral(red: 0.6980392156862745, green: 0.13333333333333333, blue: 0.13333333333333333, alpha: 1.0),
	colorFFFAF0 = #colorLiteral(red: 1.0, green: 0.9803921568627451, blue: 0.9411764705882353, alpha: 1.0),
	color228B22 = #colorLiteral(red: 0.13333333333333333, green: 0.5450980392156862, blue: 0.13333333333333333, alpha: 1.0),
	colorFF00FF = #colorLiteral(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0),
	colorDCDCDC = #colorLiteral(red: 0.8627450980392157, green: 0.8627450980392157, blue: 0.8627450980392157, alpha: 1.0),
	colorF8F8FF = #colorLiteral(red: 0.9725490196078431, green: 0.9725490196078431, blue: 1.0, alpha: 1.0),
	colorFFD700 = #colorLiteral(red: 1.0, green: 0.8431372549019608, blue: 0.0, alpha: 1.0),
	colorDAA520 = #colorLiteral(red: 0.8549019607843137, green: 0.6470588235294118, blue: 0.12549019607843137, alpha: 1.0),
	color808080 = #colorLiteral(red: 0.5019607843137255, green: 0.5019607843137255, blue: 0.5019607843137255, alpha: 1.0),
	color008000 = #colorLiteral(red: 0.0, green: 0.5019607843137255, blue: 0.0, alpha: 1.0),
	colorADFF2F = #colorLiteral(red: 0.6784313725490196, green: 1.0, blue: 0.1843137254901961, alpha: 1.0),
	colorF0FFF0 = #colorLiteral(red: 0.9411764705882353, green: 1.0, blue: 0.9411764705882353, alpha: 1.0),
	colorFF69B4 = #colorLiteral(red: 1.0, green: 0.4117647058823529, blue: 0.7058823529411765, alpha: 1.0),
	colorCD5C5C = #colorLiteral(red: 0.803921568627451, green: 0.3607843137254902, blue: 0.3607843137254902, alpha: 1.0),
	color4B0082 = #colorLiteral(red: 0.29411764705882354, green: 0.0, blue: 0.5098039215686274, alpha: 1.0),
	colorFFFFF0 = #colorLiteral(red: 1.0, green: 1.0, blue: 0.9411764705882353, alpha: 1.0),
	colorF0E68C = #colorLiteral(red: 0.9411764705882353, green: 0.9019607843137255, blue: 0.5490196078431373, alpha: 1.0),
	colorE6E6FA = #colorLiteral(red: 0.9019607843137255, green: 0.9019607843137255, blue: 0.9803921568627451, alpha: 1.0),
	colorFFF0F5 = #colorLiteral(red: 1.0, green: 0.9411764705882353, blue: 0.9607843137254902, alpha: 1.0),
	color7CFC00 = #colorLiteral(red: 0.48627450980392156, green: 0.9882352941176471, blue: 0.0, alpha: 1.0),
	colorFFFACD = #colorLiteral(red: 1.0, green: 0.9803921568627451, blue: 0.803921568627451, alpha: 1.0),
	colorADD8E6 = #colorLiteral(red: 0.6784313725490196, green: 0.8470588235294118, blue: 0.9019607843137255, alpha: 1.0),
	colorF08080 = #colorLiteral(red: 0.9411764705882353, green: 0.5019607843137255, blue: 0.5019607843137255, alpha: 1.0),
	colorE0FFFF = #colorLiteral(red: 0.8784313725490196, green: 1.0, blue: 1.0, alpha: 1.0),
	colorFAFAD2 = #colorLiteral(red: 0.9803921568627451, green: 0.9803921568627451, blue: 0.8235294117647058, alpha: 1.0),
	colorD3D3D3 = #colorLiteral(red: 0.8274509803921568, green: 0.8274509803921568, blue: 0.8274509803921568, alpha: 1.0),
	color90EE90 = #colorLiteral(red: 0.5647058823529412, green: 0.9333333333333333, blue: 0.5647058823529412, alpha: 1.0),
	colorFFB6C1 = #colorLiteral(red: 1.0, green: 0.7137254901960784, blue: 0.7568627450980392, alpha: 1.0),
	colorFFA07A = #colorLiteral(red: 1.0, green: 0.6274509803921569, blue: 0.47843137254901963, alpha: 1.0),
	color20B2AA = #colorLiteral(red: 0.12549019607843137, green: 0.6980392156862745, blue: 0.6666666666666666, alpha: 1.0),
	color87CEFA = #colorLiteral(red: 0.5294117647058824, green: 0.807843137254902, blue: 0.9803921568627451, alpha: 1.0),
	color778899 = #colorLiteral(red: 0.4666666666666667, green: 0.5333333333333333, blue: 0.6, alpha: 1.0),
	colorB0C4DE = #colorLiteral(red: 0.6901960784313725, green: 0.7686274509803922, blue: 0.8705882352941177, alpha: 1.0),
	colorFFFFE0 = #colorLiteral(red: 1.0, green: 1.0, blue: 0.8784313725490196, alpha: 1.0),
	color00FF00 = #colorLiteral(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
	color32CD32 = #colorLiteral(red: 0.19607843137254902, green: 0.803921568627451, blue: 0.19607843137254902, alpha: 1.0),
	colorFAF0E6 = #colorLiteral(red: 0.9803921568627451, green: 0.9411764705882353, blue: 0.9019607843137255, alpha: 1.0),
	color66CDAA = #colorLiteral(red: 0.4, green: 0.803921568627451, blue: 0.6666666666666666, alpha: 1.0),
	color0000CD = #colorLiteral(red: 0.0, green: 0.0, blue: 0.803921568627451, alpha: 1.0),
	colorBA55D3 = #colorLiteral(red: 0.7294117647058823, green: 0.3333333333333333, blue: 0.8274509803921568, alpha: 1.0),
	color9370DB = #colorLiteral(red: 0.5764705882352941, green: 0.4392156862745098, blue: 0.8588235294117647, alpha: 1.0),
	color3CB371 = #colorLiteral(red: 0.23529411764705882, green: 0.7019607843137254, blue: 0.44313725490196076, alpha: 1.0),
	color7B68EE = #colorLiteral(red: 0.4823529411764706, green: 0.40784313725490196, blue: 0.9333333333333333, alpha: 1.0),
	color00FA9A = #colorLiteral(red: 0.0, green: 0.9803921568627451, blue: 0.6039215686274509, alpha: 1.0),
	color48D1CC = #colorLiteral(red: 0.2823529411764706, green: 0.8196078431372549, blue: 0.8, alpha: 1.0),
	colorC71585 = #colorLiteral(red: 0.7803921568627451, green: 0.08235294117647059, blue: 0.5215686274509804, alpha: 1.0),
	color191970 = #colorLiteral(red: 0.09803921568627451, green: 0.09803921568627451, blue: 0.4392156862745098, alpha: 1.0),
	colorF5FFFA = #colorLiteral(red: 0.9607843137254902, green: 1.0, blue: 0.9803921568627451, alpha: 1.0),
	colorFFE4E1 = #colorLiteral(red: 1.0, green: 0.8941176470588236, blue: 0.8823529411764706, alpha: 1.0),
	colorFFE4B5 = #colorLiteral(red: 1.0, green: 0.8941176470588236, blue: 0.7098039215686275, alpha: 1.0),
	colorFFDEAD = #colorLiteral(red: 1.0, green: 0.8705882352941177, blue: 0.6784313725490196, alpha: 1.0),
	color000080 = #colorLiteral(red: 0.0, green: 0.0, blue: 0.5019607843137255, alpha: 1.0),
	colorFDF5E6 = #colorLiteral(red: 0.9921568627450981, green: 0.9607843137254902, blue: 0.9019607843137255, alpha: 1.0),
	color808000 = #colorLiteral(red: 0.5019607843137255, green: 0.5019607843137255, blue: 0.0, alpha: 1.0),
	color6B8E23 = #colorLiteral(red: 0.4196078431372549, green: 0.5568627450980392, blue: 0.13725490196078433, alpha: 1.0),
	colorFFA500 = #colorLiteral(red: 1.0, green: 0.6470588235294118, blue: 0.0, alpha: 1.0),
	colorFF4500 = #colorLiteral(red: 1.0, green: 0.27058823529411763, blue: 0.0, alpha: 1.0),
	colorDA70D6 = #colorLiteral(red: 0.8549019607843137, green: 0.4392156862745098, blue: 0.8392156862745098, alpha: 1.0),
	colorEEE8AA = #colorLiteral(red: 0.9333333333333333, green: 0.9098039215686274, blue: 0.6666666666666666, alpha: 1.0),
	color98FB98 = #colorLiteral(red: 0.596078431372549, green: 0.984313725490196, blue: 0.596078431372549, alpha: 1.0),
	colorAFEEEE = #colorLiteral(red: 0.6862745098039216, green: 0.9333333333333333, blue: 0.9333333333333333, alpha: 1.0),
	colorDB7093 = #colorLiteral(red: 0.8588235294117647, green: 0.4392156862745098, blue: 0.5764705882352941, alpha: 1.0),
	colorFFEFD5 = #colorLiteral(red: 1.0, green: 0.9372549019607843, blue: 0.8352941176470589, alpha: 1.0),
	colorFFDAB9 = #colorLiteral(red: 1.0, green: 0.8549019607843137, blue: 0.7254901960784313, alpha: 1.0),
	colorCD853F = #colorLiteral(red: 0.803921568627451, green: 0.5215686274509804, blue: 0.24705882352941178, alpha: 1.0),
	colorFFC0CB = #colorLiteral(red: 1.0, green: 0.7529411764705882, blue: 0.796078431372549, alpha: 1.0),
	colorDDA0DD = #colorLiteral(red: 0.8666666666666667, green: 0.6274509803921569, blue: 0.8666666666666667, alpha: 1.0),
	colorB0E0E6 = #colorLiteral(red: 0.6901960784313725, green: 0.8784313725490196, blue: 0.9019607843137255, alpha: 1.0),
	color800080 = #colorLiteral(red: 0.5019607843137255, green: 0.0, blue: 0.5019607843137255, alpha: 1.0),
	colorFF0000 = #colorLiteral(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
	colorBC8F8F = #colorLiteral(red: 0.7372549019607844, green: 0.5607843137254902, blue: 0.5607843137254902, alpha: 1.0),
	color4169E1 = #colorLiteral(red: 0.2549019607843137, green: 0.4117647058823529, blue: 0.8823529411764706, alpha: 1.0),
	color8B4513 = #colorLiteral(red: 0.5450980392156862, green: 0.27058823529411763, blue: 0.07450980392156863, alpha: 1.0),
	colorFA8072 = #colorLiteral(red: 0.9803921568627451, green: 0.5019607843137255, blue: 0.4470588235294118, alpha: 1.0),
	colorF4A460 = #colorLiteral(red: 0.9568627450980393, green: 0.6431372549019608, blue: 0.3764705882352941, alpha: 1.0),
	color2E8B57 = #colorLiteral(red: 0.1803921568627451, green: 0.5450980392156862, blue: 0.3411764705882353, alpha: 1.0),
	colorFFF5EE = #colorLiteral(red: 1.0, green: 0.9607843137254902, blue: 0.9333333333333333, alpha: 1.0),
	colorA0522D = #colorLiteral(red: 0.6274509803921569, green: 0.3215686274509804, blue: 0.17647058823529413, alpha: 1.0),
	colorC0C0C0 = #colorLiteral(red: 0.7529411764705882, green: 0.7529411764705882, blue: 0.7529411764705882, alpha: 1.0),
	color87CEEB = #colorLiteral(red: 0.5294117647058824, green: 0.807843137254902, blue: 0.9215686274509803, alpha: 1.0),
	color6A5ACD = #colorLiteral(red: 0.41568627450980394, green: 0.35294117647058826, blue: 0.803921568627451, alpha: 1.0),
	color708090 = #colorLiteral(red: 0.4392156862745098, green: 0.5019607843137255, blue: 0.5647058823529412, alpha: 1.0),
	colorFFFAFA = #colorLiteral(red: 1.0, green: 0.9803921568627451, blue: 0.9803921568627451, alpha: 1.0),
	color00FF7F = #colorLiteral(red: 0.0, green: 1.0, blue: 0.4980392156862745, alpha: 1.0),
	color4682B4 = #colorLiteral(red: 0.27450980392156865, green: 0.5098039215686274, blue: 0.7058823529411765, alpha: 1.0),
	colorD2B48C = #colorLiteral(red: 0.8235294117647058, green: 0.7058823529411765, blue: 0.5490196078431373, alpha: 1.0),
	color008080 = #colorLiteral(red: 0.0, green: 0.5019607843137255, blue: 0.5019607843137255, alpha: 1.0),
	colorD8BFD8 = #colorLiteral(red: 0.8470588235294118, green: 0.7490196078431373, blue: 0.8470588235294118, alpha: 1.0),
	colorFF6347 = #colorLiteral(red: 1.0, green: 0.38823529411764707, blue: 0.2784313725490196, alpha: 1.0),
	color40E0D0 = #colorLiteral(red: 0.25098039215686274, green: 0.8784313725490196, blue: 0.8156862745098039, alpha: 1.0),
	colorEE82EE = #colorLiteral(red: 0.9333333333333333, green: 0.5098039215686274, blue: 0.9333333333333333, alpha: 1.0),
	colorF5DEB3 = #colorLiteral(red: 0.9607843137254902, green: 0.8705882352941177, blue: 0.7019607843137254, alpha: 1.0),
	colorFFFFFF = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
	colorF5F5F5 = #colorLiteral(red: 0.9607843137254902, green: 0.9607843137254902, blue: 0.9607843137254902, alpha: 1.0),
	colorFFFF00 = #colorLiteral(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0),
	color9ACD32 = #colorLiteral(red: 0.6039215686274509, green: 0.803921568627451, blue: 0.19607843137254902, alpha: 1.0)
}
