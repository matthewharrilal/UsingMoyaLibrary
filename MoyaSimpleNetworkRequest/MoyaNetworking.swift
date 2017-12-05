//
//  MoyaNetworking.swift
//  MoyaSimpleNetworkRequest
//
//  Created by Matthew Harrilal on 12/4/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import Moya
import Alamofire



enum MyPokemon {
    // Creating an enum for the possible events that can occur
    case showPokemon
}

extension MyPokemon: TargetType {
    var baseURL: URL {
        let baseUrlString = URL(string: "http://pokeapi.co/api/v2/")
        return baseUrlString!
    }
    
    var path: String {
        switch self {
        case .showPokemon:
            return "pokemon/23/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showPokemon:
            return .get
        }
    }
    
    var sampleData: Data {
        // Data that we can use to test our network request usually we can iterpolate something to see the value
        switch self {
            case .showPokemon:
               return Data()
        }
    }
    
    var task: Task {
        // Describing the type of http request that is going to occur such as are there parameters
        switch self {
        case .showPokemon:
            // What request plain does is that it performs a task with no additional data
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        // The headers we are going to be using for the request
        return nil
    }
    
    // Using to specify what is happening in the network request comes with different methods
}

func requestPokemon(target: MyPokemon, success successCallBack: @escaping (Response) -> Void, error errorCallBack: @escaping (Swift.Error) -> Void, failure failureCallBack: @escaping (MoyaError) -> Void) {
    // This function essentially handles our request for us witg the added parameters to handle if there are errors or failures
    let provider = MoyaProvider<MyPokemon>()
    provider.request(target) { (result) in
        switch result {
        case .success(let response):
            if response.statusCode >= 200 && response.statusCode <= 300{
                // This handles the all the possible succesful requests such as a get request as well as a post request and many others
                successCallBack(response)
            }
        case .failure(let error):
            // This case is executed in the case that there is an error and if there is we are going to call the error call back
                errorCallBack(error)
        }
    }
}
