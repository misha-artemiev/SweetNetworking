import ArgumentParser

@main
struct SweetNetworking: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sweetnet",
        version: "0.1.0",
        shouldDisplay: true,
        subcommands: [
            Live.self,
            Draft.self,
            Systemd.self,
        ],
    )
}
