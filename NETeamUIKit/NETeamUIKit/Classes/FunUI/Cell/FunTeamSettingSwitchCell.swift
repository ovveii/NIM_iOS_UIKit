// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit

@objcMembers
open class FunTeamSettingSwitchCell: NEBaseTeamSettingSwitchCell {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    edgeInset = .zero
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override open func setupUI() {
    super.setupUI()
    contentView.updateLayoutConstraint(firstItem: dividerLine, seconedItem: contentView, attribute: .left, constant: 16)
    contentView.updateLayoutConstraint(firstItem: dividerLine, seconedItem: contentView, attribute: .right, constant: 0)

    NSLayoutConstraint.activate([
      titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -74),
    ])

    tSwitch.onTintColor = .funTeamThemeColor
    NSLayoutConstraint.activate([
      tSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      tSwitch.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -14),
    ])
  }
}
