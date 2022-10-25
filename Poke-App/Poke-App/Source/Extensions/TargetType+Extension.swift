//
//  TargetType+Extension.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 22/10/22.
//

import Moya
import Foundation

extension TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.apiUrl) else { fatalError() }
        
        return url
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return nil
    }
}
