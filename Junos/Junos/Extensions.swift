//
//  Manager.swift
//  Junos
//
//  Created by Yu Juno on 2021/06/02.
//

import Foundation
import UIKit

var screenSize: CGSize = UIScreen.main.bounds.size

extension UIButton {
	public func setBackgroundColor(
		color: UIColor,
		forState: UIControl.State) {
		self.clipsToBounds = true
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
		if let context = UIGraphicsGetCurrentContext() {
			context.setFillColor(color.cgColor)
			context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
			let colorImage = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			self.setBackgroundImage(colorImage, for: forState)
		}
	}
}

extension Double {
	/// Adjust constraint Height
	public var aH: CGFloat {
		let frame = screenSize
		var adjusted = self * (Double(frame.height) / 768.0)
		
		//set up minimum and maximum adjustable range
		let ratio = adjusted / self
		if ratio < 0.7 {
			adjusted = self * 0.7
		} else if ratio > 1.4 {
			adjusted = self * 1.4
		}
		return CGFloat(adjusted)
	}
	
	/// Adjust constraint width
	public var aW: CGFloat {
		let frame = screenSize
		var adjusted = self * (Double(frame.width) / 1024.0)
		
		//set up minimum and maximum adjustable range
		let ratio = adjusted / self
		if ratio < 0.7 {
			adjusted = self * 0.7
		} else if ratio > 1.4 {
			adjusted = self * 1.4
		}
		return CGFloat(adjusted)
	}
	
	/// Adjust Font Size
	public var aF: Double {
		var adjusted = Double()
		if let window = UIApplication.shared.windows.first,
			 let vc = window.rootViewController {
			let frame = vc.view.frame
			adjusted = self * ((pow((Double(frame.width)), 2) + pow((Double(frame.height)), 2)) / (pow(768.0, 2) + pow(1024.0, 2)))
		}
		//set up minimum and maximum text size
		if adjusted < 14 {
			adjusted = 12
		}
		else if adjusted > self { //do not increase font size
			adjusted = self
		}
		
		//set up minimum and maximum adjustable range
		let ratio = adjusted / self
		if ratio < 0.8 {
			adjusted = self * 0.8
		}
		else if ratio > 1.15 { //do not increase font size
			adjusted = self * 1.15
		}
		
		return adjusted
	}
}


extension UserDefaults {
	public func save<T:Encodable>(customObject object: T, inKey key: String) {
		let encoder = JSONEncoder()
		if let encoded = try? encoder.encode(object) {
			self.set(encoded, forKey: key)
		}
	}
	
	public func retrieve<T:Decodable>(object type:T.Type, fromKey key: String) -> T? {
		if let data = self.data(forKey: key) {
			let decoder = JSONDecoder()
			if let object = try? decoder.decode(type, from: data) {
				return object
			}else {
				print("Couldnt decode object")
				return nil
			}
		}else {
			print("Couldnt find key")
			return nil
		}
	}
}

extension UIView {
	func removeAllConstraints() {
		self.removeConstraints(self.constraints)
		for view in self.subviews {
			view.removeAllConstraints()
		}
	}
}
