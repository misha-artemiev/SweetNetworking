import Subprocess

class CommandExecutor {
    private static func runCommand(executableName: String, argumentsArray: [String] = []) async throws -> String {
        let executable = Executable.name(executableName)
        let arguments = Arguments.init(argumentsArray)
        let result = try await run(executable, arguments: arguments, output: .string(limit: 100))
        return result.standardOutput as String? ?? ""
    }
}
