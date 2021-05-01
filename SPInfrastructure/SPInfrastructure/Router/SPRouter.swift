//
//  SPRouter.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public class SPRouter<Endpoint: SPEndPointType>: SPNetworkRouter {
    private var task: URLSessionTask?
    
    public func request(_ route: Endpoint, completion: @escaping SPNetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    public func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route: Endpoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestWithParameters(let params):
                try self.configureParameters(params: params, request: &request)
            case .requestWithBody(let body):
                try self.configureParameters(body: body, request: &request)
            case .requestWithAdditionHeader(let headers):
                self.addAdditionalHeader(headers, request: &request)
                try self.configureParameters(request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(body: SPParameters? = nil,
                                         params: SPParameters? = nil,
                                         request: inout URLRequest) throws {
        do {
            if let bodyParameters = body {
                try SPJSONParameterEncoder.encode(request: &request, with: bodyParameters)
            }
            
            if let urlParameters = params {
                try SPJSONParameterEncoder.encode(request: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeader(_ additionalHeaders: SPHTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
