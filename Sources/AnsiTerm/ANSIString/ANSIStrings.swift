//
//  ANSIStrings.swift
//
//
//  Created by Masashi Aso on 2020/10/24.
//

public struct ANSIStrings {
  private var strings: [ANSIString]
  
  public init(_ ansiStrings: [ANSIString]) {
    self.strings = ansiStrings
  }
  
  public init(_ ansiStrings: ANSIString...) {
    self.strings = ansiStrings
  }
}

extension ANSIStrings: CustomStringConvertible {
  public var description: String {
    if strings.count == 0 { return "" }
    if strings.count == 1 { return strings.first!.description }
    
    let prefix = strings.first!.style.prefix()
    let zipped = zip(strings[..<strings.endIndex], strings[strings.startIndex.advanced(by: 1)...])
    let inner = zipped.flatMap { $0.string + $0.style.infix(next: $1.style) }
    let postfix = strings.last!.string + strings.last!.style.suffix()
    return prefix + inner + postfix
  }
}

// MARK: - Collection
extension ANSIStrings: Sequence {
  public typealias Element = ANSIString
  public typealias Iterator = IndexingIterator<Array<ANSIString>>
  
  public func makeIterator() -> Iterator {
    strings.makeIterator()
  }
}

extension ANSIStrings: Collection {
  public typealias Index = Int
  
  public var count: Int { strings.count }
  
  public var startIndex: Int { strings.startIndex }
  public var endIndex: Int { strings.endIndex }
  
  public func index(after i: Int) -> Int {
    strings.index(after: i)
  }
  
  public subscript(position: Int) -> ANSIString {
    strings[position]
  }
}

extension ANSIStrings: BidirectionalCollection {
  public typealias SubSequence = ANSIStrings
  
  public func index(before i: Int) -> Int {
    strings.index(before: i)
  }
}

extension ANSIStrings: RandomAccessCollection {}

extension ANSIStrings: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    self = .init(elements)
  }
}
