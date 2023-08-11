//
//  ViewController.swift
//  URLSession
//
//  Created by Shubham Bhatt on 27/06/23.
//

import UIKit
import Reachability
import Alamofire

//struct User: Codable {
//    let email: String
//    let password: String
//}

enum AlamofireCallType {
    case getCall
    case getJsonCall
}

class ViewController: UIViewController {
    
    // MARK: VARIABLES
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // apiCallUsingAlamofire(callType: .getJsonCall)
        // register(user: User(email: "eve.holt@reqres.in", password: "pistol"))
        // getDataFromServer()
    }
    
    @IBAction func btnGoToNews(_ sender: UIButton) {
        coordinator?.gotoNews()
    }
    
    @IBAction func btnGoToUpload(_ sender: UIButton) {
        coordinator?.gotoUpload()
    }
    
    
    // RAW different ways for api calls (Web service starting )

    private func getDataFromServer() {
        
        if let url = URL(string: Constants.ApiInfo.userListingUrl) {
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { urlData, urlResponse, error in
                guard let data = urlData else {
                    if let error = error {
                        print("\(Constants.Strings.error): \(error)")
                    }
                    return
                }
                
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("\(Constants.Strings.serializedObj): \(jsonObject)")
                    }
                } catch {
                    print("\(Constants.Strings.serializedError): \(error)")
                }
            }
            dataTask.resume()
        }
    }
    
    private func apiCallUsingAlamofireGet() {
        AF.request(Constants.ApiInfo.afBaseUrl).response { response in
            guard let data = response.data else {
                print(Constants.ApiInfo.apiInvalidError)
                return
            }
            print(data)
            do {
                let newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
                if let articles = newsModel.articles {
                    for article in articles {
                        if let title = article.title, let description = article.description {
                            print("\(Constants.Strings.title): \(title)")
                            print("\(Constants.Strings.description): \(description)\n")
                        }
                    }
                }
            } catch {
                print("\(Constants.ApiInfo.apiInvalidError): \(error)")
            }
        }
        
    }
    
    private func apiCallUsingAlamofireDecode() {
        let request = AF.request(Constants.ApiInfo.afBaseUrl)
        request.responseDecodable(of: NewsModel.self) { (response) in
            switch response.result {
            case .success(let newsModel):
                if let articles = newsModel.articles {
                    for article in articles {
                        if let title = article.title, let description = article.description {
                            print("\(Constants.Strings.title): \(title)")
                            print("\(Constants.Strings.description): \(description)\n")
                        }
                    }
                }
                break
            case .failure(let error):
                print(error.errorDescription)
            }
        }
        
    }
    
    private func apiCallUsingAlamofire(callType: AlamofireCallType) {
        var reachability = try? Reachability()
        if reachability?.connection == .unavailable {
            print(Constants.Strings.connectionError)
            return
        }
        switch callType {
        case .getCall:
            apiCallUsingAlamofireGet()
            break
        case .getJsonCall:
            apiCallUsingAlamofireDecode()
        }
    }
    
    func register(user: User) {
        if let url = URL(string: RequestInfo.login.path) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = Constants.ApiInfo.post
            
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let error {
                print("\(Constants.Strings.codableError): ", error)
            }
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (urlData, urlResponse, error) in
                if let error = error {
                    print("\(Constants.Strings.error): \(error)")
                    return
                }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print(Constants.ApiInfo.apiInvalidError)
                    return
                }
                
                let statusCode = httpResponse.statusCode
                print("\(Constants.Strings.statusCode): \(statusCode)")
                
                if let data = urlData {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers])
                        let prettyObj = try JSONSerialization.data(withJSONObject: jsonObject , options: .prettyPrinted)
                        guard let strObj = String(data: prettyObj, encoding: .utf8) else {
                            return
                        }
                        print("\(Constants.Strings.responseLabel): \(jsonObject)")
                    } catch let error {
                        print("\(Constants.Strings.error): \(error)")
                    }
                }
            }
            
            dataTask.resume()
        }
    }
    
}

