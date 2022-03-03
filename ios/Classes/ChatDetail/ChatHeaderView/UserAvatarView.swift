//
//  UserAvatarView.swift
//  Tnex messenger
//
//  Created by Din Vu Dinh on 28/02/2022.
//

import Foundation
import UIKit

class UserAvatarView: UIView {
    
    lazy var imageView: UIImageView = {
        let imgView = UIImageView.newAutoLayout()
        imgView.image = UIImage(named: "chat_avatar_default")
        imgView.layer.cornerRadius = 22
        imgView.clipsToBounds = true
        imgView.isHidden = true
        return imgView
    }()
    
    lazy var statusView: UIImageView = {
        let imgView = UIImageView.newAutoLayout()
        imgView.image = UIImage(named: "chat_icon_status")
        imgView.autoSetDimension(.height, toSize: 14)
        imgView.autoSetDimension(.width, toSize: 14)
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubview(imageView)
        imageView.autoPinEdge(toSuperviewEdge: .top)
        imageView.autoPinEdge(toSuperviewEdge: .bottom)
        imageView.autoPinEdge(toSuperviewEdge: .right)
        imageView.autoPinEdge(toSuperviewEdge: .left)
        self.addSubview(statusView)
        statusView.autoPinEdge(.bottom, to: .bottom, of: imageView)
        statusView.autoPinEdge(.right, to: .right, of: imageView, withOffset: -2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
