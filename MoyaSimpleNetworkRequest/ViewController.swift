//
//  ViewController.swift
//  MoyaSimpleNetworkRequest
//
//  Created by Matthew Harrilal on 12/4/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import UIKit
import Moya
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        requestPokemon(target: .showPokemon, success: { (response) in
            print("This is the response \(try? response.mapJSON())")
        }, error: { (error) in
            print("This is the error \(error.localizedDescription)")
        }) { (moyaError) in
            print("This is the moya error \(moyaError.errorDescription), \(moyaError.failureReason)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

