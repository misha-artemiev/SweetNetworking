import ArgumentParser

@main
struct SweetNetworking: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sweetnet",
        abstract: "Sweet linux networking configuration",
        version: "1.0.0",
        subcommands: [
            Install.self,
            Uninstall.self,
        ],
    )
}

extension SweetNetworking {
    struct Install: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "install",
            abstract: "Install into systemd",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking {
    struct Uninstall: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "uninstall",
            abstract: "Uninstall from systemd",
        )

        mutating func run() throws {
        }
    }
}
