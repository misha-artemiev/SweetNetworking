import Foundation
import ArgumentParser

struct IsPrivileged {
    static func isPrivilegedEnvironment() -> Bool {
        guard ProcessInfo.processInfo.environment["SUDO_COMMAND"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_USER"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_UID"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_GID"] != nil else { return false }
        return true       
    }

    static func validate() throws {
        guard isPrivilegedEnvironment() else {
            throw ValidationError("this command must be executed privileged")
        }
        return
    }
}
