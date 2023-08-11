//
//  LoginVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 19/07/23.
//

import UIKit

class LoginVc: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak private var tfEmail: UITextField!
    @IBOutlet weak private var tfPassword: UITextField!
    
    // MARK: VARIABLES
    var coordinator: LoginCoordinator?
    var viewModel = LoginViewModel()
    
    // MARK: VIEWCONTROLLER LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        bindVm()
        KeyboardDismissHelper.shared(view: view)
    }
    
    // MARK: TOKENIZATION
    private func bindVm() {
        viewModel.isTokenArrived.bind { [weak self] isArrived in
            guard let self else {
                return
            }
            
            if isArrived {
                UserManager.shared.isUserLogin = true
                self.coordinator?.goToHomeVc()
            } else {
                print("\(Constants.ApiInfo.apiInvalidError)")
            }
            
        }
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        if let email = tfEmail.text, let password = tfPassword.text {
            viewModel.login(email: email, password: password)
        }
        
    }
    
}
