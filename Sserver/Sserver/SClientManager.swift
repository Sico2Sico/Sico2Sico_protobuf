//
//  SClientManager.swift
//  Sserver
//
//  Created by 吴德志 on 2017/6/1.
//  Copyright © 2017年 Sico2Sico. All rights reserved.
//

import Cocoa


protocol SClientManagerDelegate : class {
    func sendMsgToClient(_ data : Data )
    func removeClienttoo(_ client: SClientManager)
}

class SClientManager: NSObject {
    var tcpCilent : TCPClient?
    weak var delegate : SClientManagerDelegate?
    fileprivate var isClientCounected : Bool = false
    fileprivate var heartTimeCount: Int = 0
    
    init(tcpClient : TCPClient){
        self.tcpCilent = tcpClient
    }

}

extension SClientManager{
    func startReadMsg(){
        
        isClientCounected = true
        let timer = Timer(fireAt: Date(), interval: 1, target: self, selector:#selector(checkHeartBeat), userInfo: nil, repeats: true)
    
        RunLoop.current.add(timer, forMode: .commonModes)
        
        timer.fire()
        
        
        while isClientCounected {
            
            if let LMsg = tcpCilent?.read(4) {
                
                let headdata = Data(bytes: LMsg, count: 4)
                var length :Int = 0
                (headdata as NSData).getBytes(&length, length: 4)
                
                
                guard let  typeMgs = tcpCilent?.read(2) else {
                    return
                }
                
                let typeMsgData = Data(bytes: typeMgs, count: 2)
                var type :Int = 0
                (typeMsgData as NSData).getBytes(&type, length: 2)
                
                guard let msg = tcpCilent?.read(length) else {
                    return
                }
                
                let data = Data(bytes: msg, count: length)
                
                if  type == 1 {
                    self.tcpCilent?.close()
                    self.delegate?.removeClienttoo(self)
                }else  if type == 100{
                    
                    heartTimeCount = 0
                    continue
                }
                
                let  totalData = headdata+typeMsgData+data
                
                delegate?.sendMsgToClient(totalData)
                
            }else{
            
//                self.removeClient()
            }
            
            }
        }
    
}


extension SClientManager{

     @objc fileprivate func checkHeartBeat(){
        heartTimeCount += 1
        if heartTimeCount >= 10{
            self.removeClient()
        }
    }
    
    
    private func removeClient() {
        delegate?.removeClienttoo(self)
        isClientCounected = false
        print("客户端断开了连接")
        tcpCilent?.close()
    }

}
