//
//  TBDataLoadingVC.swift
//  BryjApp
//
//  Created by Piyush Mandaliya on 2022-06-03.
//

import UIKit

class TBDataLoadingVC: UIViewController {
    var containerView: UIView!

    func showLoadingView() {
        print(self.view.safeAreaLayoutGuide.bottomAnchor)
        containerView                   = UIView()
        view.addSubview(containerView)
        containerView.backgroundColor   = .systemBackground
        containerView.alpha             = 0
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        UIView.animate(withDuration: 0.25) {   self.containerView.alpha = 0.8 }
        
        let activityIndicator   = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        
            
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            if self.containerView != nil {
                self.containerView.removeFromSuperview()
                self.containerView = nil
            }
        }
    }
}
