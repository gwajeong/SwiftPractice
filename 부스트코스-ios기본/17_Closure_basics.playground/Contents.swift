// 2020.09.11 Wed
// swift 문법 공부
// 부스트코스 ios 프로그래밍을 위한 스위프트 기초
// 17. 클로저_기본

// 클로저?
//클로저는 실행가능한 코드 블럭입니다.
//함수와 다르게 이름정의는 필요하지는 않지만, 매개변수 전달과 반환 값이 존재 할 수 있다는 점이 동일합니다.
//함수는 이름이 있는 클로저입니다.
//일급객체로 전달인자, 변수, 상수 등에 저장 및 전달이 가능합니다.


// 클로저의 정의
/*
 { (매개변수 목록) -> 반환타입 in
    실행코드
 }
 */

// 클로저의 사용
var sum: (Int, Int) -> Int = {(a:Int, b:Int) in
    return a + b
}

var sumResult: Int = sum(1,2) // 클로저 이용
print(sumResult) // 3

func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

//함수는 클로저의 일종이므로 sum 변수에는 당연히 함수도 할당할 수 있습니다.
sum = sumFunction(a:b:)
sumResult = sum(3,4) // 이건 함수가 호출되는 것 // 7
print(sumResult)


// 함수의 전달인자로서의 클로저
//클로저는 주로 함수의 전달인자로 많이 사용됩니다.
//함수 내부에서 원하는 코드블럭을 실행할 수 있습니다.

let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) in
    return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)

print(calculated) // 60

calculated = calculate(a: 50, b: 10, method: substract)

print(calculated) // 40

calculated = calculate(a: 50, b: 10, method: divide)

print(calculated) // 5

//따로 클로저를 상수/변수에 넣어 전달하지 않고,
//함수를 호출할 때 클로저를 작성하여 전달할 수도 있습니다.

calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left * right
})

print(calculated) // 500
