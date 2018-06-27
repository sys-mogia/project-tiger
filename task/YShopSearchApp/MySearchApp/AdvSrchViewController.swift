//
//  AdvSrchViewController.swift
//  MySearchApp
//
//  Created by systena on 2018/06/16.
//  Copyright © 2018年 Mao Nishi. All rights reserved.
//

import UIKit

class AdvSrchViewController: UIViewController/*, UIPickerViewDataSource, UIPickerViewDelegate,*/ {
    
    // APIを利用するためのクライアントID
    let appid = "dj00aiZpPXMxdWFBbURVZnk1ZyZzPWNvbnN1bWVyc2VjcmV0Jng9OTc-"
    
    let entryUrl: String = "https://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch"
    
    @IBOutlet weak var LowPrice: UIPickerView!
    
    
    @IBOutlet weak var HighPrice: UIPickerView!
    
    
    @IBOutlet weak var OnlyInStock: UISwitch!
    
    
    @IBOutlet weak var OnlySale: UISwitch!
    
    
    @IBOutlet weak var Sort: UIPickerView!
    
    
    @IBOutlet weak var searchWord: UITextField!
    
    // SearchButtonタップ時に呼び出し
    @IBAction func tapSearchButton(_ sender: Any) {
        // 入力された文字の取り出し
        guard let inputText = searchWord.text else {
            // 入力文字なし
            return
        }
        
        // 入力文字数が0文字より多いかどうかチェックする
        guard inputText.lengthOfBytes(using: String.Encoding.utf8) > 0 else {
            // 0文字より多くはなかった
            return
        }
        
        // パラメータを指定する
        let parameter = ["appid": appid, "query": inputText]
        
        // パラメータをエンコードしたURLを作成する
        let requestUrl = createRequestUrl(parameter: parameter)
        
        // APIをリクエストする
        request(requestUrl: requestUrl)
        
    }
    
    // パラメータのURLエンコード処理
    func encodeParameter(key: String, value: String) -> String? {
        // 値をエンコードする
        guard let escapedValue = value.addingPercentEncoding(
            withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
                // エンコード失敗
                return nil
        }
        // エンコードした値をkey=valueの形式で返却する
        return "\(key)=\(escapedValue)"
    }
    
    // URL作成処理（リクエスト作成）
    func createRequestUrl(parameter: [String: String]) -> String {
        var parameterString = ""
        for key in parameter.keys {
            // 値の取り出し
            guard let value = parameter[key] else {
                // 値なし。次のfor文の処理を行う
                continue
            }
            // すでにパラメータが設定されていた場合
            if parameterString.lengthOfBytes(using: String.Encoding.utf8) > 0 {
                // パラメータ同士のセパレータである&を追加する
                parameterString += "&"
            }
            // 値をエンコードする
            guard let encodeValue = encodeParameter(key: key, value: value)
                else {
                    // エンコード失敗。次のfor文の処理を行う
                    continue
            }
            // エンコードした値をパラメータとして追加する
            parameterString += encodeValue
        }
        let requestUrl = entryUrl + "?" + parameterString
        return requestUrl
    }
    
    // リクエストを行う（ここで通信を行う）
    func request(requestUrl: String) {
        // URL生成
        /*guard let url = URL(string: requestUrl) else {
            // URL生成失敗
            return
        }
        // リクエスト生成
        let request = URLRequest(url: url)
        // 商品検索APIをコールして商品検索を行う
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data:Data?,
            response:URLResponse?, error:Error?) in
            // 通信完了後の処理
            // エラーチェック
            guard error == nil else {
                // エラー表示
                let alert = UIAlertController(title: "エラー",
                                              message: error?.localizedDescription,
                                              preferredStyle: UIAlertControllerStyle.alert)
                // UIに関する処理はメインスレッド上で行う
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
                return
            }
            // JSONで返却されたデータをパースして格納する
            guard let data = data else {
                // データなし
                return
            }
            
            do {
                // パース実施
                let resultSet = try JSONDecoder().decode(ItemSearchResultSet.self, from: data)
                // 商品のリストに追加
                self.itemDataArray.append(contentsOf: resultSet.resultSet.firstObject.result.items)
                
            } catch let error {
                print("## error: \(error)")
            }
            
            // テーブルの描画処理を実施
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        // 通信開始
        task.resume()*/
    }
    
    /*
    //ピッカー設定
    let lowPrice = ["0","1000","2000","5000","10000","30000"]
    let highPrice = ["1000","2000","5000","10000","30000","50000"]
    let sort = ["価格","ストア名","レビュー数順"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LowPrice.delegate = self
        LowPrice.dataSource = self
        
        //HighPrice.delegate = self
        //HighPrice.dataSource = self
        
        //Sort.delegate = self
        //Sort.dataSource = self
    }
    
    //UIPickerViewの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //UIPickerViewの行数とリスト数（lowPrice）
    func pickerViewLow(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lowPrice.count
    }

    //UIPickerViewの行数とリスト数（highPrice)
    func pickerViewHigh(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return highPrice.count
    }
    
    //UIPickerViewの行数とリスト数（sort）
    func pickerViewSort(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sort.count
    }
    
    //
    func pickerViewLow(_ pickerView: UIPickerView, titleForRow row: Int, inComponent component: Int) -> String? {
        return lowPrice[row]
    }
    
    func pickerViewHigh(_ pickerView: UIPickerView, titleForRow row: Int, inComponent component: Int) -> String? {
        return highPrice[row]
    }
    
    func pickerViewSort(_ pickerView: UIPickerView, titleForRow row: Int, inComponent component: Int) -> String? {
        return sort[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/
    
    
}
