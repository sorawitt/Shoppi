//
//  SPNetworkRouter.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public typealias SPNetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

public protocol SPNetworkRouter: AnyObject {
    associatedtype Endpoint: SPEndPointType
    func request(_ route: Endpoint, completion: @escaping SPNetworkRouterCompletion)
    func cancel()
}
