//
//  ViewController.swift
//  ToDoList(UIKit)
//
//  Created by 沈庭鋒 on 2022/10/22.
//
/*
 把確認的按鈕做成譨切換有沒有勾勾
 在第二個頁面做新增事項的頁面
 刪除已完成事項
 */

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var MyTableView: UITableView!
    
    
    var list = ["First","Second","Third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        MyTableView.delegate = self
        MyTableView.dataSource = self
        
    }

    @IBAction func AddButton(_ sender: Any) {
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell{
            
            cell.ToDoThings.text = list[indexPath.row]
            
            return cell
        }else{
            let cell = UITableViewCell()
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
    
}
