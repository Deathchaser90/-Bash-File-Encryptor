# 🔐 Bash File Encryptor

A simple yet powerful Bash script to encrypt and decrypt files using OpenSSL, with SHA-256 integrity checks and activity logging. Built for educational and practical purposes in cybersecurity learning.

---

## ✨ Features

- 🔒 Symmetric encryption using:
  - AES-256-CBC
  - Blowfish
  - DES
  - TripleDES (DES3)
- 🔓 Decryption with integrity verification (via SHA-256 hash)
- 🧾 Automatic logging of encryption actions (`Logs.txt`)
- 🧮 Print SHA-256 hash of any file
- 📁 Directory placeholder added for future folder encryption support

---

## 📦 How to Use

1. **Clone the repo**
   ```bash
   pkg update && pkg upgrade -y
   pkg install git openssh 
   git clone https://github.com/YOUR-USERNAME/bash-encryptor.git
   cd bash-encryptor

2. **Give execution permissions and Execute**
  ```bash
  chmod +x bash-encryptor.sh
  ./bash bash-encryptor.sh
```


##Requirements

Bash
OpenSSL installed (openssl)
Linux / Termux / macOS or any bash-compatible shell

---

🧪 Example Output

Choose an Option:
1. Encrypt a file
2. Decrypt a file
3. Print SHA-256 Hash
4. Encrypt a full directory

Enter choice (1-4): 1
Enter Filename to Encrypt: secret.txt
Enter output filename: secret.enc
[+] Encryption successful!
[+] Hash logged in Logs.txt

---

🚧 To Do
 Add full directory encryption support (tar + openssl)
 Optional password masking
 Interactive hash comparison tool
 Add GPG support

 
🙋‍♂️ Author
@Lakshay — aspiring cybersecurity learner building hands-on tools for real-world application.
This script is my way of learning encryption, scripting, and sharing it with others.

---

⚠️ Disclaimer
This is for educational purposes only. Not meant for military-grade or enterprise encryption. Always use vetted tools in production.
