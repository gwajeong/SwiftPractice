// 2020.09.08 Tue
// swift 문법 공부
// 부스트코스 ios 프로그래밍을 위한 스위프트 기초
// 13. 구조체


import UIKit

// 구조체 프로퍼티 및 메서드 구현
struct Sample {
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    //인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    //타입 메서드
    static func typeMethod() {
        print("type method")
    }
}

// 구조체 사용
// 가변 인스턴스 생성 ! (var)
var mutable: Sample = Sample()
mutable.mutableProperty = 200
//mutable.immutableProperty = 200
//오류가 생긴다 -> 불변 프로퍼티는 인스턴스 생성 후 수정 불가하기 때문

// 불변 인스턴스 생성 ! (let)
let immutable: Sample = Sample()

//immutable.mutableProperty = 200
//immutable.immutableProperty = 200
//둘 다 오류가 생긴다 -> 불변 인스턴스는 아무리 가변 프로퍼티라도 인스턴스 생성 후 수정 불가

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method


//mutable.typeProperty = 400
//mutable.typeMethod()
// 인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없다.


// 학생 구조체 만들어보기

struct Student {
    // 가변 프로퍼티
    var name: String = "unknown"
    
    var `class`:String = "Swift"
    //키워드도 `(option키 + ~) 로 묶어주면 이름으로 사용할 수 있습니다 (오 신기해)
    
    // 타입 메서드
    static func selfIntroduce() {
            print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항입니다
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }

}


// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다

// 가변 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 yagom입니다

// 불변 인스턴스 생성
let jina: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
//jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 unknown입니다

