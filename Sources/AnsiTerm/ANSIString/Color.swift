//
//  Color.swift
//
//
//  Created by Masashi Aso on 2020/10/24.
//

public enum Color {
  /// foreground code: 30, background code: 40
  case black
  /// foreground code: 31, background code: 41
  case red
  /// foreground code: 32, background code: 42
  case green
  /// foreground code: 33, background code: 43
  case yellow
  /// foreground code: 34, background code: 44
  case blue
  /// foreground code: 35, background code: 45
  case purple
  /// foreground code: 36, background code: 46
  case cyan
  /// foreground code: 37, background code: 47
  case white
  
  /// 256 terminal color
  ///
  /// - 0 ~ 7:
  /// - 8 ~ 15:
  /// - 16 ~ 231:
  /// - 232 ~ 255:
  ///
  /// foreground code: 38;5;n, background code: 48;5;n
  case fixed(UInt8)
  
  /// 24-bit RGB color
  ///
  /// foreground code: 38;2;r;g;b, background code: 48;2;r;g;b
  case rgb(UInt8, UInt8, UInt8)
}

// MARK: - Modifier
extension Color: StyleModifier {
  public typealias Modified = Style
  
  @inline(__always) @inlinable
  public func bold(_ isOn: Bool = true) -> Style {
    Style(foreground: self, bold: isOn)
  }
  
  @inline(__always) @inlinable
  public func dim(_ isOn: Bool = true) -> Style {
    Style(foreground: self, dim: isOn)
  }
  
  @inline(__always) @inlinable
  public func italic(_ isOn: Bool = true) -> Style {
    Style(foreground: self, italic: isOn)
  }
  
  @inline(__always) @inlinable
  public func underline(_ isOn: Bool = true) -> Style {
    Style(foreground: self, underline: isOn)
  }
  
  @inline(__always) @inlinable
  public func blink(_ isOn: Bool = true) -> Style {
    Style(foreground: self, blink: isOn)
  }
  
  @inline(__always) @inlinable
  public func reverse(_ isOn: Bool = true) -> Style {
    Style(foreground: self, reverse: isOn)
  }
  
  @inline(__always) @inlinable
  public func hide(_ isOn: Bool = true) -> Style {
    Style(foreground: self, hide: isOn)
  }
  
  @inline(__always) @inlinable
  public func strikethrough(_ isOn: Bool = true) -> Style {
    Style(foreground: self, strikethrough: isOn)
  }
  
  @inline(__always) @inlinable
  public func foreground(_ color: Color?) -> Style {
    Style(foreground: color)
  }
  
  @inline(__always) @inlinable
  public func background(_ color: Color?) -> Style {
    Style(foreground: self, background: color)
  }
}

// MARK: - Generate a Code
internal extension Color {
  func foregroundCode() -> String {
    switch self {
    case .black:  return "30;"
    case .red:    return "31;"
    case .green:  return "32;"
    case .yellow: return "33;"
    case .blue:   return "34;"
    case .purple: return "35;"
    case .cyan:   return "36;"
    case .white:  return "37;"
    case .fixed(let value):
      return "38;5;\(value);"
    case .rgb(let r, let g, let b):
      return "38;2;\(r);\(g);\(b);"
    }
  }
  
  func backgroundCode() -> String {
    switch self {
    case .black:  return "40;"
    case .red:    return "41;"
    case .green:  return "42;"
    case .yellow: return "43;"
    case .blue:   return "44;"
    case .purple: return "45;"
    case .cyan:   return "46;"
    case .white:  return "47;"
    case .fixed(let value):
      return "48;5;\(value);"
    case .rgb(let r, let g, let b):
      return "48;2;\(r);\(g);\(b);"
    }
  }
}

// MARK: - Other
extension Color: Equatable, Hashable {}
