//
//  Banner.swift
//  Junos
//
//  Created by Yu Juno on 2021/06/02.
//

import UIKit

typealias voidBlock = () -> Void

enum BannerType {
	case success
	case failure
}

extension UIViewController {
	
	func showStatusBarBanner(
		background: UIColor,
		with text: String,
		tag: Int = 100) {
		let banner = UILabel()
		banner.alpha = 0
		banner.tag = tag
		banner.backgroundColor = background
		banner.attributedText = AttrText.make(text, .bold, 15.aF, .white)
		self.view.addSubview(banner)
		banner.textAlignment = .center
		banner.translatesAutoresizingMaskIntoConstraints = false
		banner.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
		banner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
		banner.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
		banner.heightAnchor.constraint(equalToConstant: 25.aH).isActive = true
		UIView.animate(withDuration: 0.3) {
			banner.alpha = 0.8
		}
	}
	
	func hideStatusBarBanner(
		tag: Int = 100,
		completion: voidBlock? = nil
	) {
		let banners = self.view.subviews.filter {
			return $0.tag == tag
		}
		guard !banners.isEmpty else { return }
		UIView.animate(withDuration: 0.3) {
			banners.forEach{$0.alpha = 0}
		} completion: { (_) in
			banners.forEach{
				$0.removeFromSuperview()
				$0.removeAllConstraints()
				completion?()
			}
		}
	}
	
	func showFloatingBanner(
		type: BannerType,
		with text: String,
		completion: voidBlock? = nil,
		logo: UIView
	) {
		let bannerView = UIView()
		let bannerLabel = UILabel()
		let bannerLogo = logo
		var bannerPosition: NSLayoutConstraint!
		
		//Configure BannerView
		switch type {
		case .success:
			bannerView.backgroundColor = .theBannerCoolBlue
		case .failure:
			bannerView.backgroundColor = .theBannerRed
		}
		
		bannerView.layer.cornerRadius = 25.aH
		bannerView.alpha = 0.8
		bannerView.tag = 101
		
		//Configure BannerLabel
		bannerLabel.attributedText = AttrText.make(text, .bold, 18.aF, .white)
		bannerLabel.minimumScaleFactor = 0.5
		bannerLabel.adjustsFontSizeToFitWidth = true
		bannerLabel.textAlignment = .center
		
		//Add BannerView and set constraints
		self.view.addSubview(bannerView)
		bannerView.translatesAutoresizingMaskIntoConstraints = false
		bannerView.widthAnchor.constraint(equalToConstant: 400.aW).isActive = true
		bannerView.heightAnchor.constraint(equalToConstant: 80.aH).isActive = true
		bannerPosition = bannerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -200.aH)
		bannerPosition.isActive = true
		bannerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		
		//Add BannerAnimation to BannerView and set constraints
		bannerView.addSubview(bannerLogo)
		bannerLogo.translatesAutoresizingMaskIntoConstraints = false
		bannerLogo.widthAnchor.constraint(equalToConstant: 75.aW).isActive = true
		bannerLogo.heightAnchor.constraint(equalToConstant: 75.aH).isActive = true
		bannerLogo.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 10.aW).isActive = true
		bannerLogo.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor).isActive = true
		
		//Add BannerLabel to BannerView and set constraints
		bannerView.addSubview(bannerLabel)
		bannerLabel.translatesAutoresizingMaskIntoConstraints = false
		bannerLabel.widthAnchor.constraint(equalToConstant: 280.aW).isActive = true
		bannerLabel.heightAnchor.constraint(equalToConstant: 75.aH).isActive = true
		bannerLabel.leadingAnchor.constraint(equalTo: bannerLogo.trailingAnchor, constant: 5.aW).isActive = true
		bannerLabel.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor).isActive = true
		self.view.layoutIfNeeded()
		
		let hideBannerBlock: (() -> Void) = {
			UIView.animate(
				withDuration: 1,
				delay: 0,
				usingSpringWithDamping: 1,
				initialSpringVelocity: 1,
				options: .curveEaseIn,
				animations: {
					bannerPosition.constant = -200.aH
					self.view.layoutIfNeeded()
				},
				completion: { (_) in
					bannerView.removeFromSuperview()
					bannerView.removeAllConstraints()
					completion?()
				})
		}
		
		//Animate Banner
		UIView.animate(
			withDuration: 0.5,
			delay: 0,
			usingSpringWithDamping: 1,
			initialSpringVelocity: 1,
			options: .curveEaseOut) {
			bannerPosition.constant = 30.aH
			self.view.layoutIfNeeded()
		} completion: { (_) in
			DispatchQueue.main.asyncAfter(
				deadline: .now() + 3,
				execute: hideBannerBlock)
		}
	}
}

extension UIColor {
	static let theBannerCoolBlue = UIColor(red: 60/255, green: 200/255, blue: 253/255, alpha: 1)
	static let theBannerRed = UIColor(red: 242/255, green: 20/255, blue: 20/255, alpha: 1)
}
