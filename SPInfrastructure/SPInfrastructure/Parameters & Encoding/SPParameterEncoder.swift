//
//  SPParameterEncoder.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public protocol SPParameterEncoder {
    static func encode(request: inout URLRequest, with parameters: SPParameters) throws
}
