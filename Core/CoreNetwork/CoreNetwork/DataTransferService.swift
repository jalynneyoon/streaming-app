//
//  DataTransferService.swift
//  CoreNetwork
//
//  Created by JohyeonYoon on 4/22/25.
//

import Foundation
internal import Alamofire

public protocol DataTransferService: Sendable {
    @discardableResult
    func request<D: ResponseRequestable> (with httpRequest: D) async -> Result<D.Response, APIError>
}

public struct DefaultDataTransferService: DataTransferService {
    
    public init() {}
    
    public func request<D: ResponseRequestable> (with httpRequest: D) async -> Result<D.Response, APIError> {
        guard let urlRequest: URLRequest = try? httpRequest.urlRequest() else { return .failure(.invalidURLRequest) }
        debugPrint("API 요청: \(urlRequest)")
        AF.request(urlRequest).response { data in
            
        }
        let dataTask = AF.request(urlRequest).serializingDecodable(D.Response.self, decoder: JSONDecoder())
        
        let response = await dataTask.response
        guard let data = response.data, let statusCode = response.response?.statusCode else {
            return self.handleError(for: response)
        }
        
        debugPrint("API응답 [\(String(describing: D.Response.self))] \n")
        data.printJson()
        
        if let apiResponse = await dataTask.response.value {
            let isHTTPRequestSucceed = (statusCode == 200 || statusCode == 201 || statusCode == 204)
            
            if (isHTTPRequestSucceed) {
                return .success(apiResponse)
            }
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

extension Data {
    
    func printJson() {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: [])
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            guard let jsonString = String(data: data, encoding: .utf8) else {
                debugPrint("Inavlid data")
                return
            }
            debugPrint(jsonString)
        } catch {
            debugPrint("Error: \(error.localizedDescription)")
        }
    }
}
