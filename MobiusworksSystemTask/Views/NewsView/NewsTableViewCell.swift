//
//  ProductTableViewCell.swift
//  MobiusworksSystemTask
//
//  Created by Nikhil Balne on 21/12/20.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    
    func setNewsCellDetails(newsArticle:Article){
        self.titleLabel.text = newsArticle.title
        self.authorLabel.text = newsArticle.author
        self.descriptionLabel.text = newsArticle.articleDescription
        self.imageViewLabel.kf.indicatorType = .activity
        self.imageViewLabel.kf.setImage(with: URL(string: (newsArticle.urlToImage))!)
    }
    
}
