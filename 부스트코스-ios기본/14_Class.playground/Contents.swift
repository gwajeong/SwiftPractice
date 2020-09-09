// 2020.09.08 Tue
// swift 문법 공부
// 부스트코스 ios 프로그래밍을 위한 스위프트 기초
// 14. 클래스

import UIKit

// 프로퍼티 및 메서드 구현
class Sample {
    var mutablaProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드
    func instanceMethod(){
        print("instance method")
    }
    
    // 타입 메서드 - 2가지
    // 상속시 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 상속시 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}

// 클래스 사용

var mutableReference: Sample = Sample()

mutableReference.mutablaProperty = 200
// mutableReference.immutableProperty = 200
// 오류 발생 (불변 프로퍼티이기 때문에)

let immutableReference: Sample = Sample()

immutableReference.mutablaProperty = 200
//immutableReference.immutableProperty = 200
// 구조체와 다른점 !!! let으로 생성하여도 가변 프로퍼티는 수정이 가능하다.

// immutableReference = mutableReference
// 참조정보를 변경할 수는 없다.

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

//mutableReference.typeProperty = 400
//mutableReference.typeMethod()
// 인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없다



// 학생 클래스 만들어 보기
class Student {
    // 가변 프로퍼티
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다
    var `class`: String = "Swift"
    
    // 타입 메서드
    class func selfIntroduce() {
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

// 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 yagom입니다

// 인스턴스 생성
let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 jina입니다
