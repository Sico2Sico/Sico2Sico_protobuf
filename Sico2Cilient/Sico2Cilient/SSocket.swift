
//
//  SSocket.swift
//  Sico2Cilient
//
//  Created by 吴德志 on 2017/6/1.
//  Copyright © 2017年 Sico2Sico. All rights reserved.
//

import UIKit

protocol SSocketDelegate: class {
    
    func socket(_ socket: SSocket , joinRoom user: UserInfo)
    func socket(_ socket: SSocket , leveRoom user : UserInfo)
    func socket(_ socket: SSocket , chatMsg : TextMessage)
    func socket(_ socket: SSocket , giftMeeage: GifrMessage)
}

class SSocket {
    
    weak var  delegate : SSocketDelegate?
    fileprivate var  tcpCilent : TCPClient
    fileprivate var  userInof : UserInfo.Builder = {
        let userInfo = UserInfo.Builder()
        userInfo.name = "why\(arc4random_uniform(10))"
        userInfo.level = 20
        return userInfo
    }()
    
    init(add: String,port : Int) {
        tcpCilent = TCPClient(addr: add, port: port)
    }
    
    
}


extension SSocket {

    
    func connectSever()->Bool{
        return tcpCilent.connect(timeout: 5).0
    }
    
    func startReadMsg(){
        DispatchQueue.global().async {
            
            while true {
                //1 度取消息长度
                guard let lMSg = self.tcpCilent.read(4) else{ continue }
                let headdata = Data(bytes: lMSg, count: 4)
                var length :Int = 0
                (headdata as NSData).getBytes(&length, length: 4)
                
                //2 读取消息的类型
                guard let  typeMsg = self.tcpCilent.read(2) else {return}
                let  typedata = Data(bytes: typeMsg, count: 2)
                var type :Int = 0
                (typedata as NSData).getBytes(&type, length: 2)
                print(type)
                
                //2 根据消息长度 读取真实的消息
                guard let msg = self.tcpCilent.read(length) else {return }
                
                let  data = Data(bytes: msg, count: length)
                //3 处理消息
                DispatchQueue.main.async {
                    self.handleMsg(type: type, data: data)
                }
                
            }
        }
    
    }
    
    
    fileprivate func handleMsg(type : Int ,data: Data){
        switch type {
        case 0, 1:
             let user = try! UserInfo.parseFrom(data: data)
             type == 0 ? delegate?.socket(self, joinRoom: user):delegate?.socket(self, leveRoom: user)
        case 2:
            let chatMsg = try! TextMessage.parseFrom(data:data)
            delegate?.socket(self, chatMsg: chatMsg)
        case 3:
            let  giftMsg = try! GifrMessage.parseFrom(data:data)
            delegate?.socket(self, giftMeeage: giftMsg)
        default:
            print("未知消息")
        }
    
    }
}


extension SSocket {
    func sendJoinRoom(){
        let  msgData = (try! userInof.build()).data()
        
        sendMsg(data: msgData, type: 0)
    }
    
    func sendLeaveRoom(){
        let msgdata = (try! userInof.build()).data()
        
        sendMsg(data: msgdata, type: 1)
    }
    
    
    func sendTextMsg(message: String){
        //创建textMasge
        let  chatMsg = TextMessage.Builder()
        chatMsg.user = try! userInof.build()
        chatMsg.text = message
        
        //获取对印的data
        let chatdata = (try! chatMsg.build()).data()
        
        sendMsg(data: chatdata, type: 2)
    }
    
    func sendGiftMsg(giftname: String, giftURL: String, giftCount:String){
    
        let giftmsg = GifrMessage.Builder()
        giftmsg.user = try! userInof.build()
        giftmsg.gifname = giftname
        giftmsg.giftUrl = giftURL
        giftmsg.giftCount = giftCount
        //获取对应的data
        let  gitfdata = (try! giftmsg.build()).data()
        sendMsg(data: gitfdata, type: 3)
    }

    
    
    func sendheartBeat(){
        
        let heartString = "I am is heat beat"
        let heartData = heartString.data(using: .utf8)!
        
        // 发送数据
        sendMsg(data: heartData , type: 100)
    }
    
    
    func sendMsg(data: Data , type: Int){
    
        //1 将消息长度 写入data
        var length = data.count
        let  headerData = Data(bytes: &length, count: 4)
        
        //2 消息类型
        var  tmpType = type
        let  typeData = Data(bytes: &tmpType, count: 2)
        
        //3 发送消息
        let  totalData = headerData + typeData + data
        tcpCilent.send(data: totalData)
    }

}















