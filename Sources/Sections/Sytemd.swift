import ArgumentParser

extension SweetNetworking {
    struct Systemd: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "systemd",
            shouldDisplay: true,
        )

        func validate() throws {
            try IsPrivileged.validate()
        }
    }
}
