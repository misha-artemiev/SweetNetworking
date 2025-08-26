import Subprocess

struct Terminal {
    enum Colours: String {
        case none = "\u{001B}[39m"
        case red = "\u{001B}[31m"
        case green = "\u{001B}[32m"
        case yellow = "\u{001B}[33m"
    }

    enum Style: String {
        case none = "\u{001B}[10m"
        case bold = "\u{001B}[1m"
        case underline = "\u{001B}[4m"
    }

    static func pretty(
        _ text: String, 
        colour: Terminal.Colours = .none, 
        style: Terminal.Style = .none,
    ) -> String{
        var output: String
        output = "\u{001B}[0m"
        output += style.rawValue
        output += colour.rawValue
        output += text
        output += "\u{001B}[0m"
        return output
    }
}
