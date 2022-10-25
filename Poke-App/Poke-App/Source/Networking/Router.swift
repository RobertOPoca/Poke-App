//
//  Router.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 22/10/22.
//

import Combine
import Foundation
import Moya

protocol RouterType {
    func request<T: Decodable>(target: TargetType) -> AnyPublisher<T, Error>
}

struct Router: RouterType {
    private let provider: MoyaProvider<MultiTarget> = MoyaProvider()
    
    func request<T: Decodable>(target: TargetType) -> AnyPublisher<T, Error> {
        Future { future in
            provider.request(MultiTarget(target)) { result in
                switch result {
                case let .success(response):
                    do {
                        future(.success(try JSONDecoder().decode(T.self, from: response.data)))
                    } catch let error {
                        future(.failure(error))
                    }
                case let .failure(error):
                    future(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
