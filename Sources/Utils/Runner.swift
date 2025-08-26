import Subprocess

struct Runner {
    static func run(executableName: String, argumentsArray: Array<String> = []) async throws -> CollectedResult<StringOutput<UTF8>, StringOutput<UTF8>> {
        let configuration = Subprocess.Configuration(
            executable: .name(executableName),
            arguments: Arguments.init(argumentsArray),
        )
        return try await Subprocess.run(configuration, output: .string(limit: 1000), error: .string(limit: 1000))
    }
}
