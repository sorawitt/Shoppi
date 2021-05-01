//
//  SPJSONParameterEncoder.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public struct SPJSONParameterEncoder: SPParameterEncoder {
    public static func encode(request: inout URLRequest, with parameters: SPParameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = jsonAsData
            
            if request.value(forHTTPHeaderField: "Content-Type") == nil {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw SPNetworkError.encodingFailed
        }
    }
}
