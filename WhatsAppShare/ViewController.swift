//
//  ViewController.swift
//  WhatsAppShare
//
//  Created by sbyka on 10/08/18.
//  Copyright © 2018 sbyka. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var documentInteractionController: UIDocumentInteractionController = UIDocumentInteractionController()


    @IBAction func textShare(_ sender: Any) {
        
        let originalString = "Test sharing text"
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
        
        let url  = URL(string: "whatsapp://send?text=\(escapedString!)")
        
        //Text which will be shared on WhatsApp is: "First Whatsapp Share"
        
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func linkShare(_ sender: Any) {
        let originalString = "https://www.google.co.in"
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
        let url  = URL(string: "whatsapp://send?text=\(escapedString!)")
        
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBOutlet weak var imageButton: UIButton!
    @IBAction func imageShare(_ sender: Any) {
        let urlWhats = "whatsapp://app"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                
                
                
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    
                    if let image = UIImage(named: "whatsappIcon") {
                        if let imageData = UIImageJPEGRepresentation(image, 1.0) {
                            let tempFile = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/whatsappIcon.png")
                            do {
                                try imageData.write(to: tempFile, options: .atomic)
                                self.documentInteractionController = UIDocumentInteractionController(url: tempFile)
                                self.documentInteractionController.uti = "net.whatsapp.image"
                                self.documentInteractionController.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
                                
                            } catch {
                                print(error)
                                print("Image not available")
                            }
                        }
                    }
                    
                } else {
                    // Cannot open whatsapp
                    print("Cannot open whatsapp")
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

