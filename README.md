# Swift Ansi Term

## Usage

### Color asn Style

#### Like Object Oriented Programming

```swift
import AnsiTerm

let style = Style(foreground: .red, bold: true, blink: true)
let hello = "Hello, AnsiTerm!"
print(hello)
```

#### Like Functional Programming

```swift
import AnsiTerm

let yellowBoldText = "You can use modifier"
	.foreground(.yellow)
	.bold()
print(yellowBoldText)
```

### Cursor and Console

```swift
import AnsiTerm
import Foundation

print("Hello", terminator: "")
sleep(2)
Cursor.move(backward: 5)
prnit("World")
sleep(2)
Console.clearLine()
```

## Example

`Demo/main.swift` is minimam example. I'll add more example.

## Install

To use the `AnsiTerm` in a SwiftPM project, add the following line to the dependencies in your `Package.swift` file:

```swift
.package(url: "https://github.com/masasam-shi/swift-ansi-term", from: "0.0.1"),
```

and include "AnsyTirm" as a dependency for your executable target:

```swift
.product(name: "AnsiTerm", package: "swift-ansi-term"),
```
