//
//  DetailPillView.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/10/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import UIKit

@IBDesignable
class DetailPillLabel: UILabel {
  @IBInspectable var radius: CGFloat = 0.0
  @IBInspectable var borderColor: UIColor = .white
  @IBInspectable var borderWidth: CGFloat = 0.0
  @IBInspectable var padding: CGFloat = 0.0

  override func layoutSubviews() {
    self.layer.cornerRadius = radius
    self.layer.borderColor = borderColor.cgColor
    self.layer.borderWidth = borderWidth
  }

  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)

    super.drawText(in: rect.inset(by: insets))
  }

  override var intrinsicContentSize: CGSize {
    var contentSize = super.intrinsicContentSize
    contentSize.height += (padding * 2)
    contentSize.width += (padding * 2)
    return contentSize
  }
}
