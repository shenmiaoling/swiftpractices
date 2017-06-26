//
//  DetailViewController.swift
//  flowerDetail
//
//  Created by vara shen on 2017/6/23.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailWebView: UIWebView!
    var detailItem: AnyObject? {
        didSet {
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            let detailURL: URL = URL(string: detail["url"] as! String!)!
            if let webview = detailWebView {
                webview.loadRequest(URLRequest(url: detailURL))
                navigationItem.title = detail["name"] as! String!
                detailDescriptionLabel.isHidden = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

