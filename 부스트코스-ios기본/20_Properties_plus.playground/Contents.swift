// 2020.09.09 Wed
// swift 문법 공부
// 부스트코스 ios 프로그래밍을 위한 스위프트 기초
// 20. 프로퍼티_감시자


import UIKit

// 프로퍼티 감시자
/*
 프로퍼티 감시자를 사용하면 프로퍼티의 값이 변경될 때 원하는 동작을 수행할 수 있습니다.
 값이 변경되기 직전에 willSet블럭이, 값이 변경된 직후에 didSet블럭이 호출됩니다.
 둘 중 필요한 하나만 구현해 주어도 무관합니다.
 변경되려는 값이 기존 값과 똑같더라도 프로퍼티 감시자는 항상 동작합니다.
 willSet 블럭에서는 암시적 매개변수 newValue를, didSet 블럭에서는 oldValue를 사용할 수 있습니다.
 프로퍼티 감시자는 연산 프로퍼티에는 사용할 수 없습니다.
 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등의 지역/전역 변수에 모두 사용 가능합니다.
 */

// 정의 및 사용

struct Money {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }

    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }

    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없습니다
        willSet {
            
        }
         */
    }
}

var moneyInMyPocket: Money = Money()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket.currencyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다

// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다

print(moneyInMyPocket.won)
// 11500.0


// 책 예제에 나와있는 상속받은 연산 프로퍼티의 프로퍼티 감시자 구현
class Account {
    var credit: Int = 0 { //저장 프로퍼티
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
    
    var dollarValue: Double { //연산 프로퍼티
        get {
            return Double(credit) / 1000.0
        }
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()
// 잔액이 0원에서 1000원으로 변경될 예정입니다.
myAccount.credit = 1000
// 잔액이 0원에서 1000원으로 변경되었습니다.

// 잔액이 1.0달러에서 2.0달러로 변경될 예정입니다.
// 잔액이 1000원에서 2000원으로 변경될 예정입니다.
// 잔액이 1000원에서 2000원으로 변경되었습니다.

myAccount.dollarValue = 2 // 잔액을 2.0달러로 변경 중입니다.
// 잔액이 1.0달러에서 2.0달러로 변경되었습니다.
