import ArgumentParser

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

extension SweetNetworking.Draft {
    struct Import: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "import",
            abstract: "Import current configuration",
        )

        func validate() throws {
            try isSudo.validation()
        }

        mutating func run() throws {
        }
    }
}
