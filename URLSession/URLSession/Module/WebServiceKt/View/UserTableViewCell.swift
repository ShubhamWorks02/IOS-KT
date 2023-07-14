//
//  UserTableViewCell.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {

    // MARK: OUTLET
    @IBOutlet weak private var imgUser: UIImageView!
    @IBOutlet weak private var lblUserName: UILabel!
    @IBOutlet weak private var lblUserEmail: UILabel!
    @IBOutlet weak private var lblUserid: UILabel!
    
    // MARK: LIFECYCLE METHOD
    override func awakeFromNib() {
        super.awakeFromNib()
        imgUser.makeViewCircular()
    }
    
    // MARK: CONFIG CELL
    func configCell(data: User) {
        if let imageUrl = data.avatar {
            imgUser.kf.setImage(with: URL(string: imageUrl))
        }
        if let firstName = data.firstName, let lastName = data.lastName {
            lblUserName.text = "\(firstName) \(lastName)"
        }
        if let id = data.id, let email = data.email {
            lblUserid.text = "\(id)"
            lblUserEmail.text = email
        }
    }
    
}
