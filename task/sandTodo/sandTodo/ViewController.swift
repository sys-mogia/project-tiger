//
//  ViewController.swift
//  sandTodo
//
//  Created by systena on 2018/05/19.
//  Copyright © 2018年 systena. All rights reserved.
//

import UIKit

//プロトコル利用宣言
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //ToDoプロパティ宣言
    var todoList = [MyToDo]()
    
    //UITableViewのoutlet定義
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //保存しているToDoの読み込み処理
        let userDefaults = UserDefaults.standard
        if let storedToDoList = userDefaults.object(forKey: "todoList") as? Data{
            if let unarchiveTodoList = NSKeyedUnarchiver . unarchiveObject(with: storedToDoList) as? [MyToDo]{
            todoList.append(contentsOf: unarchiveTodoList)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //+ボタンタップ時に呼ばれる処理
    @IBAction func tapAddButton(_ sender: Any) {
        //アラートダイアログ生成
        let alertController = UIAlertController(title: "TODO追加", message: "TODOを入力してください", preferredStyle: UIAlertControllerStyle.alert)
        //テキストエリア追加
        alertController.addTextField(configurationHandler: nil)
        
        //OKボタン追加
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction) in
            //OKボタンタップ時処理
            if let textField = alertController.textFields?.first{
                
                //ToDo配列の先頭に入力値挿入
                let myToDo = MyToDo()
                myToDo.todoTitle = textField.text!
                self.todoList.insert(myToDo, at: 0)
                
                //行が追加されたことをテーブルに通知
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.right)
                
                //ToDoの保存処理
                let userDefaults = UserDefaults.standard
                //Data型にシリアライズする
                let data = NSKeyedArchiver.archivedData(withRootObject: self.todoList)
                userDefaults.set(data, forKey: "todoList")
                userDefaults.synchronize()
            }
        }
        //OKボタンタップ時処理
        alertController.addAction(okAction)
        
        //CANCELボタンタップ時の動作
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.cancel, handler: nil)
        //CANCELボタン追加
        alertController.addAction(cancelButton)
        
        //アラートダイアログ表示
        present(alertController, animated: true, completion: nil)
    }
    
    //テーブルの行数を返却
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    //テーブルの行ごとのセルを返却
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //StoryBoardで指定したtodoCell識別子を利用して再利用可能なセルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        //行番号にあったToDoの情報を取得
        let myToDo = todoList[indexPath.row]
        
        //セルのラベルにToDoのタイトルをセット
        cell.textLabel?.text = myToDo.todoTitle
        //セルのチェックマーク状態をセット
        if myToDo.todoDone {
            //チェックあり
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            //チェックなし
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    //セルをタップしたときの処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myTodo = todoList[indexPath.row]
        if myTodo.todoDone{
            //完了済みの場合は未完了に変更
            myTodo.todoDone = false
        } else {
            //未完の場合は完了済みに変更
            myTodo.todoDone = true
        }
        
        //セルの状態を変更
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        //データ保存。Data型にシリアライズする
        let data: Data = NSKeyedArchiver.archivedData(withRootObject: todoList)
        //UserDefaultsに保存
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "todoList")
        userDefaults.synchronize()
    }
    
    //セルを削除したときの処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //削除対象かどうか
        if editingStyle == UITableViewCellEditingStyle.delete {
            //ToDoリストから削除
            todoList.remove(at: indexPath.row)
            //セルを削除
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            //データ保存。Data型にシリアライズする
            let data: Data = NSKeyedArchiver.archivedData(withRootObject: todoList)
            //UserDefaultsに保存
            let userDefaults = UserDefaults.standard
            userDefaults.set(data, forKey: "todoList")
            userDefaults.synchronize()
        }
    }
}

//独自クラスをシリアライズする際には、NSObjectを継承し、NSCordingプロトコルに準拠する必要がある
class MyToDo: NSObject, NSCoding {
    //ToDoのタイトル
    var todoTitle: String?
    
    //ToDoを完了したかを表すフラグ
    var todoDone: Bool = false
    
    //コンストラクタ
    override init() {
        
    }
    
    //NSCodingプロトコルに宣言されているデシリアライズ処理。デコード処理とも
    required init?(coder aDecoder: NSCoder) {
        todoTitle = aDecoder.decodeObject(forKey: "todotitle") as? String
        todoDone = aDecoder.decodeBool(forKey: "todoDone")
    }
    
    //NSCodingプロトコルに宣言されているシリアライズ処理。エンコードとも
    func encode(with aCoder: NSCoder) {
        aCoder.encode(todoTitle, forKey: "todoTitle")
        aCoder.encode(todoDone, forKey: "todoDone")
    }
}
