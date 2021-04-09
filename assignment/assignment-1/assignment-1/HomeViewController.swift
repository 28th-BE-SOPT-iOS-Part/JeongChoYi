//
//  HomeViewController.swift
//  assignment-1
//
//  Created by 초이 on 2021/04/09.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    // MARK: - Properties
    
    var email: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        setLabel()
    }
    

    // MARK: - Functions
    
    func setLabel() {
        if let email = self.email {
            emailLabel.text = "\(email)님"
        }
    }
    
    // MARK: - @IBAction Functions
    
    @IBAction func touchDoneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
