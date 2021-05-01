//
//  SPHTTPTask.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public typealias SPParameters = [String: Any]
public typealias SPHTTPHeaders = [String: String]

public enum SPHTTPTask {
    case request
    case requestWithParameters(params: SPParameters)
    case requestWithBody(body: SPParameters)
    case requestWithAdditionHeader(header: SPHTTPHeaders)
}
