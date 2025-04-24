#!/data/data/com.termux/files/usr/bin/bash

logfile="Logs.txt"
LogActivity() {
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] $1" >> "$logfile"
}

file_encryption() {
    echo -e "\nChoose Encryption Algorithm: "
    echo "1. AES-256-CBC"
    echo "2. Blowfish"
    echo "3. DES"
    echo "4. TripleDES (DES3)"
    read -p "Enter the choice (1-4): " choice

    case $choice in
        1) algo="aes-256-cbc" ;;
        2) algo="bf" ;;
        3) algo="des" ;;
        4) algo="des3" ;;
        *) echo " [!] Invalid Choice"; return ;;
    esac

    read -p "Enter filename to encrypt: " file
    read -p "Enter output filename: " encfile

    openssl enc -"$algo" -salt -in "$file" -out "$encfile"

    if [ $? -eq 0 ]; then
        echo "[^_^] Encryption successful!"
        hash=$(sha256sum "$encfile" | awk '{print $1}')
        echo "$encfile $hash" >> "$logfile"
        echo "[+] Hash logged in $logfile"
        LogActivity "Encrypted $file using $algo"
    else
        echo "[=_+] Encryption failed"
    fi
}

decryption() {
    read -p "Enter filename to decrypt: " encfile
    read -p "Enter output filename: " outfile
    echo "Choose encryption algorithm used: "
    echo "1. AES-256-CBC"
    echo "2. Blowfish"
    echo "3. DES"
    echo "4. TripleDES (DES3)"
    read -p "Enter the choice (1-4): " choice
    case $choice in
        1) algo="aes-256-cbc" ;;
        2) algo="bf" ;;
        3) algo="des" ;;
        4) algo="des3" ;;
        *) echo " [!] Invalid Choice"; return ;;
    esac

    openssl enc -"$algo" -d -in "$encfile" -out "$outfile"

    if [ $? -eq 0 ]; then
        echo "[^_^] Decryption successful!"
        newhash=$(sha256sum "$encfile" | awk '{print $1}')
        storedhash=$(grep "^$encfile " "$logfile" | awk '{print $2}')

        if [ "$newhash" == "$storedhash" ]; then
            echo "[+] Integrity check passed"
        else
            echo "[!] Integrity check failed: File may have been tampered with"
        fi
        LogActivity "Decrypted $encfile using $algo"
    else
        echo "[=_+] Decryption failed"
    fi
}

hashFile() {
    read -p "Enter file to hash: " hashfile
    sha256sum "$hashfile"
    LogActivity "Generated hash for $hashfile"
}

echo -e "\nChoose an Option:"
echo "1. Encrypt a file"
echo "2. Decrypt a file"
echo "3. Print SHA-256 Hash"
read -p "Enter choice (1-3): " choice

case $choice in
    1) file_encryption ;;
    2) decryption ;;
    3) hashFile ;;
    *) echo "[!] Invalid choice. Don't be a dumbass." ;;
esac
