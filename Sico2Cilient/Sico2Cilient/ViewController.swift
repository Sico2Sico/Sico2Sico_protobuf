//
//  ViewController.swift
//  Sico2Cilient
//
//  Created by 吴德志 on 2017/6/1.
//  Copyright © 2017年 Sico2Sico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate lazy var  socket :SSocket = SSocket(add: "192.168.1.100", port: 7878)
    fileprivate var outovertime : Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if socket.connectSever() {
            print("连接成功")
            
            socket.startReadMsg()
            
        outovertime = Timer(fireAt: Date(), interval: 9, target: self, selector: #selector(sendHeartBeat), userInfo: nil, repeats: true)
            
        RunLoop.main.add(outovertime, forMode: .commonModes)
        }
    }

    deinit {
        outovertime.invalidate()
        outovertime = nil
    }

    @IBAction func jionRoom() {
        
        socket.sendJoinRoom()
        
    }
    
    
    @IBAction func leaveRoom() {
        socket.sendLeaveRoom()
    }
    

    @IBAction func sendtextMsg() {
        
        socket.sendTextMsg(message: "这是一个文本消息")
    }
    
    @IBAction func sendGift() {
        socket.sendGiftMsg(giftname: "飞机", giftURL: "www.feiji.com", giftCount: "2")
    }
    
}

extension ViewController {
    @objc fileprivate func sendHeartBeat() {
        socket.sendheartBeat()
    }
}



