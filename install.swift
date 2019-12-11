import Foundation

let templateName = "VIPER.xctemplate"
let destinationRelativePath = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"

func moveTemplate(){
    let fileManager = FileManager.default
    let destinationPath = bash(command: "xcode-select", arguments: ["--print-path"]).appending(destinationRelativePath)
    do {
        if !fileManager.fileExists(atPath:"\(destinationPath)/\(templateName)"){
            try fileManager.copyItem(atPath: templateName, toPath: "\(destinationPath)/\(templateName)")
            print("Template successfully installed 🎉.")
        } else {
            print("file exist")
            try _ = fileManager.replaceItemAt(URL(fileURLWithPath:"\(destinationPath)/\(templateName)"), withItemAt: URL(fileURLWithPath:templateName))
            print("Template already exists. It has been replaced 🎉.")
        }
    }
    catch let error as NSError {
        print("Something went wrong : \(error.localizedFailureReason!)")
    }
}

func shell(launchPath: String, arguments: [String]) -> String
{
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.count > 0 {
        // remove newline character.
        let lastIndex = output.index(before: output.endIndex)
        return String(output[output.startIndex ..< lastIndex])
    }
    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

moveTemplate()
