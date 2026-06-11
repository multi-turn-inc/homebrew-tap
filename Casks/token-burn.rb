cask "token-burn" do
  version "4.3.2"
  sha256 "bec94b34853e114f3fa0186c5e0cf522ac36eaea1c36560a46727600c3eed10b"

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
