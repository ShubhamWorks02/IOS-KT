//
//  ProfileVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import UIKit
import Kingfisher

class ProfileVc: UIViewController , UpdateUserDataDelegate {
    
    // MARK: OUTLETS
    @IBOutlet weak private var imgProfile: UIImageView!
    @IBOutlet weak private var lblUserName: UILabel!
    @IBOutlet weak private var lblEmail: UILabel!
    @IBOutlet weak private var lblUserLastName: UILabel!
    @IBOutlet weak private var lblUserId: UILabel!
    @IBOutlet weak private var btnNotificationStatus: UIButton!
    @IBOutlet weak private var profileView: UIView!
    @IBOutlet weak private var notificationView: UIView!
    
    // MARK: VARIABLES
    var userData: User?
    var coordinator: ProfileCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetUp()
    }
    
    // MARK: ACTION METHODS
    @IBAction func btnNotificationClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @objc private func editProfileTapped(_ sender: UITapGestureRecognizer) {
        coordinator?.goToEditProfileVc()
    }
    
    
    @IBAction func logOutTapped(_ sender: UIButton) {
        UserManager.shared.isUserLogin = false
        DispatchQueue.main.async {
            self.coordinator?.goToLoginVc()
        }
    }
    
}

// MARK: UI SETUPS
extension ProfileVc {
    private func initSetUp() {
        setUpUserProfile()
        imgProfile.makeViewCircular()
        btnNotificationStatus.isSelected = false
        setUpViews()
    }
    
    private func setUpUserProfile() {
        if let imgString = userData?.avatar {
            imgProfile.kf.setImage(with: URL(string: imgString))
        }
        lblEmail.text = userData?.email
        lblUserName.text = userData?.firstName
        lblUserLastName.text = userData?.lastName
        if let userId = userData?.id {
            lblUserId.text = "\(userId)"
        }
    }
    
    private func setUpViews() {
        navigationItem.title = Constants.Navigation.profileTitle
        let saveBtn = UIBarButtonItem(image: UIImage(named: Constants.Resources.imgBack),
                                      style: .plain, target: self, action: #selector(editProfileTapped(_:)))
        saveBtn.tintColor = UIColor(named: Constants.Resources.colorTableTheme)
        navigationItem.rightBarButtonItem = saveBtn
        profileView.layer.cornerRadius = 12
        notificationView.layer.cornerRadius = 8
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func updateUser(user: User) {
        userData = user
    }
}

// MARK: VIEW EXTENSIONS
extension UIView {
    func makeViewCircular() {
        layer.cornerRadius = self.frame.height / 2
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
}
