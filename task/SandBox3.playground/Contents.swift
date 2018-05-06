//: Playground - noun: a place where people can play
import Foundation


//ズンドコ取り出し用
var zundoko:[String] = ["ズン", "ドコ"]
//答え
var ans:[String] = ["ズン", "ズン", "ズン", "ズン", "ドコ"]
//取り出したデータ格納用
var result = [String]()


//ズンドコ
while(true){
    //1~2までで乱数
    let random = Int(arc4random_uniform(2))
    
    //配列からランダムに取り出し
    let getString = zundoko[random]
    print(getString)
    
    //取り出したデータを格納
    result += [getString]
    
    //result配列に5つデータが入ってから比較
    if(result.count >= 5){
        //ズン
        if(result[result.count - 5] == ans[(result.count - result.count)]){
            //ズン
            if(result[result.count - 4] == ans[(result.count - (result.count - 1))]){
                //ズン
                if(result[result.count - 3] == ans[(result.count - (result.count - 2))]){
                    //ズン
                    if(result[result.count - 2] == ans[(result.count - (result.count - 3))]){
                        //ドコ
                        if(result[result.count - 1] == ans[(result.count - (result.count - 4))]){
                            print("キ・ヨ・シ！！！")
                            break
                        }
                    }
                }
            }
        }
    }
}
