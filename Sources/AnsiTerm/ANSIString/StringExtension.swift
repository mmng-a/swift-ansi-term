//
//  StringExtension.swift
//
//
//  Created by Masashi Aso on 2020/10/24.
//

extension String {
  public func style(_ style: Style) -> ANSIString {
    ANSIString(self, style: style)
  }
}

extension String: StyleModifier {
  public typealias Modified = ANSIString
  
  @inline(__always) @inlinable
  public func bold(_ isOn: Bool = true) -> ANSIString {
    ANSIString(self, style: Style(bold: isOn))
  }
  
  @inline(__always) @inlinable
  public func dim(_ isOn: Bool = true) -> ANSIString {
    ANSIString(self, style: Style(dim: isOn))
  }
  
  @inline(__always) @inlinable
  public func italic(_ isOn: Bool = true) -> ANSIString {
    ANSIString(self, style: Style(italic: isOn))
  }
  
  @inline(__always) @inlinable
  public func underline(_ isOn: Bool = true) -> ANSIString {
    ANSIString(self, style: Style(underline: isOn))
  }
  
  @inline(__always) @inlinable
  public func blink(_ isOn: Bool = true) -> ANSIString {
    ANSIString(self, style: Style(blink: isOn))
  }
  
  @inline(__always) @inlinable
  public func reverse(_ isOn: Bool = true) -> ANSIString {
    ANSIString(self, style: Style(reverse: isOn))
  }
  
  @inline(__always) @inlinable
  public func hide(_ isOn: Bool = true) -> ANSIString {
    ANSIString(self, style: Style(hide: isOn))
  }
  
  @inline(__always) @inlinable
  public func strikethrough(_ isOn: Bool = true) -> ANSIString {
    ANSIString(self, style: Style(strikethrough: isOn))
  }
  
  @inline(__always) @inlinable
  public func foreground(_ color: Color?) -> ANSIString {
    ANSIString(self, style: Style(foreground: color))
  }
  
  @inline(__always) @inlinable
  public func background(_ color: Color?) -> ANSIString {
    ANSIString(self, style: Style(background: color))
  }
}
