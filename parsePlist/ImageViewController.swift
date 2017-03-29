//
//  ImageViewController.swift
//  parsePlist
//
//  Created by Md Asif Huda on 3/29/17.
//  Copyright © 2017 Md Asif Huda. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myImageView: UIImageView!
    var imageURL:String?
    
    func returnName () -> (name: String , age: Int) {
        
        
        
        return (name: "Asif", age: 0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myScrollView.maximumZoomScale = 5.0
        self.myScrollView.minimumZoomScale = 1.0
        self.automaticallyAdjustsScrollViewInsets = false;
        self.myScrollView.contentInset = UIEdgeInsets.zero
        
        self.myScrollView.scrollIndicatorInsets = UIEdgeInsets.zero;

        downloadImage(imgUrl: imageURL!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadImage(imgUrl: String) {
        let catPictureURL = URL(string: imgUrl)!
        
        let session = URLSession(configuration: .default)
        
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.myImageView.image = image
                        }
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        downloadPicTask.resume()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.myImageView

    }
}
