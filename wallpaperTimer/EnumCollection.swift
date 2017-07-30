// https://stackoverflow.com/questions/24007461/how-to-enumerate-an-enum-with-string-type

public protocol EnumCollection: Hashable {}

extension EnumCollection {

  public static func allValues() -> [Self] {
    let retVal = AnySequence { () -> AnyIterator<Self> in
      var raw = 0
      return AnyIterator {
        let current = withUnsafePointer(to: &raw) {
          $0.withMemoryRebound(to: Self.self, capacity: 1) { $0.pointee }
        }
        guard current.hashValue == raw else { return nil }
        raw += 1
        return current
      }
    }

    return [Self](retVal)
  }
}
