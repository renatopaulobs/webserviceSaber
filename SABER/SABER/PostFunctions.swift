//
//  PostFunctions.swift
//  SABER
//
//  Created by Paulo  on 8/25/17.
//  Copyright © 2017 Paulo . All rights reserved.
//

import Foundation
import UIKit

//Classe que registra todos os metodos POST para a aplicacao
class PostFunctions{
    
    
    //Variables
    
    internal var jsonString = "0"
    
    //
    
    internal func jsonToString(json: AnyObject){
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            jsonString = String(data: data1, encoding: String.Encoding.utf8)! // the data will be converted to the string
            print(jsonString) // <-- here is ur string
            
        } catch let myJSONError {
            print(myJSONError)
        }
        
    }

    
    internal func generateUser(parameters: NSDictionary) -> Void{
        //URL de servico para users
        guard let url = URL(string: "https://mobile.sabertecnologias.com.br/api_seletiva/users/") else {return}
        
        //Definir a tarefa como POST e setar o envio com JSON
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {return}
        request.httpBody = httpBody
        
        //Iniciar a sessao
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response{
                print (response)
            }
            
            if let data = data{
                print (data)
                do{//Definindo os dados de retorno como um JSON
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print (json)
                } catch {
                    print (error)
                }
            }
            //Metodo que deve ser inserido para gerar o retorno na sessao URL
        }.resume()
    }
    
    
    
    

    
}

