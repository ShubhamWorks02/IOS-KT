//
//  ExpandableTableViewCell.swift
//  URLSession
//
//  Created by Shubham Bhatt on 11/08/23.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var lblPersonName: UILabel!
    @IBOutlet weak var lblMemberDuration: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnSeeMore: UIButton!
    @IBOutlet weak var heightOut: NSLayoutConstraint!
    
    // MARK: VARIABLES
    var delegate: ExpandDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func configCell(data: Article) {
        lblPersonName.text = data.title
        lblDescription.numberOfLines = 0
        lblDescription.text = data.description
        // heightOut.priority = UILayoutPriority(1) // isExpanded
        lblDate.text = data.publishedAt
        heightOut.priority = UILayoutPriority(data.isExpanded! ? 1 : 1000) // initial label not visible
        // lblDescription.numberOfLines = data.isExpanded! ? 0 : 4
    }
    
    // MARK: ACTIONS
    @IBAction func seeMoreTapped(_ sender: UIButton) {
        delegate?.btnSeemoreTapped(cell: self)
    }
}

protocol ExpandDelegate {
    func btnSeemoreTapped(cell: ExpandableTableViewCell)
}
