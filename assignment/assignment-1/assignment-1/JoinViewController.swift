//
//  JoinViewController.swift
//  assignment-1
//
//  Created by 초이 on 2021/04/09.
//

import UIKit

class JoinViewController: UIViewController {
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchJoinButton(_ sender: Any) {
        
        let isJoinUnavailable = (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || (passwordCheckTextField.text?.isEmpty)!
        
        if !isJoinUnavailable {
            
            
            guard let dvc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return }
            
            dvc.email = emailTextField.text
            
            self.present(dvc, animated: true, completion: {
                self.navigationController?.popViewController(animated: false)
            })
        }
    }
}
