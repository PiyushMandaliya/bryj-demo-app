//
//  TBHeaderImageView.swift
//  BryjApp
//
//  Created by Piyush Mandaliya on 2022-06-02.
//

import Foundation
import UIKit

class TBHeaderImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        image               = Image.header
        clipsToBounds       = true
        contentMode         = .scaleAspectFit

        translatesAutoresizingMaskIntoConstraints = false
    }
}
