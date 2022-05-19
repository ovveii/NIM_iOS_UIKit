
// Copyright (c) 2022 NetEase, Inc.  All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the LICENSE file.


import UIKit
import NEKitCore

protocol ConversationNavViewDelegate: AnyObject {
    func didClickAddBtn()
    func searchAction()
}

class ConversationNavView: UIView {
    
    weak var delegate: ConversationNavViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        self.addSubview(brandBtn)
        self.addSubview(searchBtn)
        self.addSubview(addBtn)
        self.addSubview(bottomLine)

        NSLayoutConstraint.activate([
            brandBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
            brandBtn.leftAnchor.constraint(equalTo: self.leftAnchor,constant: NEConstant.screenInterval),
        ])
        
        NSLayoutConstraint.activate([
            addBtn.centerYAnchor.constraint(equalTo: brandBtn.centerYAnchor),
            addBtn.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -NEConstant.screenInterval),
            addBtn.widthAnchor.constraint(equalToConstant: 20),
            addBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            searchBtn.centerYAnchor.constraint(equalTo: brandBtn.centerYAnchor),
            searchBtn.rightAnchor.constraint(equalTo: addBtn.leftAnchor,constant: -NEConstant.screenInterval),
            searchBtn.widthAnchor.constraint(equalToConstant: 20),
            searchBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        NSLayoutConstraint.activate([
            bottomLine.leftAnchor.constraint(equalTo: self.leftAnchor),
            bottomLine.rightAnchor.constraint(equalTo: self.rightAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    //MARK: lazy method
    private lazy var brandBtn:UIButton = {
        let button = UIButton()
        button.setTitle(localizable("云信IM"), for: .normal)
        button.setImage(UIImage.ne_imageNamed(name: "brand_yunxin"), for: .normal)
        button.layoutButtonImage(style: .left, space: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = NEConstant.textFont("PingFangSC-Medium",20)
        return button
    }()
    
    private lazy var searchBtn:UIButton = {
        let button = UIButton()
        button.setImage(UIImage.ne_imageNamed(name: "chat_search"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(searchBtnClick), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var addBtn: ExpandButton = {
        let button = ExpandButton()
        button.setImage(UIImage.ne_imageNamed(name: "chat_add"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        return button
    }()
    
    private lazy var bottomLine:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(hexString: "0xDBE0E8")
        return view
    }()
    
}

extension ConversationNavView {
    
    @objc func searchBtnClick(sender:UIButton) {
        delegate?.searchAction()
    }
    
    @objc func addBtnClick(sender:UIButton) {
        delegate?.didClickAddBtn()
    }
    
}
