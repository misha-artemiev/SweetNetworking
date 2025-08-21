import ArgumentParser

extension SweetNetworking {
    struct Live: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "live",
            shouldDisplay: true,
        )

        func validate() throws {
            try IsPrivileged.validate()
        }
    }
}
