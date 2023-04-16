import Foundation

final class ReverseString {

    static func main() {
        
        // Create the list that will hold the input.
        var inputList = [String]()
        
        do {
            // Create the input file.
            let input = try String(contentsOfFile: "input.txt")
            
            // Create the output file.
            let output = try FileHandle(forWritingTo: URL(fileURLWithPath: "output.txt"))
            
            // Read the input file.
            input.enumerateLines { line, _ in
                // Add the next line.
                inputList.append(line)
            }
            
            // This loop sends each line to the function.
            for str in inputList {
                // Function call
                let reversed = reverse(str: str)
                // Print to the file.
                let data = (reversed + "\n").data(using: .utf8)!
                output.write(data)
            }
            
            // Close the writer
            output.closeFile()
            
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
    }

    static func reverse(str: String) -> String {
        
        // When str is empty return it.
        if str.isEmpty {
            return str
        } else {
            // Call the function again without the first character.
            let index = str.index(after: str.startIndex)
            return reverse(str: String(str[index...])) + String(str[str.startIndex])
        }
    }
}

// Entry point
ReverseString.main()