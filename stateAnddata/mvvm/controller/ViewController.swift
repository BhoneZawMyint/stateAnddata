//
//  ViewController.swift
//  stateAnddata
//
//  Created by Macbook on 2/23/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func registerAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        self.navigationController?.pushViewController(registerViewController, animated: true)
      
    }
    
}

extension UITextField{

    func setLeftImage(imageName:String) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        self.leftView = imageView;
        self.leftViewMode = .always
    }
}
