import Foundation

struct isPrivileged {
    static func isPrivilegedEnvironment() -> Bool {
        guard ProcessInfo.processInfo.environment["SUDO_COMMAND"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_USER"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_UID"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_GID"] != nil else { return false }
        return true       
    }
}
