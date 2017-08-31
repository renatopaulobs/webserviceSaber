//
//  ForumViewController.swift
//  SABER
//
//  Created by Paulo  on 8/25/17.
//  Copyright © 2017 Paulo . All rights reserved.
//

import UIKit

class ForumViewController: UITableViewController{

    // MARK: - Variables
   
    var titles = ["Inicio", "Meio", "Fim"]
    var author = ["Joao","Mario", "Pedro"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "Cell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        
        cell.title.text = titles[indexPath.row]
        cell.author.text = author[indexPath.row]
        
        
        return cell
    }
    // MARK: - TableView

   
}
