
//
//  SServerManager.swift
//  Sserver
//
//  Created by 吴德志 on 2017/6/1.
//  Copyright © 2017年 Sico2Sico. All rights reserved.
//

import Cocoa


class SServerManager: NSObject {
    
    fileprivate lazy var  serverSocket : TCPServer = TCPServer(addr: "0.0.0.0", port: 7878)
    fileprivate var  isServerRuning: Bool = false
    fileprivate lazy var  clientMrgs :[SClientManager] = [SClientManager]()

}


extension SServerManager {

    func startRuning(){
    
        serverSocket.listen()
        isServerRuning = true
        
        DispatchQueue.global().async {
            while self.isServerRuning {
                if  let  client = self.serverSocket.accept(){
                    
                    DispatchQueue.global().async {
                        self.handlerClient(client)
                    }
                }
            }
            
        }
    }
    
    func stopRuning(){
     isServerRuning = false
    }

}

extension SServerManager {

    fileprivate func handlerClient(_ client :TCPClient){
        let mgr = SClientManager(tcpClient: client)
        mgr.delegate = self
        clientMrgs.append(mgr)
        mgr.startReadMsg()
    }

}

extension SServerManager : SClientManagerDelegate{
    
    func sendMsgToClient(_ data: Data) {
        for mgr in clientMrgs {
            mgr.tcpCilent?.send(data: data)
        }
    }
    
    func removeClienttoo(_ client: SClientManager) {
        guard let  index = clientMrgs.index(of: client) else {
            return
        }
        clientMrgs.remove(at: index)
    }

}
