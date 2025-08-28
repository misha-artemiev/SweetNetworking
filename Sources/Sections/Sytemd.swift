import ArgumentParser

extension SweetNetworking {
    struct Systemd: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "systemd",
            shouldDisplay: true,
            subcommands: [
                SweetNetworking.Systemd.Install.self,
                SweetNetworking.Systemd.UnInstall.self,
                SweetNetworking.Systemd.Status.self,
            ],
        )

        func validate() throws {
            try Validation.privilegedValidate()
        }
    }
}

extension SweetNetworking.Systemd {
    struct Install: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "install",
            shouldDisplay: true,
        )
    }
}

extension SweetNetworking.Systemd {
    struct UnInstall: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "uninstall",
            shouldDisplay: true,
        )
    }
}

extension SweetNetworking.Systemd {
    struct Status: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "status",
            shouldDisplay: true,
        )
    }
}
