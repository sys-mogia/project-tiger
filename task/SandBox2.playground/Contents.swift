//クラス準備
class Dog{                      //いぬクラス
    var name = ""               //プロパティ「名前」
    var type = ""               //プロパティ「種類」
    var birth = ""              //プロパティ「誕生日」
    
    func bark() -> String{     //メソッド「吠える」
        return "わんわん"
    }
}

//継承クラス準備
class SuperDog: Dog {
    override func bark() -> String {
        return "きゃんきゃん"
    }
}

/********************************/


/*Dictionaly*/
//valueにkeyをつけられる

print("/////Ditcionaly/////\n")

//Dictionaly準備
var whatDog: [String:String] = [String:String]()
whatDog["きゃんきゃん"] = "すごいいぬ"
whatDog["わんわん"] = "いぬ"

//いぬクラス
var Ins_dog = Dog()
Ins_dog.bark()
var who = Ins_dog.bark()
print(who)
var answer = whatDog[who]
if let answer = answer{
    print("わんわんと鳴いたのは：" + answer)
}

//すごいいぬクラス
var Ins_super = SuperDog()
Ins_super.bark()
var who2 = Ins_super.bark()
print(who2)
var answer2 = whatDog[who2]
if let answer2 = answer2{
    print("きゃんきゃんと鳴いたのは：" + answer2)
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

