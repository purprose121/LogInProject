//
//  BasicInformationViewController.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 24.05.2024.
//

import UIKit

final class BasicInformationViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var jobTitleLabel: UILabel!
    @IBOutlet var photoImage: UIImageView! {
        didSet {
            photoImage.layer.cornerRadius = photoImage.frame.size.height / 2
        }
    }

    //MARK: - Public properties
    var person: Person!
    
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = person.fullName
        navigationController?.title = "Info"
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: self.title,
            style: .plain,
            target: nil,
            action: nil
        )
        
        photoImage.image = UIImage(named: person.photo)
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        companyLabel.text = person.company
        departmentLabel.text = person.department
        jobTitleLabel.text = person.jobTitle
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.title = ("\(person.fullName) Bio")
        bioVC.bio = person.bio
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        showAlertBeforeExit(identifier)
    }
}
