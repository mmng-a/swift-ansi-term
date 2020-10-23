//
//  ANSIString.swift
//
//
//  Created by Masashi Aso on 2020/10/24.
//

public struct ANSIString {
  public var style: Style
  public var string: String
  
  public init(_ string: String, style: Style) {
    self.string = string
    self.style = style
  }
  
  public init(_ string: String, color: Color) {
    self.init(string, style: Style(foreground: color))
  }
}

extension ANSIString: CustomStringConvertible {
  public var description: String {
    style.prefix() + string + style.suffix()
  }
}

// MARK: - Modifier
extension ANSIString: StyleModifier {
  public typealias Modified = ANSIString
  
  @inline(__always) @inlinable
  public func bold(_ isOn: Bool = true) -> ANSIString {
    var new = self
    new.style = self.style.bold(isOn)
    return new
  }
  
  @inline(__always) @inlinable
  public func dim(_ isOn: Bool = true) -> ANSIString {
    var new = self
    new.style = self.style.dim(isOn)
    return new
  }
  
  @inline(__always) @inlinable
  public func italic(_ isOn: Bool = true) -> ANSIString {
    var new = self
    new.style = self.style.italic(isOn)
    return new
  }
  
  @inline(__always) @inlinable
  public func underline(_ isOn: Bool = true) -> ANSIString {
    var new = self
    new.style = self.style.underline(isOn)
    return new
  }
  
  @inline(__always) @inlinable
  public func blink(_ isOn: Bool = true) -> ANSIString {
    var new = self
    new.style = self.style.blink(isOn)
    return new
  }
  
  @inline(__always) @inlinable
  public func reverse(_ isOn: Bool = true) -> ANSIString {
    var new = self
    new.style = self.style.reverse(isOn)
    return new
  }
  
  @inline(__always) @inlinable
  public func hide(_ isOn: Bool = true) -> ANSIString {
    var new = self
    new.style = self.style.hide(isOn)
    return new
  }
  
  @inline(__always) @inlinable
  public func strikethrough(_ isOn: Bool = true) -> ANSIString {
    var new = self
    new.style = self.style.strikethrough(isOn)
    return new
  }
  
  @inline(__always) @inlinable
  public func foreground(_ color: Color?) -> ANSIString {
    var new = self
    new.style = self.style.foreground(color)
    return new
  }
  
  @inline(__always) @inlinable
  public func background(_ color: Color?) -> ANSIString {
    var new = self
    new.style = self.style.background(color)
    return new
  }
}

// MARK: StringProtocol
extension ANSIString: ExpressibleByStringLiteral {
  public init(stringLiteral value: String) {
    self = .init(value, style: Style())
  }
}

// TODO: improve performance
// make `ANSICharacter` and `ANSISubstring`,
// implement ANSIString for StringProtocol.
//extension ANSIString: Sequence {
//  public typealias Element = ANSIString
//  public typealias Iterator = IndexingIterator<Array<ANSIString>>
//
//  public func makeIterator() -> Iterator {
//    string
//      .map { ANSIString(String($0), style: style) }
//      .makeIterator()
//  }
//}
