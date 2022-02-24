//
//  RegisterViewController.swift
//  stateAnddata
//
//  Created by Macbook on 2/23/22.
//

import UIKit
import RxSwift
import RxCocoa

import MaterialComponents.MaterialTextControls_FilledTextFields
class RegisterViewController: UIViewController{
    @IBOutlet weak var firstNameTextField: MDCFilledTextField!
    @IBOutlet weak var lastNameTextField: MDCFilledTextField!
    @IBOutlet weak var emailAddressTextField: MDCFilledTextField!
    @IBOutlet weak var dateOfBirthTextField: MDCFilledTextField!
    @IBOutlet weak var nationalityTextField: MDCFilledTextField!
    @IBOutlet weak var countryOfResidenceTextField: MDCFilledTextField!
    @IBOutlet weak var mobileNoTextField: MDCFilledTextField!
    @IBOutlet weak var createNewAccountBtn: UIButton!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var femaleView: UIView!
    @IBOutlet weak var maleView: UIView!
    
    @IBOutlet weak var femaleLbl: UILabel!
    
    let disposeBag = DisposeBag()
    let viewModel = RegisterViewModel()
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        setUpBindingData()
    }
    
    func prepareUI(){
        firstNameTextField.label.text = "First Name *"
        lastNameTextField.label.text = "Last Name *"
        emailAddressTextField.label.text = "Email Address *"
        dateOfBirthTextField.label.text = "Date of Birth *"
        nationalityTextField.label.text = "Nationality *"
        countryOfResidenceTextField.label.text = "Country of Residence *"
        mobileNoTextField.label.text = "Mobile no.(Optional)"
        firstNameTextField.placeholder = "Regina"
        lastNameTextField.placeholder = "Chan"
        emailAddressTextField.placeholder = "regina@codigo.co"
        dateOfBirthTextField.placeholder = "DD/MM/YYYY"
        nationalityTextField.placeholder = "Singaporean"
        countryOfResidenceTextField.placeholder = "Singapore"
        mobileNoTextField.placeholder = "+65  | 8139 9124"
        
        dateOfBirthTextField.setRightImage(imageName: "dob")
        createNewAccountBtn.setTitleColor(.gray, for: .disabled)
        showDatePicker()
        
        femaleView.layer.borderWidth = 1
        femaleView.layer.cornerRadius = 23
        femaleView.layer.borderColor = UIColor.black.cgColor
        genderView.layer.cornerRadius = 25
        
        firstNameTextField.backgroundColor = UIColor.clear

    }
   
    func showDatePicker(){
        datePicker.datePickerMode = .date
       let toolbar = UIToolbar()
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
      toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        dateOfBirthTextField.inputAccessoryView = toolbar
        dateOfBirthTextField.inputView = datePicker

     }
    
    @objc func donedatePicker(){
       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
     }

     @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
    
    func setUpBindingData(){
        firstNameTextField.rx.text.bind(to: viewModel.firstNameSubject).disposed(by: disposeBag)
        lastNameTextField.rx.text.bind(to: viewModel.lastNameSubject).disposed(by: disposeBag)
        emailAddressTextField.rx.text.bind(to: viewModel.emailAddressSubject).disposed(by: disposeBag)
        dateOfBirthTextField.rx.text.bind(to: viewModel.dateOfBirthSubject).disposed(by: disposeBag)
        nationalityTextField.rx.text.bind(to: viewModel.nationalitySubject).disposed(by: disposeBag)
        countryOfResidenceTextField.rx.text.bind(to: viewModel.countryofResidenceSubject).disposed(by: disposeBag)
        viewModel.isValidateForm.bind(to: createNewAccountBtn.rx.isEnabled).disposed(by: disposeBag)
    }

}

