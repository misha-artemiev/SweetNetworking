import ArgumentParser

@main
struct SweetNetworking: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sweetnet",
        abstract: "Sweet linux networking configuration",
        version: "1.0.0",
        subcommands: [
            Systemd.self,
            Current.self,
            Draft.self,
        ],
    )
}
