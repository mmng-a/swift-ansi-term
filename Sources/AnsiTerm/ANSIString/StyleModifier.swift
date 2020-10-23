//
//  StyleModifier.swift
//
//
//  Created by Masashi Aso on 2020/10/24.
//

public protocol StyleModifier {
  associatedtype Modified
  
  func bold         (_ isOn: Bool) -> Modified
  func dim          (_ isOn: Bool) -> Modified
  func italic       (_ isOn: Bool) -> Modified
  func underline    (_ isOn: Bool) -> Modified
  func blink        (_ isOn: Bool) -> Modified
  func reverse      (_ isOn: Bool) -> Modified
  func hide         (_ isOn: Bool) -> Modified
  func strikethrough(_ isOn: Bool) -> Modified
  func foreground(_ color: Color?) -> Modified
  func background(_ color: Color?) -> Modified
}
