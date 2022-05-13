//
//  MediaCell.swift
//  InterviewTask
//
//  Created by Reshma on 14/03/21.
//

import UIKit
import Kingfisher

class MediaCell: UITableViewCell {
    static let cellIdentifier = "MediaCell"

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var thumpImage: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupCell(with viewModel: MediaModel) {
        self.thumpImage.backgroundColor = .clear
        self.thumpImage?.kf.indicatorType = .activity
        var urlString = ""
        if viewModel.thumb.contains("https") {
            urlString = viewModel.thumb.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        else{
            urlString = viewModel.thumb.replacingOccurrences(of: "http", with: "https").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        let url = URL(string: String(urlString))
        thumpImage.kf.setImage(with: url)
        self.lblTitle.text = viewModel.title
        self.lblDescription.text = viewModel.description
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
