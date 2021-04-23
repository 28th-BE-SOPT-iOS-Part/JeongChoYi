//
//  FriendsViewController.swift
//  assignment-kakao
//
//  Created by 초이 on 2021/04/23.
//

import UIKit

class FriendsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
    }
    
    // MARK: - @IBAction Functions
    
    @IBAction func touchProfilePicButton(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.myProfile) as? MyProfileViewController else { return }
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
    
    
    // MARK: - Functions
    
    private func initNavigationBar() {
        
        // title align left 설정
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "친구"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .left
        navigationItem.titleView = label
        
        if let navigationBar = navigationController?.navigationBar {
            label.widthAnchor.constraint(equalTo: navigationBar.widthAnchor, constant: -40).isActive = true
        }
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
}
