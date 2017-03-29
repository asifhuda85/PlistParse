//
//  ViewController.swift
//  parsePlist
//
//  Created by Md Asif Huda on 3/17/17.
//  Copyright © 2017 Md Asif Huda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var allItems = [Model]()
    var imageUrl: String?
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let fileUrl = Bundle.main.url(forResource: "PhotosDictionary", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? Dictionary<String, String> { // [String: Any] which ever it is

                for (key,value) in (result?.sorted(by: {$0 < $1}))! {
                    let dictionary = ["name": key, "image": value]
                let mockModel = Model(json: dictionary as [String : AnyObject])
                allItems.append(mockModel)

                }

            }
            
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        let model = allItems[indexPath.row]
        cell.textLabel?.text = model.name
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = allItems[indexPath.row]

        self.performSegue(withIdentifier: "segue", sender: model)
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let destination = segue.destination as? ImageViewController {
                let model = sender as! Model
                destination.imageURL = model.image
            }
        }
    }

}

