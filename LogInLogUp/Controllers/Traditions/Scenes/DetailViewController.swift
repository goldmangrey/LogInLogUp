//
//  DetailViewController.swift
//  LogInLogUp
//
//  Created by Yeskendir on 29.05.2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var recipe: Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let recipe = recipe {
            navigationItem.title = recipe.name
            imageView.image = UIImage(named: "Image")
            nameLabel.text = recipe.name

        }
    }
}
