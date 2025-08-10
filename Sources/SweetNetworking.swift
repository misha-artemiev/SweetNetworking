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
            Show.self,
            Draft.self,
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

extension SweetNetworking {
    struct Show: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "show",
            abstract: "Show current configuration",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking {
    struct Draft: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "draft",
            abstract: "Draft configuration",
            subcommands: [
                Show.self,
                Apply.self,
                Discard.self,
            ],
        )
    }
}

extension SweetNetworking.Draft {
    struct Show: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "show",
            abstract: "Show draft configuration",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking.Draft {
    struct Apply: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "apply",
            abstract: "Apply draft configuration",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking.Draft {
    struct Discard: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "discard",
            abstract: "Discard draft configuration",
        )

        mutating func run() throws {
        }
    }
}
