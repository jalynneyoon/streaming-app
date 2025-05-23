//
//  DataTransferService.swift
//  CoreNetwork
//
//  Created by JohyeonYoon on 4/22/25.
//

import Foundation
internal import Alamofire
import Shared

public protocol DataTransferService: Sendable {
    @discardableResult
    func request<D: Decodable> (with httpRequest: any Requestable) async -> Result<D, APIError>
}

public struct DefaultDataTransferService: DataTransferService {
    
    public init() {}
    
    public func request<D: Decodable> (with httpRequest: any Requestable) async -> Result<D, APIError> {
        guard let urlRequest: URLRequest = try? httpRequest.urlRequest() else { return .failure(.invalidURLRequest) }
        log("API 요청: \(urlRequest)")
        
        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let dataTask = AF.request(urlRequest).serializingDecodable(D.self, decoder: decoder)
        
        let response = await dataTask.response
        guard let data = response.data, let statusCode = response.response?.statusCode else {
            return self.handleError(for: response)
        }
        
        log("API응답 [\(String(describing: D.self))]")
        data.logData()
        
        let apiResponse = await dataTask.response.value
        let isHTTPRequestSucceed = (statusCode == 200 || statusCode == 201 || statusCode == 204)
            
        if let apiResponse, (isHTTPRequestSucceed) {
            return .success(apiResponse)
        }
        
        return self.handleError(for: response)
    }
    
    private func handleError<D>(for response: DataResponse<D, AFError>) -> Result<D, APIError> {
        if let afError = response.error, afError.isSessionTaskError {
            return .failure(.notConnectedToNetwork)
        }
        
        if let statusCode = response.response?.statusCode {
            return .failure(.httpError(statusCode))
        }
        
        return .failure(.unknown)
    }
}
