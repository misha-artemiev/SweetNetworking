import Subprocess

struct Runner {
    static func run(_ configuration: Subprocess.Configuration) async throws -> CollectedResult<StringOutput<UTF8>, StringOutput<UTF8>> {
        return try await Subprocess.run(configuration, output: .string(limit: 1000), error: .string(limit: 1000))
    }

    static func runString(_ configuration: Subprocess.Configuration) async throws -> String? {
        return try await Runner.run(configuration).standardOutput
    }

    struct NetworkNamespace {
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

        static func move() {
        
        }
    }

    struct VirtualEthernet {
        enum virtualEthernetPair {
            case start
            case end
        }

        static func create(startName: String, endName: String, startNS: String, endNS: String) async {
            let configuration = Subprocess.Configuration(
                executable: .name("ip"),
                arguments: Arguments([
                    "link", 
                    "add", 
                    startName, 
                    "netns", 
                    startNS, 
                    "type", 
                    "veth", 
                    "peer", 
                    "name", 
                    endName, 
                    "netns", 
                    endNS
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
