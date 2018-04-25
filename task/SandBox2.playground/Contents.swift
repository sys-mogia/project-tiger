//クラス（スーパークラス）準備
//04/25 レビュー指摘修正 -> スーパークラスとなるクラス名にSuperをつける
class SuperDog{                      //すごいいぬクラス
    var name = ""               //プロパティ「名前」
    var type = ""               //プロパティ「種類」
    var birth = ""              //プロパティ「誕生日」
    
    func bark() -> String{     //メソッド「吠える」
        return "きゃんきゃん"
    }
}

//継承クラス準備（サブクラス）
//04/25 レビュー指摘修正 -> スーパークラスとなるクラス名にSuperをつける
class Dog: SuperDog {
    override func bark() -> String {
        return "わんわん"
    }
}

/********************************/


/*Dictionaly*/
//valueにkeyをつけられる

print("/////Ditcionaly/////\n")

//Dictionaly準備
//04/25 レビュー指摘修正 -> [String:String]の重複指定の解消
//var whatDog: [String:String] = [String:String]()
var whatDog = [String:String]()
whatDog["きゃんきゃん"] = "すごいいぬ"
whatDog["わんわん"] = "いぬ"

//すごいいぬクラス
var Ins_dog = SuperDog()
Ins_dog.bark()
var who = Ins_dog.bark()
print(who)
var answer = whatDog[who]
if let answer = answer{
    print("きゃんきゃんと鳴いたのは：" + answer)
}

//いぬクラス
var Ins_super = Dog()
Ins_super.bark()
var who2 = Ins_super.bark()
print(who2)
var answer2 = whatDog[who2]
if let answer2 = answer2{
    print("わんわんと鳴いたのは：" + answer2)
}


/*array*/
//valueを呼び出すのに添字を使う（任意の名前はつけられない）

print("\n/////Array/////\n")

//Array要素準備
let strs: [String] = ["ねこ","たぬき","きつね","にわとり","くま","いぬ","おおかみ","すごいいぬ","きりん","こあら"]


if let target = answer2 {
    print (target + "はどこにいる？")
    
    //要素内に存在しているかどうか
    //let here = strs.contains(target)      //trueが返される
    
    //要素内の何番目に存在しているか
    let address = strs.index(of: target)    //indexOfではエラーとなる
    if let address = address{
        
        //Int -> Stringにキャスト
        let house:String = String(address)
        print(target + "は、strsの" + house + "番要素にいる。")
    }
    
}

