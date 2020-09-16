// 2020.09.13 Sun
// swift 문법 공부
// Bool을 Sort 해보자 !!!


import UIKit

struct BoolTest {
   let someBool: Bool
}
var arrayOfMyObjects = [
    BoolTest(someBool: true),
    BoolTest(someBool: true),
    BoolTest(someBool: false),
    BoolTest(someBool: true),
    BoolTest(someBool: false),
    BoolTest(someBool: false),
    BoolTest(someBool: true)
]

// 앞이 true 뒤가 false일 때 true 값이 나온다.
arrayOfMyObjects.sort { $0.someBool && !$1.someBool }

for i in arrayOfMyObjects {
    print(i.someBool)
}



