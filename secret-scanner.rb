# Secret Scanner - Clipboard Security Tool
# Created by: your-github-username
# Contact: https://linkedin.com/in/your-profile
# Price: $1

class SecretScanner < Formula
  desc "Clipboard monitoring tool that detects and sanitizes leaked secrets"
  homepage "https://github.com/sanFransisco/homebrew-tap"
  url "https://github.com/sanFransisco/homebrew-tap/releases/download/v1.0.0/secret-scanner-v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "aa8f1eed0711d910636e4368e47dfd5181e7af006b729f12af5783a40f98f6bb"
  license "Commercial"

  depends_on "node"

  def install
    # Install all files to libexec
    libexec.install Dir["*"]
    
    # Create symlink for the main executable
    bin.install_symlink libexec/"decrypt-runner.js" => "secret-scanner"
    
    # Make sure it's executable
    chmod 0755, libexec/"decrypt-runner.js"
  end

  def caveats
    <<~EOS
      🔐 Secret Scanner v1.0.0 - Clipboard Security Tool
      
      💰 Price: $1 per license
      📧 Contact: your-email@example.com
      🔗 LinkedIn: https://linkedin.com/in/your-profile
      
      🚀 To get started:
      1. Purchase a license ($1)
      2. Contact your-email@example.com for your license file
      3. Place license at: ~/.secret-scanner/license.json
      4. Run: secret-scanner
      
      📋 Features:
      • Real-time clipboard monitoring
      • Detects AWS, Azure, GCP secrets
      • Database connection strings
      • API keys and tokens
      • Automatic secret sanitization
      
      🔒 Security:
      • Offline license validation
      • Encrypted source code
      • RSA-2048 signatures
      • AES-256 encryption
      
      🛡️ Privacy:
      All processing happens locally. No data sent to external servers.
      
      📞 Support:
      • Email: your-email@example.com
      • LinkedIn: https://linkedin.com/in/your-profile
      • GitHub: https://github.com/your-github-username/secret-scanner
    EOS
  end

  test do
    # Test that the binary exists and is executable
    assert_predicate bin/"secret-scanner", :exist?
    assert_predicate bin/"secret-scanner", :executable?
    
    # Test that it shows license requirement
    output = shell_output("#{bin}/secret-scanner 2>&1", 1)
    assert_match "License validation failed", output
  end
end
