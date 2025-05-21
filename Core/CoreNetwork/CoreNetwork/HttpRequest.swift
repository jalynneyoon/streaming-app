//
//  HttpRequest.swift
//  CoreNetwork
//
//  Created by JohyeonYoon on 4/22/25.
//
import Foundation

public struct HttpRequest<Response: Decodable>: ResponseRequestable {
    public var baseURL: String
    public var headerParameters: [String: String]?
    public var method: HTTPMethodType
    public var queryParameters: Parameters
    
    public init(baseURL: String, headerParameters: [String: String]? = nil, method: HTTPMethodType, queryParameters: Parameters) {
        self.baseURL = baseURL
        self.headerParameters = headerParameters
        self.method = method
        self.queryParameters = queryParameters
    }
}

public enum APIError: Error, Equatable {
    case invalidURLRequest
    case notConnectedToNetwork
    case httpError(Int)
    case unknown
}

public enum HTTPMethodType: String {
    case `get` = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public protocol ResponseRequestable: Requestable {
    associatedtype Response: Decodable
}

public protocol Requestable {
    typealias Parameters = [String: Any]

    var baseURL: String { get }
    var method: HTTPMethodType { get }
    var queryParameters: Parameters { get set }
    var headerParameters: [String: String]? { get }

    func urlRequest() throws -> URLRequest
}

extension Requestable {
    private func url() throws -> URL {
        guard let url = URL(string: self.baseURL) else { throw APIError.invalidURLRequest }
        guard self.method == .get else { return url }
        
        var components = URLComponents()
        components.scheme = url.scheme
        components.host = url.host
        components.path = url.path
        
        let queryItemArray = self.queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")}
        
        if !queryItemArray.isEmpty {
            components.queryItems = queryItemArray
        }
        
        guard let urlWithQueries = components.url else { throw APIError.invalidURLRequest }
        return urlWithQueries
    }
    
    public func urlRequest() throws -> URLRequest {
        let url = try self.url()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields = self.headerParameters

        return urlRequest
    }
}
