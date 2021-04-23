//
//  LoginViewController.swift
//  assignment-1
//
//  Created by 초이 on 2021/04/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchLoginButton(_ sender: Any) {
        
        let LoginUnavailable = (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!
        
        // 로그인 가능
        if !LoginUnavailable {
            pushToTabBarController()
        }
        
    }
    
    @IBAction func touchJoinButton(_ sender: Any) {
        
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "JoinViewController") as? JoinViewController else { return }
        
        self.navigationController?.pushViewController(dvc, animated: true)
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
    
}
