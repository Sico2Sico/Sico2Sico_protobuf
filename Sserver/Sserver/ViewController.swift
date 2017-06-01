//
//  ViewController.swift
//  Sserver
//
//  Created by 吴德志 on 2017/6/1.
//  Copyright © 2017年 Sico2Sico. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    fileprivate var servermasg : SServerManager = SServerManager()

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startServer(_ sender: Any) {
        
        servermasg.startRuning()
        
        showUILabel.stringValue = "服务器已开启"
    }

    @IBAction func ColseServer(_ sender: Any) {
        
        servermasg.stopRuning()
        showUILabel.stringValue = "服务器为开启"
    }
   
    @IBOutlet weak var showUILabel: NSTextField!
    
}

