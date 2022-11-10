//
//  MyTableViewController.swift
//  ToDoList(UIKit)
//
//  Created by 沈庭鋒 on 2022/11/6.
//

import UIKit

class MyTableViewController: UITableViewController {

    var listItem = [Item]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadList()
        
    }
    
    func saveList() {

             let shoppingItemsDic = listItem.map { Item -> [String: Any] in

                return ["itemName": Item.itemName , "done": Item.done]
            }

            UserDefaults.standard.set(shoppingItemsDic, forKey: "list")

        }
    
    
    func loadList() {

        if let okList = UserDefaults.standard.array(forKey: "list") as? [[String: Any]] {

            listItem = []

            for okItem in okList {

                let itemName = okItem["itemName"] as? String ?? ""
                let done = okItem["done"] as? Bool ?? false

                listItem.append(Item(itemName: itemName, done: done))

            }

        }

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return listItem.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        cell.textLabel?.text = listItem[indexPath.row].itemName
        
        if listItem[indexPath.row].done == true {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let cell = tableView.cellForRow(at: indexPath)!
            
            if listItem[indexPath.row].done == false {
                
                cell.accessoryType = .checkmark
                listItem[indexPath.row].done = true
                
            } else {
                
                cell.accessoryType = .none
                listItem[indexPath.row].done = false
                
            }
            
            saveList()
            tableView.reloadData()
            
        }
 
    /*
   // 使用editActionsForRowAt，在iOS 13之後換出現黃色警告，貌似無法直接滑到底刪除，不建議使用，改用下方UIContextualAction
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

           // 生成刪除按鈕
        let deleteAction: UITableViewRowAction = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "Delete", handler: {(action, indexPath) -> Void in

               // 將資料從陣列移除
               self.listItem.remove(at: indexPath.row)


               // 將畫面上的cell移除
               self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0) as IndexPath], with: UITableView.RowAnimation.fade)
               self.saveList()
           })

           deleteAction.backgroundColor = UIColor.brown

//           // 生成分享按鈕
//           let shareAction: UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {(action, indexPath) -> Void in
//
//               let text: String = self.titleDatas[indexPath.row]
//               let image: UIImage = UIImage(named: self.imageDatas[indexPath.row])!
//
//               let activityViewController: UIActivityViewController =  UIActivityViewController(activityItems: [text, image], applicationActivities: nil)
//               self.present(activityViewController, animated: true, completion: nil)
//           })
//
//           shareAction.backgroundColor = UIColor.darkGray
//

           return [deleteAction]


       }
    */
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           
           // 生成刪除按鈕
        let deleteAction: UIContextualAction = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, success) -> Void in
               
               // 將資料從陣列移除
               self.listItem.remove(at: indexPath.row)
            
               
               // 將畫面上的cell移除
               self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0) as IndexPath], with: UITableView.RowAnimation.fade)
               self.saveList()
           })
           
//           deleteAction.backgroundColor = UIColor.brown
           
//           // 生成分享按鈕
//           let shareAction: UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {(action, indexPath) -> Void in
//
//               let text: String = self.titleDatas[indexPath.row]
//               let image: UIImage = UIImage(named: self.imageDatas[indexPath.row])!
//
//               let activityViewController: UIActivityViewController =  UIActivityViewController(activityItems: [text, image], applicationActivities: nil)
//               self.present(activityViewController, animated: true, completion: nil)
//           })
//
//           shareAction.backgroundColor = UIColor.darkGray
//
           
        return UISwipeActionsConfiguration(actions: [deleteAction])
           
       }
    
    
    
    @IBAction func Additem(_ sender: Any) {
        
//     listItem.append(Item(itemName: "second", done: true))
        popAlertFunc()
        
    }
    
    
    
    func popAlertFunc(){
        
        
        
        let alertController = UIAlertController(
                title: "提示",
                message: "一個簡單提示，請按確認繼續",
                preferredStyle: .alert)
        
        // 建立兩個輸入框
        alertController.addTextField {
             (textField: UITextField!) -> Void in
             textField.placeholder = "帳號"
         }
       
        
        // 建立[確認]按鈕
            let okAction = UIAlertAction(
                title: "確認",
                style: .default,
                handler: {
                (action: UIAlertAction!) -> Void in
                    let MyTextFeild =
                              (alertController.textFields?.first)!
                                as UITextField
                    self.listItem.append(Item(itemName: "\(MyTextFeild.text ?? "")", done: false))
                    self.saveList()
                    self.tableView.reloadData()
                })
        
        alertController.addAction(okAction)
        
        
        // 顯示提示框
        self.present(
              alertController,
              animated: true,
              completion: nil)
        
    }
    
    
    
}
