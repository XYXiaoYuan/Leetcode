import Foundation

do {
    let s = _17_06_2出现的次数()
    let result = s.numberOf2sInRange(25)
    print("\(s) --- \(result)")

    assert(s.numberOf2sInRange(25) == 9)
    assert(s.numberOf2sInRange(2) == 1)
    assert(s.numberOf2sInRange(1) == 0)
}
