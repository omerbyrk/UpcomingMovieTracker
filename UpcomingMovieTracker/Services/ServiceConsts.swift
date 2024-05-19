//
//  Consts.swift
//  UpcomingVideoTracker
//
//  Created by Ömer Bayrak on 11.05.2024.
//

enum APIServiceErrors: Error {
    case invalidEndPoint
    case invalidResponse
    case invalidData
}

 let accessTokenAuth: String = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YzE2NWE1ZTMyMTIwZGJjZDM3YTM3M2QyY2Y0YWU0YSIsInN1YiI6IjY2M2RiZDE1YzA5OThkZGZlYjUxMDhiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TK8khzZSM12U1sg3A5ftxKaCDMy72lRgnpI4J1RUCz4"

 let baseEndPoint: String = "https://api.themoviedb.org/3/"
