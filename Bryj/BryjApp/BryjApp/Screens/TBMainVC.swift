//
//  HomeVC.swift
//  BryjApp
//
//  Created by Piyush Mandaliya on 2022-06-02.
//

import UIKit
import WebKit


class TBMainVC: TBDataLoadingVC  {
    
    let headerView          =   TBHeaderView()
    var webView: WKWebView  =   WKWebView()
    var pageType:PageTitle!
    
    init(pageType: PageTitle) {
        super.init(nibName: nil, bundle: nil)
        self.pageType = pageType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =   .white
        configureHeaderView()
        configureWebView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

//MARK: -  Actions

extension TBMainVC {
    
    func loadWebViewData() {
        guard let url = URL(string: getPageURL()) else {
            return
        }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func getPageURL() -> String {
        switch pageType {
        case .Home:
            return WebURL.home
        case .Account:
            return WebURL.account
        case .Shop:
            return WebURL.shop
        case .bag:
            return WebURL.bag
        case .none:
            return WebURL.home
        }
    }
    
    func evaluateJavaScript(script: String) {
        webView.evaluateJavaScript(script, completionHandler: nil)
    }
}


//MARK: -  Delegate
extension TBMainVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showLoadingView()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Error \(error.localizedDescription)")
        dismissLoadingView()
    }
    
    func webView(_ webView: WKWebView,didFinish navigation: WKNavigation!) {
        let js = "document.getElementById('header-container').style.display = 'none';"
        evaluateJavaScript(script: js)
        dismissLoadingView()
    }
}

extension TBMainVC: TBHeaderViewDelegate {
    func didTapMenu() {
        let js = "document.getElementsByClassName('navbar-toggler')[0].click();"
        evaluateJavaScript(script: js)
    }
}

//MARK: -  LayoutUI
extension TBMainVC {
    
    func configureHeaderView() {
        self.view.addSubview(headerView)
        headerView.delegate = self
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configureWebView() {
        self.view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints   = false
        webView.navigationDelegate                          = self

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        loadWebViewData()
    }
}
