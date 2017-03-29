//
//  ViewController.swift
//  parsePlist
//
//  Created by Md Asif Huda on 3/17/17.
//  Copyright © 2017 Md Asif Huda. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    var model = [Model]()
    var allItems = [Dictionary<String, String>]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let fileUrl = Bundle.main.url(forResource: "PhotosDictionary", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: String] { // [String: Any] which ever it is

                for (key,value) in (result)! {
                  //let dict = ["name": key, "image": result?[key] as! String]
                    //allItems.append(dict)
                }
                allItems.append(result!)
            }
            
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        
        let model = allItems[0] as NSDictionary
        
        
        let val = model.allKeys[indexPath.row]
        cell.textLabel?.text = val as? String
        
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = allItems[0] as NSDictionary
        
        
        let val = model.allValues[indexPath.row]
        print(val)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = allItems[0] as! NSDictionary
        
        return model.allKeys.count
    }

}

