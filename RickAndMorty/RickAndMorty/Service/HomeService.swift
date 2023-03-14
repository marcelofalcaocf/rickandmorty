//
//  HomeService.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 13/03/23.
//

import Foundation

//https://rickandmortyapi.com/api/character

protocol HomeServiceType {
    func accessAllCharacters(completion: @escaping (Result<HomeModel, Error>) -> Void)
}

struct HomeService: HomeServiceType {
    func accessAllCharacters(completion: @escaping (Result<HomeModel, Error>) -> Void) {
        guard let url = URL(string: "\(GlobalAccess.url)/character") else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems = [
            URLQueryItem(name: "page", value: "1")]
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard let data else {
                print("No error but no data")
                return
            }
            
            do {
                let model = try JSONDecoder().decode(HomeModel.self, from: data)
                completion(.success(model))
            } catch {
                print(error)
            }
        }
        session.resume()
    }
}
