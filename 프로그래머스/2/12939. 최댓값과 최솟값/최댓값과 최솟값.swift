func solution(_ s:String) -> String {
    let numbers = s.split(separator: " ").map { Int($0)! }
    return "\(numbers.min()!) \(numbers.max()!)"
}