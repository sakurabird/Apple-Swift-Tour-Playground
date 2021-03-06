//: ## Generics
//:
//: Write a name inside angle brackets to make a generic function or type.
//:
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

//: You can make generic forms of functions and methods, as well as classes, enumerations, and structures.
//:
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//: Use `where` right before the body to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.
//:
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
anyCommonElements([1, 2, 3], [3])
//anyCommonElements(3, [3])//条件に合わないとエラー
//Playground execution failed:
//
//error: GuidedTour.playground:32:19: error: argument type 'Int' does not conform to expected type 'Sequence'
//anyCommonElements(3, [3])

//: - Experiment:
//: Modify the `anyCommonElements(_:_:)` function to make a function that returns an array of the elements that any two sequences have in common.
//:
//: Writing `<T: Equatable>` is the same as writing `<T> ... where T: Equatable`.
//:
// よくわからなかったのでhttps://stackoverflow.com/a/39528608を見た。すみません。
func commonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
  where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    var common: [T.Iterator.Element] = []

    for lhsItem in lhs {
      for rhsItem in rhs {
        if lhsItem == rhsItem {
          common.append(lhsItem)
        }
      }
    }
    return common
}
commonElements([1,2,3], [1,2,3])

//: [Previous](@previous)
