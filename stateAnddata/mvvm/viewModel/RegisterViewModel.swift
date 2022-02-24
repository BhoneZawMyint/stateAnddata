//
//  RegisterViewModel.swift
//  stateAnddata
//
//  Created by Macbook on 2/23/22.
//

import Foundation

import RxSwift
import RxCocoa

class RegisterViewModel{
    
    let firstNameSubject = BehaviorRelay<String?>(value: "")
    let lastNameSubject = BehaviorRelay<String?>(value: "")
    let emailAddressSubject = BehaviorRelay<String?>(value: "")
    let dateOfBirthSubject = BehaviorRelay<String?>(value: "")
    let nationalitySubject = BehaviorRelay<String?>(value: "")
    let countryofResidenceSubject = BehaviorRelay<String?>(value: "")
    let disposeBag = DisposeBag()
    
    var isValidateForm: Observable<Bool>{
        return Observable.combineLatest(firstNameSubject,lastNameSubject,emailAddressSubject,dateOfBirthSubject,nationalitySubject,countryofResidenceSubject){ firstName,lastName,emailAddress,dateOfBirth,nationality,countryofResidence in
            guard firstName != nil && lastName != nil && emailAddress != nil && dateOfBirth != nil && nationality != nil && countryofResidence != nil else {
                return false
            }
            
            return !(firstName!.isEmpty) && !(lastName!.isEmpty) && !(emailAddress!.isEmpty) && !(dateOfBirth!.isEmpty) && !(nationality!.isEmpty) && !(countryofResidence!.isEmpty) && emailAddress!.validateEmail()
        }
    }
    
}


