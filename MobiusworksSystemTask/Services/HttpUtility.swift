//
//  HttpUtility.swift
//  MobiusworksSystemTask
//
//  Created by Nikhil Balne on 21/12/20.
//

import Foundation

// MARK: - HttpUtality class for Server Calls
class HttpUtility {
    
    static let shared : HttpUtility = HttpUtility()
    
    private init(){}
    
    func makeApiGetCall<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?,Error?,HTTPURLResponse?)-> Void){
        
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            
            let httpUrlStatusCode = httpUrlResponse as? HTTPURLResponse
            
            if(error == nil && responseData != nil && responseData?.count != 0){
            
                do {
                    let result = try JSONDecoder().decode(T.self, from: responseData!)
                    _ = completionHandler(result,nil,httpUrlStatusCode)
                
                }catch let error{
//                    debugPrint("error occured while decoding = \(error)")
                    _ = completionHandler(nil,error,httpUrlStatusCode)
                }
            }

        }.resume()
    }

}
