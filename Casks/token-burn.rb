cask "token-burn" do
  version "4.3.3"
  sha256 "80fda19ad373abaee9eda2382132241ea4a97ca6ea5fb30ef2c93af8f9627dd1"

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
