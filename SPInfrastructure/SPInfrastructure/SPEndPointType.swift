//
//  EndPointType.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public protocol SPEndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: SPHTTPMethod { get }
    var task: SPHTTPTask { get }
    var headers: SPHTTPHeaders? { get }
}
