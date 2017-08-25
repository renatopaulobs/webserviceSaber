//
//  LoginViewController.swift
//  SABER
//
//  Created by Paulo  on 8/24/17.
//  Copyright © 2017 Paulo . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Loggin Button

    @IBAction func logginButton(_ sender: Any) {
        
        //GET PURO, APENAS CONSULTA
        
        guard let url = URL(string: "https://mobile.sabertecnologias.com.br/api_seletiva/users/status/prbs212") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
           
            if let response = response{
                print (response)
            }
           
            if let data = data{
                print (data)
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print (json)
                    
                } catch {
                    print (error)
                }
            }
            
        }.resume()
    }
    
        //   POST
    
//        let parameters = ["chave": "prbs212"]
//        guard let url = URL(string: "https://mobile.sabertecnologias.com.br/api_seletiva/users/") else {return}
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {return}
//        
//        request.httpBody = httpBody
//        
//        let session = URLSession.shared
//        session.dataTask(with: request) { (data, response, error) in
//            
//            if let response = response{
//                print (response)
//            }
//            
//            if let data = data{
//                print (data)
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print (json)
//                    
//                } catch {
//                    //print (error)
//                }
//            }
//            
//        }.resume()
//    }
//    
    
    //GET com autorizacao do user
    
//    guard let url = URL(string: "https://mobile.sabertecnologias.com.br/api_seletiva/forum/") else {return}
//    
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    let accessToken = "e397a78bef6c22a1610eb90cd6aaca6388f27609"
//    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
//  
//    let session = URLSession.shared
//    session.dataTask(with: request) { (data, response, error) in
//    
//            if let response = response{
//                    print (response)
//                    }
//    
//            if let data = data{
//                    print (data)
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print (json)
//    
//                } catch {
//                //print (error)
//            }
//        }
//    
//    }.resume()
//}



}
