//
//  APIService.swift
//  UpcomingVideoTracker
//
//  Created by Ömer Bayrak on 11.05.2024.
//

import Foundation



class APIService<P: APIServiceParameters<M>, M: Codable>  {
    
    let parameters: P
    let decoder = JSONDecoder()
    
    init(parameters: APIServiceParameters<M>) {
        self.parameters = parameters as! P
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    private func generateRequest(to endPoint: String, for method: String = "GET") throws -> URLRequest {
        guard let url = URL(string: endPoint) else {
            throw APIServiceErrors.invalidEndPoint
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue(accessTokenAuth, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    func getList(queryItems: [URLQueryItem]  = []) async throws -> [M] {
        
        let endPoint = baseEndPoint + parameters.endPoint
        
        
        var url = try! generateRequest(to: endPoint)
        
        url.url?.append(queryItems: queryItems)
        
        print(url.url)

        let (data, response) = try await URLSession.shared.data(for: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIServiceErrors.invalidResponse
        }
        
        do {
            let decodedResonse = try decoder.decode(TMDBListResponse<M>.self, from: data)
            
            return decodedResonse.results
        } catch {
            print(error)
            throw APIServiceErrors.invalidData
        }
    }
    
    
    
}
