import Foundation
import ArgumentParser

struct isSudo {
    static func checker() -> Bool {
        guard ProcessInfo.processInfo.environment["SUDO_COMMAND"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_USER"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_UID"] != nil else { return false }
        guard ProcessInfo.processInfo.environment["SUDO_GID"] != nil else { return false }
        return true
    }

    static func validation() throws {
        if !self.checker() {
            throw ValidationError("This command must be executed with sudo")
        }
    }
}
