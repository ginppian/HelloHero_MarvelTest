//
//  NetworkReachability.swift
//  AppSomos
//
//  Created by Gmo Ginppian on 1/9/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import Foundation
import Reachability

class DGReachability: NSObject {
    public class func isConnectedToNetwork() -> Bool {
        var conexion = false
        
        if let networkReachability = Reachability() {
            switch networkReachability.connection {
            case .none:
                print("No hay conexión a internet")
                break
            case .wifi, .cellular:
                conexion = true
                print("Conexión a internet encontrada")
                break
            }
        }
        
        return conexion
    }
    public class func isWiFiConneected() -> Bool {
        var conexion = false
        if let network = Reachability() {
            if network.connection == .wifi {
                conexion = true
            }
        }
        return conexion
    }
}
