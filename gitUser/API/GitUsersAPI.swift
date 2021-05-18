//
//  GitUsersAPI.swift
//  gitUser
//
//  Created by Andrey on 18.05.2021.
//

import RxSwift
import Moya
import RxCocoa

enum GitUsersAPIError: Error {
    case errorWithMessage(_ message: String)
}

class GitUsersAPI {
    static let shared: GitUsersAPI = .init()
    
    private lazy var provider: MoyaProvider<GitUsersAPIPaths> = {
        .init()
    }()
}

private func mapErrors(_ response: Response) throws -> Response {
    guard 200..<300 ~= response.statusCode else {
        throw GitUsersAPIError.errorWithMessage("Unknown error with code: \(response.statusCode)")
    }
    // decodeErrorMessage(response.data)
    return response
}

private func decodeErrorMessage(_ data: Data) -> String? {
    guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
        return nil
    }
    
    guard let errorMessage = jsonObject["message"] as? String else {
        return nil
    }
    
    return errorMessage
}

extension GitUsersAPI {
    func getUsers() -> Observable<[GitUser]> {
        provider.rx
            .request(.gitUsers)
            .map { try mapErrors($0)}
            .map([GitUser].self)
            .asObservable()
    }
}
