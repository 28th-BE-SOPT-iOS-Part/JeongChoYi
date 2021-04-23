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
        initNavigationBar()
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchJoinButton(_ sender: Any) {
        
        let isJoinUnavailable = (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || (passwordCheckTextField.text?.isEmpty)!
        
        if !isJoinUnavailable {
            
            pushToTabBarController()
        }
    }
    
    // MARK: - Functions
    
    func pushToTabBarController() {
        let tabBarStoryboard = UIStoryboard(name: Const.Storyboard.Name.tabBar, bundle: nil)
        guard let tabBarController = tabBarStoryboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.tabBarViewController) as? TabBarViewController else {
            return
        }
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    func initNavigationBar() {
        self.navigationController?.initializeNavigationBarWithoutBackButton(navigationItem: self.navigationItem)
    }
}
