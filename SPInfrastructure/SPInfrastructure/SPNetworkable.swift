//
//  SPNetworkable.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public protocol SPNetworkable {
    associatedtype Route: SPEndPointType
    associatedtype API: SPRouter<Route>
    var provider: API { get }
    func excute(route: Route, completion: @escaping SPNetworkRouterCompletion)
}

/* How to use */

//enum SPProductRoute: SPEndPointType {
//    case getDetail(sku: String)
//
//    var baseURL: URL {
//        URL(string: "")!
//    }
//
//    var path: String {
//        ""
//    }
//
//    var httpMethod: SPHTTPMethod {
//        .get
//    }
//
//    var task: SPHTTPTask {
//        .request
//    }
//
//    var headers: SPHTTPHeaders? {
//        nil
//    }
//}

//struct ProductNetworkManager: SPNetworkable {
//    var provider: SPRouter<Route>
//
//    func excute(route: Route, completion: @escaping SPNetworkRouterCompletion) {
//        provider.request(route, completion: completion)
//    }
//
//    typealias Route = SPProductRoute
//    typealias API = SPRouter<Route>
//}
