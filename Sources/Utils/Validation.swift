import Foundation
import ArgumentParser

struct Validation {
    static func isPrivilegedEnvironment() -> Bool {
        guard ProcessInfo.processInfo.environment["SUDO_COMMAND"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_USER"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_UID"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_GID"] != nil else { return false }
        return true       
    }

    static func privilegedValidate() throws {
        guard isPrivilegedEnvironment() else {
            throw ValidationError(Terminal.pretty("this command must be executed privileged", colour: .red))
        }
        return
    }
}
