//
//  FriendsViewController.swift
//  assignment-kakao
//
//  Created by 초이 on 2021/04/23.
//

import UIKit

class FriendsViewController: UIViewController {
    
    // MARK: - Properties
    private var friendList: [FriendDataModel] = []
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignDelegate()
        assignDataSource()
        setFriendList()
        registerXib()
        
    }
    
    // MARK: - @IBAction Functions
    
    //    @IBAction func touchProfilePicButton(_ sender: Any) {
    //        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.myProfile) as? MyProfileViewController else { return }
    //        dvc.modalPresentationStyle = .fullScreen
    //        self.present(dvc, animated: true, completion: nil)
    //    }
    
    
    // MARK: - Functions
    
    private func assignDelegate() {
        self.friendsTableView.delegate = self
    }
    
    private func assignDataSource() {
        self.friendsTableView.dataSource = self
    }
    
    private func registerXib() {
        friendsTableView.register(UINib(nibName: Const.Xib.Name.me, bundle: nil), forCellReuseIdentifier: Const.Xib.Identifier.me)
        friendsTableView.register(UINib(nibName: Const.Xib.Name.friends, bundle: nil), forCellReuseIdentifier: Const.Xib.Identifier.friends)
    }
    
    func setFriendList() {
        friendList.append(contentsOf: [
            FriendDataModel(imageName: "profileImage1",
                            name: "안솝트",
                            state: "배고파요"),
            
            FriendDataModel(imageName: "profileImage2",
                            name: "최솝트",
                            state: "피곤해요"),
            
            FriendDataModel(imageName: "profileImage3",
                            name: "정솝트",
                            state: "시험언제끝나죠?"),
            
            FriendDataModel(imageName: "profileImage4",
                            name: "이솝트",
                            state: "ㅠㅠㅠㅠ"),
            
            FriendDataModel(imageName: "profileImage5",
                            name: "유솝트",
                            state: "나는 상태메세지!"),
            
            FriendDataModel(imageName: "profileImage6",
                            name: "박솝트",
                            state: "원하는대로 바꿔보세요 ^_^"),
            
            FriendDataModel(imageName: "profileImage7",
                            name: "최솝트",
                            state: "넘 덥다.."),
            
            FriendDataModel(imageName: "profileImage8",
                            name: "원솝트",
                            state: "배고파요"),
            
            FriendDataModel(imageName: "profileImage9",
                            name: "투솝트",
                            state: "내꿈은 대나무부자"),
            
            FriendDataModel(imageName: "profileImage10",
                            name: "권솝트",
                            state: "걱정말라구!")
        ])
    }
}

// MARK: - UITableViewDelegate

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 73
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: Const.ViewController.Identifier.myProfile) as? MyProfileViewController else { return }
        dvc.modalPresentationStyle = .fullScreen
        
        if indexPath.row != 0 {
            
            dvc.image = friendList[indexPath.row - 1].image
            dvc.name = friendList[indexPath.row - 1].name
        }
        
        self.present(dvc, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.Xib.Identifier.me, for: indexPath) as? MeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.Xib.Identifier.friends, for: indexPath) as? FriendsTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setCell(image: friendList[indexPath.row - 1].image, name: friendList[indexPath.row - 1].name, message: friendList[indexPath.row - 1].state)
            
            return cell
        }
    }
    
    
}
