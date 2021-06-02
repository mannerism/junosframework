//
//  LeftPaddedTextField.swift
//  Junos
//
//  Created by Yu Juno on 2021/06/02.
//

import UIKit

class LeftPaddedTextField: UITextField {
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(
			x: bounds.origin.x + Double(15).aW,
			y: bounds.origin.y,
			width: bounds.width - Double(15).aW,
			height: bounds.height)
	}
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(x: bounds.origin.x + Double(15).aW, y: bounds.origin.y, width: bounds.width - Double(15).aW, height: bounds.height)
	}
}
