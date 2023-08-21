//
//  Cardnudge.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 21/07/23.
//

import UIKit

class CardnudgeController: UITableViewCell {
    @IBOutlet var topLabel: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.isHidden = true
        topLabel.image = UIImage(systemName: "checkmark")?.withRenderingMode(.alwaysTemplate)
        topLabel.tintColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
