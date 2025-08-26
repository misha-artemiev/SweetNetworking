import Subprocess

struct Miscellaneous {
    enum terminalStyle {
        static let error: String = "\u{001B}[31m"
        static let warning: String = "\u{001B}[33m"
    }
}
