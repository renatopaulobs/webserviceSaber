//
//  LoginViewController.swift
//  SABER
//
//  Created by Paulo  on 8/24/17.
//  Copyright © 2017 Paulo . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    // MARK: - Variables
    internal var postDoFunction: PostFunctions = PostFunctions()
    internal var getDoFunction: GetFunctions = GetFunctions()
    
    internal let keyWebservice = ["chave": "prbs212"]
    internal var token = "e397a78bef6c22a1610eb90cd6aaca6388f27609"
    internal var uses = "20"

    
    @IBOutlet weak var textView: UITextField!
    
    // MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ActionButtons
    @IBAction func logginButton(_ sender: Any) {
        
        postDoFunction.generateUser(parameters: keyWebservice as NSDictionary)
        
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
                
                    //Extraindo os dados do Json
                    let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    let name = json as! String
                    print (name)
                
                    //Token
                    self.token = name.substring(with: name.index(name.startIndex, offsetBy: 13) ..< name.index(name.endIndex, offsetBy: -16))
                
                    //Uses
                    self.uses = name.substring(with: name.index(name.startIndex, offsetBy: 66) ..< name.index(name.endIndex, offsetBy: -1))
                
                    print (self.token)
                    print (self.uses)
            }
        }.resume()

        

    }

}
