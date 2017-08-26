//
//  GetFunctions.swift
//  SABER
//
//  Created by Paulo  on 8/24/17.
//  Copyright © 2017 Paulo . All rights reserved.
//

import Foundation
import UIKit

//Classe que registra todos os métodos get necessários para a aplicacao
class GetFunctions{
    
    //Variables
    
    var jsonString = "0"
    
    
    //
    
    func jsonToString(json: AnyObject, saida: String){
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            jsonString = String(data: data1, encoding: String.Encoding.utf8)! // the data will be converted to the string
            
            print(jsonString) // <-- here is ur string
            
        } catch let myJSONError {
            print(myJSONError)
        }
        
    }
    
    // MARK: - Métodos GET
    //Mostra o token do user e quantas chamadas ao servico lhe restam
    func statusUser (saida: String){
        
        //URL que mostra o status do user
        guard let url = URL(string: "https://mobile.sabertecnologias.com.br/api_seletiva/users/status/prbs212") else {return}
        
        //Session simples para retorno do status
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response{
                print (response)
            }
            
            if let data = data{
                print (data)
                
                //Convertendo os dados para formato Json
                let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print(json)
                
            }
            
            }.resume()
        
        return
        //return usesLeft
    }
    
    
    //Mostra todas as postagens do Forum
    internal func showForum (token: String){
        
        guard let url = URL(string: "https://mobile.sabertecnologias.com.br/api_seletiva/forum/") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let accessToken = token
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
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
}
    

