//
//  Submit.swift
//  DGNetworkService
//
//  Created by Gmo Ginppian on 1/8/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import Foundation

class DGSubmit: NSObject {
    
    private var session: URLSession?
    private var dataTask: URLSessionDataTask?
    
    override init() {
        super.init()
        session = URLSession(configuration: .default)
        // SSL
        //session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }
    
    internal func submit(request: URLRequest,
                completion: @escaping (_ error: String, _ json: NSDictionary?) -> Void)
        -> Void {
        
        dataTask = session?.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard error == nil else {
                completion("🔴🔴🔴 ERROR :: \(error?.localizedDescription ?? String.Empty)", nil)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                //print("httpResponse: \(httpResponse)")
                switch httpResponse.statusCode {
                case 200...299:
                    print("\n🔵🔵🔵 SUCCESS :: Status: \(httpResponse.statusCode)\n")
                    break
                case 400...499:
                    print("httpResponse: \(httpResponse)")
                    print("httpCode: \(httpResponse.statusCode)")
                    completion("\n🔴🔴🔴 ERROR :: Error de comunicaciones, favor de reintentar mas tarde\n...Status Code: \(httpResponse.statusCode)\n", nil)
                    return
                case 500...599:
                    print("httpResponse: \(httpResponse)")
                    completion("\n🔴🔴🔴 ERROR :: Servicio no disponible, favor de reintentar mas tarde\n...Status Code: \(httpResponse.statusCode)\n", nil)
                    return
                default:
                    print("httpResponse: \(httpResponse)")
                    completion("\n🔴🔴🔴 ERROR :: Cuidado, entró en default statusCode: \(httpResponse.statusCode)\n", nil)
                    return
                }
            }
            else { // Response nil
                completion("\n🔴🔴🔴 ERROR :: No llego nada del response: \(String(describing: response))\n", nil)
                return
            }
            if let data = data {
                do {
                    // Puede ser un arreglo
                    if let rawArr = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray {
                        let dic: NSDictionary = ["genericList": rawArr]
                        completion(String.Empty, dic)
                    }
                    else if let rawDic = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                        completion(String.Empty, rawDic)
                    }
                    else {
                        completion("\n🔴🔴🔴 ERROR :: Error al castear el json\n", nil)
                    }
                    
                } catch let error {
                    completion("\n🔴🔴🔴 ERROR :: Cargar Json - \(error.localizedDescription)\n", nil)
                }
            } else {
                completion("\n🔴🔴🔴 ERROR :: Data es Nulo\n", nil)
            }
        })
        dataTask?.resume()
    }
}

// SSL Pinning
extension DGSubmit: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            if let serverTrust = challenge.protectionSpace.serverTrust {
                var secresult = SecTrustResultType.invalid
                let status = SecTrustEvaluate(serverTrust, &secresult)
                
                if(errSecSuccess == status) {
                    if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
                        let serverCertificateData = SecCertificateCopyData(serverCertificate)
                        let data = CFDataGetBytePtr(serverCertificateData);
                        let size = CFDataGetLength(serverCertificateData);
                        let cert1 = NSData(bytes: data, length: size)
                        let file_der = Bundle.main.path(forResource: "name-of-cert-file", ofType: "cer")
                        
                        if let file = file_der {
                            if let cert2 = NSData(contentsOfFile: file) {
                                if cert1.isEqual(to: cert2 as Data) {
                                    completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust:serverTrust))
                                    return
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // Pinning failed
        completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
    }
}


//font: https://stackoverflow.com/questions/34223291/ios-certificate-pinning-with-swift-and-nsurlsession
/*
 func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
 
 // Adapted from OWASP https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning#iOS
 
 if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
 if let serverTrust = challenge.protectionSpace.serverTrust {
 var secresult = SecTrustResultType.invalid
 let status = SecTrustEvaluate(serverTrust, &secresult)
 
 if(errSecSuccess == status) {
 if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
 let serverCertificateData = SecCertificateCopyData(serverCertificate)
 let data = CFDataGetBytePtr(serverCertificateData);
 let size = CFDataGetLength(serverCertificateData);
 let cert1 = NSData(bytes: data, length: size)
 let file_der = Bundle.main.path(forResource: "name-of-cert-file", ofType: "cer")
 
 if let file = file_der {
 if let cert2 = NSData(contentsOfFile: file) {
 if cert1.isEqual(to: cert2 as Data) {
 completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust:serverTrust))
 return
 }
 }
 }
 }
 }
 }
 }
 
 // Pinning failed
 completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
 }

 */
