import ArgumentParser

extension SweetNetworking {
    struct Current: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "current",
            abstract: "Current configuration",
            subcommands: [
                Show.self,
                Status.self,
                Activate.self,
                Deactivate.self,
            ],
        )

        mutating func validate() throws {
            try isSudo.validation()
        }
    }
}

extension SweetNetworking.Current {
    struct Show: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "show",
            abstract: "Show current configuration",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking.Current {
    struct Status: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "status",
            abstract: "Status of current configuration",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking.Current {
    struct Activate: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "activate",
            abstract: "Activate current configuration",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking.Current {
    struct Deactivate: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "deactivate",
            abstract: "Deactivate current configuration",
        )

        mutating func run() throws {
        }
    }
}
