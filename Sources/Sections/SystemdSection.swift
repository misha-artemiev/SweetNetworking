import ArgumentParser

extension SweetNetworking {
    struct Systemd: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "systemd",
            abstract: "Systemd integration",
            subcommands: [
                Status.self,
                Install.self,
                Uninstall.self,
            ],
        )

        mutating func validate() throws {
            try isSudo.validation()    
        }
    }
}

extension SweetNetworking.Systemd {
    struct Install: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "install",
            abstract: "Install into systemd",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking.Systemd {
    struct Uninstall: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "uninstall",
            abstract: "Uninstall from systemd",
        )

        mutating func run() throws {
        }
    }
}

extension SweetNetworking.Systemd {
    struct Status: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "status",
            abstract: "Status of systemd",
        )

        mutating func run() throws {
        }
    }
}
