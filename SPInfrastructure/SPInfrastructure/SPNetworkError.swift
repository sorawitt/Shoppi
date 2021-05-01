//
//  SPNetworkError.swift
//  SPInfrastructure
//
//  Created by Sorawit Trutsat on 1/5/2564 BE.
//

import Foundation

public enum SPNetworkError: String, Error {
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
