//
//  Style.swift
//
//
//  Created by Masashi Aso on 2020/10/24.
//

public struct Style {
  public var foregroundColor: Color?
  public var backgroundColor: Color?
  public var isBoldfaced: Bool
  public var isDimmed: Bool
  public var isItalicized: Bool
  public var isUnderlined: Bool
  public var isBlinked: Bool
  public var isReversed: Bool
  public var isHidden: Bool
  public var isStrikethrough: Bool
  
  public init(
    foreground: Color? = nil,
    background: Color? = nil,
    bold: Bool = false,
    dim: Bool = false,
    italic: Bool = false,
    underline: Bool = false,
    blink: Bool = false,
    reverse: Bool = false,
    hide: Bool = false,
    strikethrough: Bool = false
  ) {
    self.foregroundColor = foreground
    self.backgroundColor = background
    self.isBoldfaced = bold
    self.isDimmed = dim
    self.isItalicized = italic
    self.isUnderlined = underline
    self.isBlinked = blink
    self.isReversed = reverse
    self.isHidden = hide
    self.isStrikethrough = strikethrough
  }
}

// MARK: - Modifiers
extension Style: StyleModifier {
  
  public typealias Modified = Style
  
  @inline(__always) @inlinable
  public func bold(_ isOn: Bool = true) -> Modified {
    var new = self
    new.isBoldfaced = isOn
    return new
  }
  
  @inline(__always) @inlinable
  public func dim(_ isOn: Bool = true) -> Modified {
    var new = self
    new.isDimmed = isOn
    return new
  }
  
  @inline(__always) @inlinable
  public func italic(_ isOn: Bool = true) -> Modified {
    var new = self
    new.isItalicized = isOn
    return new
  }
  
  @inline(__always) @inlinable
  public func underline(_ isOn: Bool = true) -> Modified {
    var new = self
    new.isUnderlined = isOn
    return new
  }
  
  @inline(__always) @inlinable
  public func blink(_ isOn: Bool = true) -> Modified {
    var new = self
    new.isBlinked = isOn
    return new
  }
  
  @inline(__always) @inlinable
  public func reverse(_ isOn: Bool = true) -> Modified {
    var new = self
    new.isReversed = isOn
    return new
  }
  
  @inline(__always) @inlinable
  public func hide(_ isOn: Bool = true) -> Modified {
    var new = self
    new.isHidden = isOn
    return new
  }
  
  @inline(__always) @inlinable
  public func strikethrough(_ isOn: Bool = true) -> Modified {
    var new = self
    new.isStrikethrough = isOn
    return new
  }
  
  @inline(__always) @inlinable
  public func foreground(_ color: Color?) -> Modified {
    var new = self
    new.foregroundColor = color
    return new
  }
  
  @inline(__always) @inlinable
  public func background(_ color: Color?) -> Modified {
    var new = self
    new.backgroundColor = color
    return new
  }
}

// MARK: - Generate Code
public extension Style {
  func prefix() -> String {
    if isPlain { return "" }
    var text = "\u{1b}["
    
    if isBoldfaced     { text += "1;" }
    if isDimmed        { text += "2;" }
    if isItalicized    { text += "3;" }
    if isUnderlined    { text += "4;" }
    if isBlinked       { text += "5;" }
    if isReversed      { text += "7;" }
    if isHidden        { text += "8;" }
    if isStrikethrough { text += "9;" }
    
    if let fb = foregroundColor {
      text += fb.foregroundCode()
    }
    if let bg = backgroundColor {
      text += bg.backgroundCode()
    }
    
    // remove last ';'
    text.removeLast()
    text += "m"
    return text
  }
  
  func infix(next: Style) -> String {
    if self == next { return "" }
    if next.isPlain { return "\u{1b}[0m" }
    var text = "\u{1b}["
    
    func modifyCode(
      for keyPath: KeyPath<Style, Bool>, toOn: UInt8, toOff: UInt8
    ) {
      switch (self[keyPath: keyPath], next[keyPath: keyPath]) {
      case (true, true), (false, false): break
      case (false, true): text += "\(toOn);"
      case (true, false): text += "\(toOff);"
      }
    }
    
    // bold and dim's disable code are same, 22.
    if self.isBoldfaced || self.isDimmed { text += "22;" }
    if next.isBoldfaced { text += "1;" }
    if next.isDimmed    { text += "2;" }
    modifyCode(for: \.isItalicized,    toOn: 3, toOff: 23)
    modifyCode(for: \.isUnderlined,    toOn: 4, toOff: 24)
    modifyCode(for: \.isBlinked,       toOn: 5, toOff: 25)
    modifyCode(for: \.isReversed,      toOn: 7, toOff: 27)
    modifyCode(for: \.isHidden,        toOn: 8, toOff: 28)
    modifyCode(for: \.isStrikethrough, toOn: 9, toOff: 29)
    
    switch (self.foregroundColor, next.foregroundColor) {
    case (.none, .none): break
    case (.some(let a), .some(let b)) where a == b: break
    case (_, .some(let new)): text += new.foregroundCode()
    case (.some(_), .none):   text += "39;"
    }
    switch (self.backgroundColor, next.backgroundColor) {
    case (.none, .none): break
    case (.some(let a), .some(let b)) where a == b: break
    case (_, .some(let new)): text += new.backgroundCode()
    case (.some(_), .none):   text += "49;"
    }
    
    // remove last ';'
    text.removeLast()
    text += "m"
    return text
  }
  
  func suffix() -> String {
    isPlain ? "" : "\u{1b}[0m"
  }
}

// MARK: Other
extension Style: Equatable, Hashable {
  var isPlain: Bool {
    self == Style()
  }
}
