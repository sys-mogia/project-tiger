//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/********************************/

//タプル
//p.87

//最小値、最大値を返却
func requestMinAndMax() -> (min: Int, max: Int){
    //値はdoubleで返却
    return(1, 100) //return(min, max)
}

let minAndMax = requestMinAndMax()
let minValue = minAndMax.min //最小値取り出し(minAndMax.0でも取り出し可能)
let maxValue = minAndMax.max //最大値取り出し(minAndMax.1でも取り出し可能)



//下記の場合、型を書いているものと見なされる↓
//func getvalue() -> (hoge, piyo, huga){

func getvalue() -> (hoge: Bool, piyo: Int, huga:Float){
    return(true, 1, 2.2)
}

let resultAll = getvalue()
let resultX = resultAll.hoge
let resultY = resultAll.piyo
let resultZ = resultAll.huga

/********************************/

//Optional
//p.60

var value: String?
value = "Hello"
//print(value) //Optional型でラップされたままのvalueを出力
if let value1 = value{ //nilチェック&アンラップ処理
//    print(value1) //アンラップされた値が格納されているvalue1を出力
}

//型指定なしでのOptionalはできない↓
//var OPT: ?


var oneTime: String?
oneTime = "ONE"
if let _ = oneTime{ //以降、変数を使わない場合は、アンラップ後の変数を省略できる
//    print("oneTime != nil")
}


var sameName: String?
sameName = "hoge"
if let sameName = sameName{ //同じ名前をラップ、アンラップ用に指定した場合、後に作られた変数が優先される
//    print(sameName)
}

/*guard よくわからない -> 復習 p.101*/

/********************************/

//関数
//p.62

/*func s_guard(sample: String?) -> Bool{ // -> Boolは、「戻り値がBoolである」
    guard var sample = sample else {
        print("nil!")
        return false
    }
    print(sample)
    sample = "not nil"
    print(sample)
    return true
}


var s_guard1: Bool?

s_guard1 = s_guard(sample: "this is not nil")
print(s_guard1!)
//s_guard1がnilの場合、"bye"を出力。nilでない場合、アンラップ前のs_guard1を出力
print(s_guard1 ?? "bye")*/


/*func sampleFunc(value: Int) -> Int{
    var resultvalue: Int = 0
    //処理省略
    return resultvalue
}

sampleFunc(value: 10) //10を引数に、処理をsampleFuncへ。sampleFuncでは変数に0を入れてreturnされる


func showTestScore(mathScore: Int) -> String{
    return "数学¥(mathScore)点"
}

showTestScore(mathScore: 100)*/


/********************************/

//クラス
//p.72
import UIKit

var radio = UISwitch() //UISwitchクラスをインスタンス化
radio.isOn = true //UISwitchからインスタンス化したradioインスタンスのプロパティを変更
radio.isOn = false
//直前のradio.isOnに影響される？
radio.setOn(false, animated: true)


class Dog{ //独自クラス
    var name = "" //プロパティ「名前」
    var type = "" //プロパティ「種類」
    var birth = "" //プロパティ「誕生日」
    
    func bark() -> String{ //メソッド「吠える」
        //print("わんわん")
        return "わんわん"
    }
    func walk(){ //メソッド「歩く」
        //print("GOGOGO")
    }
    
}

//継承：盲導犬クラス Dogクラスから内容を引き継ぐ+独自の内容を追加
class GuideDog: Dog {
    override func bark() -> String {//オーバーライド：barkメソッド Dogクラスに影響を与えず、盲導犬クラス内での挙動を変更
        //print("きゃんきゃん")
        return "きゃんきゃん"
    }
}

/*var Ins_dog = Dog()
Ins_dog.name = "いぬ" //名前を設定
Ins_dog.bark() //メソッドの実行
Ins_dog.walk()

var Ins_guide = GuideDog()
Ins_guide.name = "すごいいぬ"
Ins_guide.bark()*/


/********************************/

//arrayとdictionalyで何か作る
//p.56~


/*Dictionaly*/
//valueにkeyをつけられる

var whatDog: [String:String] = [String:String]()
whatDog["きゃんきゃん"] = "逆引き：すごいいぬ"
whatDog["わんわん"] = "逆引き：いぬ"



var Ins_dog = Dog()
Ins_dog.bark()
var who = Ins_dog.bark()
print(who)
var answer = whatDog[who]
if let answer = answer{
    print(answer)
}


var Ins_guide = GuideDog()
Ins_guide.bark()
var who2 = Ins_guide.bark()
print(who2)
var answer2 = whatDog[who2]
if let answer2 = answer2{
    print(answer2)
}



//データ取得
//X[""]

print("\n/******************/")

/*array*/
//valueを呼び出すのに添字を使う（任意の名前はつけられない）
let allay: [String] = ["起きる","朝食","買い物","昼食","散歩","勉強","料理","夕食","趣味","寝る"]

var string1 = "："
var count = 1
print("\n明日のToDo↓")
for i in allay {
    print(i)
}

let asap = allay[1]
print("\nすぐやる↓")
print(asap)












