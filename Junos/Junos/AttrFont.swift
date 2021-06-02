//
//  HitItAttributedText.swift
//  HitItUserApp
//
//  Created by Gyurae Kim on 03/09/2019.
//  Copyright © 2019 Hitit Inc. - All Rights Reserved
//
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential. All rights reserved.
//

import UIKit

enum FontStyle: String {
	case regular = "NotoSansCJKkr-Regular"
	case bold = "NotoSansCJKkr-Bold"
	case medium = "NotoSansCJKkr-Medium"
	case underline = "underline"
}

class AttrText {
	static func make(
		_ text: String,
		_ style: FontStyle,
		_ size: Double,
		_ color: UIColor
	) -> NSMutableAttributedString {
		switch style {
		case .regular:
			let font = UIFont(
				name: FontStyle.regular.rawValue,
				size: CGFloat(size)
			)
			let attributes: [NSAttributedString.Key: Any] = [
				NSAttributedString.Key.font: font ?? UIFont.systemFont(
						ofSize: CGFloat(size),
						weight: .regular),
				NSAttributedString.Key.foregroundColor: color
			]
			return NSMutableAttributedString(
				string: text,
				attributes: attributes)
			
		case .bold:
			let font = UIFont(
				name: FontStyle.bold.rawValue,
				size: CGFloat(size))
			let attributes: [NSAttributedString.Key: Any] = [
				NSAttributedString.Key.font: font ?? UIFont.systemFont(
					ofSize: CGFloat(size),
					weight: .bold),
				NSAttributedString.Key.foregroundColor : color
			]
			return NSMutableAttributedString(
				string: text,
				attributes: attributes)
			
		case .medium:
			let font = UIFont(
				name: FontStyle.medium.rawValue,
				size: CGFloat(size)
			)
			let attributes: [NSAttributedString.Key: Any] = [
				NSAttributedString.Key.font: font ?? UIFont.systemFont(
					ofSize: CGFloat(size),
					weight:  .medium),
				NSAttributedString.Key.foregroundColor: color
			]
			return NSMutableAttributedString(
				string: text,
				attributes: attributes)
			
		case .underline:
			let font = UIFont(
				name: FontStyle.regular.rawValue,
				size: CGFloat(size)
			)
			let attributes: [NSAttributedString.Key: Any] = [
				NSAttributedString.Key.font: font ?? UIFont.systemFont(
					ofSize: CGFloat(size),
					weight:  .regular),
				NSAttributedString.Key.foregroundColor: color,
				NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue
			]
			return NSMutableAttributedString(
				string: text,
				attributes: attributes)
		}
	}
	
	static func attributes(
		_ style: FontStyle,
		_ size: Double,
		_ color: UIColor
	) -> [NSAttributedString.Key: Any] {
		switch style {
		case .regular:
			let font = UIFont(
				name: FontStyle.regular.rawValue,
				size: CGFloat(size)
			)
			let attributes: [NSAttributedString.Key: Any] = [
				NSAttributedString.Key.font: font ?? UIFont.systemFont(
					ofSize: CGFloat(size),
					weight: .regular),
				NSAttributedString.Key.foregroundColor: color
			]
			return attributes
			
		case .bold:
			let font = UIFont(
				name: FontStyle.bold.rawValue,
				size: CGFloat(size)
			)
			let attributes: [NSAttributedString.Key: Any] = [
				NSAttributedString.Key.font: font ?? UIFont.systemFont(
					ofSize: CGFloat(size),
					weight: .bold),
				NSAttributedString.Key.foregroundColor: color
			]
			return attributes
			
		case .medium:
			let font = UIFont(
				name: FontStyle.medium.rawValue,
				size: CGFloat(size)
			)
			let attributes: [NSAttributedString.Key: Any] = [
				NSAttributedString.Key.font: font ?? UIFont.systemFont(
					ofSize: CGFloat(size),
					weight:  .medium),
				NSAttributedString.Key.foregroundColor: color
			]
			return attributes
		case .underline:
			let font = UIFont(
				name: FontStyle.regular.rawValue,
				size: CGFloat(size)
			)
			let attributes: [NSAttributedString.Key: Any] = [
				NSAttributedString.Key.font: font ?? UIFont.systemFont(
					ofSize: CGFloat(size),
					weight:  .regular),
				NSAttributedString.Key.foregroundColor: color,
				NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue
			]
			return attributes
		}
	}
}

extension NSMutableAttributedString {
	func withTextAlignment(
		_ alignment: NSTextAlignment
	) -> NSMutableAttributedString {
		let style = NSMutableParagraphStyle()
		style.alignment = alignment
		let attribute = [NSAttributedString.Key.paragraphStyle : style]
		self.addAttributes(attribute, range: NSMakeRange(0, self.length))
		return self
	}
}

