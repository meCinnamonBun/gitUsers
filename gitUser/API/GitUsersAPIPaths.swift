//
//  GitUsersAPIPaths.swift
//  gitUser
//
//  Created by Andrey on 18.05.2021.
//

import Moya
import Alamofire

private extension String {
    static let baseURLString = "https://api.github.com"
}

enum GitUsersAPIPaths {
    case gitUsers
}

extension GitUsersAPIPaths: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        guard let baseURL = URL(string: .baseURLString) else {
            fatalError("Incorrect baseURL")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .gitUsers:
            return "/repos/videolan/vlc/contributors"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .gitUsers:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var authorizationType: AuthorizationType? {
        .none
    }
}
