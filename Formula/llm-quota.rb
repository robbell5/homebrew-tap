class LlmQuota < Formula
  desc "Terminal UI for local Claude Code and Codex quota windows"
  homepage "https://github.com/robbell5/llm-quota"
  head "https://github.com/robbell5/llm-quota.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"llm-quota", "./cmd/llm-quota"
  end

  test do
    output = shell_output("#{bin}/llm-quota --definitely-unknown", 2)
    assert_match "llm-quota: unknown argument: --definitely-unknown", output
  end
end
