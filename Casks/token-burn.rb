cask "token-burn" do
  version "4.3.6"
  sha256 "c4a29eae6fe84366b0a896c393fcf68e5eaa7c7b631ee6c4fa9a4e62b4a15bcc"

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
