import ArgumentParser

extension SweetNetworking {
    struct Draft: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "draft",
            shouldDisplay: true,
        )
    }
}
