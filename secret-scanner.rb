# Secret Scanner - Clipboard Security Tool
# Created by: sanFransisco
# Contact: https://linkedin.com/in/your-profile
# Price: $1

class SecretScanner < Formula
  desc "Clipboard monitoring tool that detects and sanitizes leaked secrets"
  homepage "https://github.com/sanFransisco/homebrew-tap"
  url "https://github.com/sanFransisco/homebrew-tap/releases/download/v1.0.4/secret-scanner-v1.0.4.tar.gz"
  version "1.0.4"
  sha256 "8515ad78f624af9e72208a2c109ecfe5a086732a8d4eb2745d24fe01b15e8f05"
  license "Commercial"

  depends_on "node"

  def install
    # Install all files to libexec
    libexec.install Dir["*"]
    
    # Install npm dependencies
    system "npm", "install", "--prefix", libexec, "--only=production"
    
    # Create symlink for the main executable
    bin.install_symlink libexec/"decrypt-runner.js" => "secret-scanner"
    
    # Make sure it's executable
    chmod 0755, libexec/"decrypt-runner.js"
  end

  def caveats
    <<~EOS
      🔐 Secret Scanner v1.0.4 - Clipboard Security Tool
      
      💰 Price: $1 per license
      📧 Contact: yalibar1121@gmail.com
      🔗 LinkedIn: https://linkedin.com/in/your-profile
      
      🚀 To get started:
      1. Purchase a license ($1)
      2. Contact yalibar1121@gmail.com for your license file
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
      • Email: yalibar1121@gmail.com
      • LinkedIn: https://linkedin.com/in/your-profile
      • GitHub: https://github.com/sanFransisco/homebrew-tap
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
