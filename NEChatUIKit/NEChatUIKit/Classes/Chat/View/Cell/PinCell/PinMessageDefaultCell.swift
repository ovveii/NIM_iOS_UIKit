//// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit

class PinMessageDefaultCell: PinMessageTextCell {
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override func setupUI() {
    super.setupUI()
  }

  override func configure(_ item: PinMessageModel) {
    super.configure(item)
    contentLabel.text = chatLocalizable("unkonw_pin_message")
  }
}
