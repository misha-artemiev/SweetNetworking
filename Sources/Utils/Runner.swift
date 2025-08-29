import Subprocess

struct Runner {
    static func run(_ configuration: Subprocess.Configuration) async throws -> CollectedResult<StringOutput<UTF8>, StringOutput<UTF8>> {
        return try await Subprocess.run(configuration, output: .string(limit: 1000), error: .string(limit: 1000))
    }

    static func runString(_ configuration: Subprocess.Configuration) async throws -> String? {
        return try await Runner.run(configuration).standardOutput
    }

    struct NetworkNamespace {
        enum State {
            case up
            case down
        }

        static func create(name: String) async {
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "netns",
                    "add",
                    name
                ])
            )
            do {
                _ = try await Runner.run(configuration)
            } catch {}
        }

        static func remove(name: String) async {
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "netns",
                    "delete",
                    name
                ])
            )
            do {
                _ = try await Runner.run(configuration)
            } catch {}
        }

        static func list() async -> String {
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "netns",
                    "list"
                ])
            )
            do {
                return try await Runner.runString(configuration) ?? ""
            } catch { return "" }
        }

        static func allow(user: String, nameNS: String) async {
            let configuration = Subprocess.Configuration(
                executable: .name("chown"),
                arguments: Arguments([
                    "\(user):\(user)",
                    "/var/run/netns/\(nameNS)"
                ])
            )
            do {
                _ = try await Runner.run(configuration)
            } catch {}
        }

        static func state(nameNS: String, state: NetworkNamespace.State) async {
            var loState: String
            switch state {
                case .up:
                    loState = "up"
                case .down:
                    loState = "down"
            }
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "-n \(nameNS)",
                    "link",
                    "set",
                    "lo",
                    loState
                ])
            )
            do {
                _ = try await Runner.run(configuration)
            } catch {}
        }
    }

    struct VirtualEthernetPair {
        enum State {
            case up
            case down
        }

        static func create(tailName: String, tailPeerName: String) async {
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "link", 
                    "add", 
                    tailName, 
                    "type", 
                    "veth", 
                    "peer", 
                    "name", 
                    tailPeerName, 
                ])
            )
            do {
                _ = try await Runner.run(configuration)
            } catch {}

        }

        static func remove() {

        }

        static func list() {

        }

        static func state(tailName: String, tailNS: String, state: VirtualEthernetPair.State) async {
            var tailState: String
            switch state {
                case .up:
                    tailState = "up"
                case .down:
                    tailState = "down"
            }
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "-n \(tailNS)",
                    "link",
                    "set",
                    tailName,
                    tailState
                ])
            )
            do {
                _ = try await Runner.run(configuration)
            } catch {}
        }

        static func setNS(tailName: String, tailNS: String) async {
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "link",
                    tailName,
                    "netns",
                    tailNS
                ])
            )
            do {
                _ = try await Runner.run(configuration)
            } catch {}
        }
    }

    struct Bridge {
        static func create(name: String) async {
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "link",
                    "add",
                    name,
                    "type",
                    "bridge"
                ])
            )
            do {
                _ = try await Runner.run(configuration)
            } catch {}
        }

        static func remove() {

        }

        static func list() {

        }
    }
}
