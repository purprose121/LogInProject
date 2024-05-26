//
//  BioViewController.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 25.05.2024.
//

import UIKit

final class BioViewController: UIViewController {
//MARK: - IBOutlets
    @IBOutlet var bioLabel: UILabel!

//MARK: - Public properties
    var bio = ""

//MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        bioLabel.text = bio
    }
}
