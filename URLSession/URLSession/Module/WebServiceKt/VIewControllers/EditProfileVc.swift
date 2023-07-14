//
//  EditProfileVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import UIKit
import Kingfisher

class EditProfileVc: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak private var tfFirstName: UITextField!
    @IBOutlet weak private var tfLastName: UITextField!
    @IBOutlet weak private var tfEmail: UITextField!
    @IBOutlet weak private var imgUserProfile: UIImageView!
    @IBOutlet weak private var tfJob: UITextField!
    @IBOutlet weak private var imgContainerView: UIView!
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var scrollView: UIScrollView!
    
    // MARK: VARIABLES
    var userData: User?
    private lazy var viewModel = EditProfileViewModel()
    var coordinator: EditProfileCoordinator?
    weak var userDelegate: UpdateUserDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    
    @IBAction func logOutTapped(_ sender: UIButton) {
        UserManager.shared.isUserLogin = false
        DispatchQueue.main.async {
            self.coordinator?.goToLoginVc()
        }
        
    }
    
}

// MARK: NAVIGATION BUTTON ACTIONS
extension EditProfileVc {
    
    @objc private func saveProfileButtonClicked(_ sender: UITapGestureRecognizer) {
        guard let firstName = tfFirstName.text,
              let lastName = tfLastName.text,
              let job = tfJob.text,
              validateEntriesAndUpdate(firstName: firstName, lastName: lastName, job: job) else {
            return
        }
        
        getResponseStatus()
        // Here implement Profile Vc navigation with fields
    }
    
    @objc private func backButtonPressed(_ sender: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: INITIAL SETUP
extension EditProfileVc {
    
    private func placeImageOnProfile() {
        let childView = UIView()
        childView.frame = CGRect(x: (imgUserProfile.bounds.width) - 18, y: imgUserProfile.bounds.height - 20, width: 28, height: 28)
        childView.backgroundColor = UIColor(named: Constants.Resources.colorTableTheme)
        childView.layer.cornerRadius = childView.bounds.width/2
        let cameraImg = UIImageView()
        
        cameraImg.image = UIImage(named: Constants.Resources.camera)
        cameraImg.tintColor = UIColor(named: Constants.Resources.colorTheme)
        cameraImg.frame = CGRect(x: childView.bounds.midX - 6.5, y: childView.bounds.midY - 6.5, width: 13, height: 13)
        childView.layer.borderWidth = 2
        childView.layer.borderColor = UIColor.white.cgColor
        cameraImg.layer.cornerRadius = cameraImg.bounds.width / 2
        
        childView.clipsToBounds = true
        imgUserProfile.isUserInteractionEnabled = true
        childView.addSubview(cameraImg)
        childView.layer.cornerRadius = childView.bounds.height / 2
        imgUserProfile.layer.cornerRadius = imgUserProfile.bounds.height / 2
        imgContainerView.addSubview(childView)
    }
    
    private func getResponseStatus() {
        viewModel.isResponseArrivedSucessfully.bind { [weak self] isSuccessFull in
            DispatchQueue.main.async { [weak self] in
                if let userData = self?.userData {
                    self?.userDelegate?.updateUser(user: userData)
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    private func setUpViews() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = Constants.Navigation.editProfileTitle
        let saveBtn = UIBarButtonItem(image: UIImage(named: Constants.Resources.imgTick),
                                      style: .plain, target: self, action: #selector(saveProfileButtonClicked))
        saveBtn.tintColor = UIColor(named: Constants.Resources.colorTableTheme)
        navigationItem.rightBarButtonItem = saveBtn
        let backBtn = UIBarButtonItem(image: UIImage(named: Constants.Resources.imgback2),
                                      style: .plain, target: self, action: #selector(backButtonPressed))
        backBtn.tintColor = UIColor(named: Constants.Resources.colorTableTheme)
        navigationItem.leftBarButtonItem = backBtn
        containerView.layer.cornerRadius = 15
        guard let userData else {
            return
        }
        let keyboardDismissHelper = KeyboardDismissHelper.shared(view: scrollView)
        placeImageOnProfile()
        configureUserData(user: userData)
    }
}

// MARK: VALIDATION
extension EditProfileVc {
    private func validateEntriesAndUpdate(firstName: String, lastName: String, job: String) -> Bool {
        if !firstName.isEmpty && !lastName.isEmpty && !job.isEmpty {
            let editUserReq = EditUserRequest(name: "\(firstName) \(lastName)", job: tfJob.text)
            if let id = userData?.id {
                viewModel.editProfileOnServer(userId: id, userRequest: editUserReq)
                return true
            }
        } else {
            let alertController = UIAlertController(title: Constants.Strings.invalidEntries, message: Constants.Strings.fieldSuggession, preferredStyle: .alert)
            let okAction = UIAlertAction(title: Constants.Strings.alertActionOk, style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        return false
    }
    
}

// MARK: DATA CONFIGURATION
extension EditProfileVc {
    private func configureUserData(user: User) {
        tfFirstName.text = user.firstName
        tfLastName.text = user.lastName
        tfEmail.text = user.email
        tfJob.text = Constants.Strings.userJobName
        if let userImg = user.avatar {
            imgUserProfile.kf.setImage(with: URL(string: userImg))
        }
    }
}

// MARK: PROTOCOL
protocol UpdateUserDataDelegate : AnyObject {
    func updateUser(user: User)
}
