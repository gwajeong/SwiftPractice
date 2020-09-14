// 2020.09.14 Mon
// swift 문법 공부
// 부스트코스 ios 프로그래밍을 위한 스위프트 기초
// 21. 상속


import UIKit

// 스위프트의 상속 !!
//상속은 클래스, 프로토콜 등에서 가능합니다.
//열거형, 구조체는 상속이 불가능합니다.
//스위프트의 클래스는 단일상속으로, 다중상속을 지원하지 않습니다.
//이번 파트에서는 클래스의 상속에 대해서 알아봅니다.

/* class 이름: 상속받을 클래스 이름 {
    /* 구현부 */
}
 */


// 사용
//final 키워드를 사용하면 재정의(override)를 방지할 수 있습니다.
//static 키워드를 사용해 타입 메서드를 만들면 재정의가 불가능 합니다.
//class 키워드를 사용해 타입 메서드를 만들면 재정의가 가능합니다.
//class 앞에 final을 붙이면 static 키워드를 사용한것과 동일하게 동작합니다.
//override 키워드를 사용해 부모 클래스의 메서드를 재정의 할 수 있습니다.

// 기반 클래스 Person
class Person {
    var name: String = ""
    
    func selfIntroduce() {
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용하여 재정의를 방지할 수 있습니다
    final func sayHello() {
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    
    // 재정의 가능한 class 메서드라도
    // final 키워드를 사용하면 재정의 할 수 없습니다
    // 메서드 앞의 `static`과 `final class`는 똑같은 역할을 합니다
    final class func finalCalssMethod() {
        print("type method - final class")
    }
}

// Person을 상속받는 Student
class Student: Person {
    // var name: String = "" // 저장 프로퍼티 재정의 불가
    var major: String = ""
    
    override func selfIntroduce() { // 덮어씌워짐
        print("저는 \(name)이고, 전공은 \(major)입니다")
        super.selfIntroduce() // 이렇게하면 부모클래스의 selfIntroduce() 를 가져다가 쓰는 것
    }
    
    override class func classMethod() {
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 할 수 없습니다
//    override static func typeMethod() {    }
    
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없습니다
//    override func sayHello() {    }
//    override class func finalClassMethod() {    }

}


let yagom: Person = Person()
let hana: Student = Student()

yagom.name = "yagom"
//yagom.major = "" // 불가
hana.name = "hana"
hana.major = "Swift"

yagom.selfIntroduce()
// 저는 yagom입니다

hana.selfIntroduce()
// 저는 hana이고, 전공은 Swift입니다

Person.classMethod()
// type method - class

Person.typeMethod()
// type method - static

Person.finalCalssMethod()
// type method - final class


Student.classMethod()
// overriden type method - class

Student.typeMethod()
// type method - static

Student.finalCalssMethod()
// type method - final class
