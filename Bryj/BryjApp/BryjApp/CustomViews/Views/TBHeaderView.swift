//
//  TBHeaderView.swift
//  BryjApp
//
//  Created by Piyush Mandaliya on 2022-06-02.
//

import Foundation
import UIKit

protocol TBHeaderViewDelegate: AnyObject {
    func didTapMenu()
}

class TBHeaderView: UIView {
 
    let headerImageView = TBHeaderImageView(frame: .zero)
    let menuButton      = UIButton()
    weak var delegate: TBHeaderViewDelegate!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHeaderImageView()
        configureMenuButton()
    }
    
    
    convenience init(delegate: TBHeaderViewDelegate) {
        self.init(frame: .zero)
        self.delegate   = delegate
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func configureHeaderImageView() {
        addSubview(headerImageView)
        translatesAutoresizingMaskIntoConstraints   = false

        NSLayoutConstraint.activate([
            headerImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant:  40),
            headerImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureMenuButton() {
        addSubview(menuButton)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.setImage(Image.menu, for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            menuButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            menuButton.heightAnchor.constraint(equalToConstant: 35),
            menuButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
        
    
    @objc func menuButtonTap() {
        delegate.didTapMenu()
    }
}
