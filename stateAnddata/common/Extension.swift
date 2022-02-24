//
//  Extension.swift
//  stateAnddata
//
//  Created by Macbook on 2/23/22.
//

import Foundation
import UIKit

extension UITextField{
    func setRightImage(imageName:String) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        self.rightView = imageView
        self.rightViewMode = .always
    }
}


extension String {
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
}
