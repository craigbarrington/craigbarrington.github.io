import Foundation

let fileName = "example.txt"
let desktopPath = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
let fileURL = desktopPath.appendingPathComponent(fileName)

do {
  try "This is some text".write(to: fileURL, atomically: true, encoding: .utf8)
  print("File created at \(fileURL.path)")
} catch {
  print("Failed to create file")
  print("\(error)")
}

