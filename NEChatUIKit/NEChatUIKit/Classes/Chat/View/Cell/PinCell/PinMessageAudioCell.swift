//// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit

class PinMessageAudioCell: PinMessageBaseCell {
  var audioImageView = UIImageView(image: UIImage.ne_imageNamed(name: "left_play_3"))
  var audioTimeLabel = UILabel()
  public var bubbleImage = UIImageView()

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

    if let image = NEKitChatConfig.shared.ui.leftBubbleBg {
      bubbleImage.image = image
        .resizableImage(withCapInsets: UIEdgeInsets(top: 35, left: 25, bottom: 10, right: 25))
    }
    bubbleImage.translatesAutoresizingMaskIntoConstraints = false
    bubbleImage.isUserInteractionEnabled = true
    backView.addSubview(bubbleImage)
    contentWidth = bubbleImage.widthAnchor.constraint(equalToConstant: 0)
    contentHeight = bubbleImage.heightAnchor.constraint(equalToConstant: 0)
    NSLayoutConstraint.activate([
      contentHeight!,
      contentWidth!,
      bubbleImage.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
      bubbleImage.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 12),
    ])

    audioImageView.contentMode = .center
    audioImageView.translatesAutoresizingMaskIntoConstraints = false
    bubbleImage.addSubview(audioImageView)
    NSLayoutConstraint.activate([
      audioImageView.leftAnchor.constraint(equalTo: bubbleImage.leftAnchor, constant: 16),
      audioImageView.centerYAnchor.constraint(equalTo: bubbleImage.centerYAnchor),
      audioImageView.widthAnchor.constraint(equalToConstant: 28),
      audioImageView.heightAnchor.constraint(equalToConstant: 28),
    ])

    audioTimeLabel.font = UIFont.systemFont(ofSize: 14)
    audioTimeLabel.textColor = UIColor.ne_darkText
    audioTimeLabel.textAlignment = .left
    audioTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    bubbleImage.addSubview(audioTimeLabel)
    NSLayoutConstraint.activate([
      audioTimeLabel.leftAnchor.constraint(equalTo: audioImageView.rightAnchor, constant: 12),
      audioTimeLabel.centerYAnchor.constraint(equalTo: bubbleImage.centerYAnchor),
      audioTimeLabel.rightAnchor.constraint(equalTo: bubbleImage.rightAnchor, constant: -12),
      audioTimeLabel.heightAnchor.constraint(equalToConstant: 28),
    ])
  }

  override func configure(_ item: PinMessageModel) {
    super.configure(item)
    if let m = item.chatmodel as? MessageAudioModel {
      audioTimeLabel.text = "\(m.duration)" + "s"
    }
  }
}
