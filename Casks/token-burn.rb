cask "token-burn" do
  version "4.3.1"
  sha256 "7e66c3258a69d726cb6f6435fc39b7eb43d72d77569277fe65fe9c498ede4b6e"

  url "https://github.com/multi-turn-inc/ai-usage-meter/releases/download/v#{version}/AIUsageMeter-#{version}.dmg"
  name "Token Burn"
  desc "Menu bar monitor for Claude Code, Codex, and Gemini usage limits"
  homepage "https://github.com/multi-turn-inc/ai-usage-meter"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Token Burn.app"

  uninstall launchctl: "com.tokenburn.agent"

  zap trash: [
    "~/Library/Application Support/TokenBurn",
    "~/Library/LaunchAgents/com.tokenburn.agent.plist",
    "~/Library/Preferences/com.aiusagemeter.plist",
  ]
end
