//
//  SPURLParameterEncoder.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public struct SPURLParameterEncoder: SPParameterEncoder {
    public static func encode(request: inout URLRequest, with parameters: SPParameters) throws {
        guard let url = request.url else { throw SPNetworkError.missingURL }
        
        if var urlCompoments = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlCompoments.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlCompoments.queryItems?.append(queryItem)
            }
            request.url = urlCompoments.url
        }
        
        if request.value(forHTTPHeaderField: "Content-Type") == nil {
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
    
    
}
