//
//  ProductViewModel.swift
//  MobiusworksSystemTask
//
//  Created by Nikhil Balne on 21/12/20.
//

import Foundation

struct NewsViewModel{
    
    // MARK: - Method to Hit Api api and gets Data
    func getNews(completion: @escaping(_ result: News?,Error?,HTTPURLResponse?)-> Void){
        
        HttpUtility.shared.makeApiGetCall(requestUrl: URL(string: ApiEndPoints.todaysNews)!, resultType: News.self) { (productResult,error,httpUrlResponse) in
            _ = completion(productResult,error,httpUrlResponse)
        }
        
    }
}
