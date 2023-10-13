func solution(_ s:String) -> String {
    return s.map { String($0) }.sorted(by: >).joined()
}