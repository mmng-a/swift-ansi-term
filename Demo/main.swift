import AnsiTerm
import Foundation

// like object oriented programming
let style = Style(foreground: .cyan, bold: true, blink: true)
let cyanText =  ANSIString("cyan, bold, blink", style: style)
print(cyanText)

let first  = "first".foreground(.blue)
let second = "second".style(Style(background: .fixed(52)))
let third  = "third".style(Style(foreground: .red, bold: true))
let strings: ANSIStrings = [first, second, third]
print(strings)

sleep(2)
Cursor.move(up: 2)
Cursor.move(forward: 6)

// like functional programming
let over = "over,"
  .foreground(.black)
  .background(.purple)
  .blink()
print(over)

sleep(2)
Cursor.move(forward: 10)
Console.clearLineBeforeCursor()
print() // print '\n'
