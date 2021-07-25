//
//  APIServices.swift
//  mvvmDemo
//
//  Created by mac on 18/07/21.
//

import Foundation


class APIServices: NSObject {
    let endpoint: String = "https://api.covid19api.com/countries"
    func apiToGetCountriesData(completion: @escaping ( Countries) -> ()){
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?
        // 3
        guard let url = URL(string: endpoint) else {
            return
        }
        // 4
        dataTask =
            defaultSession.dataTask(with: url) { [weak self] data, response, error in
                // 5
                if let error = error {
                    print(error.localizedDescription)
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    do{
                        let jsonDecodedData = try JSONDecoder().decode(Countries.self, from: data)
                        DispatchQueue.main.async {
                            completion(jsonDecodedData)
                        }
                    } catch {
                        print("error while parsing")
                    }
                    // 6
                }
            }
        // 7
        dataTask?.resume()
    }
}
