Never execute scripts downloaded from the network without verifying their hash first. Download to a file, compute SHA-256, compare against a known digest, then execute.

Always hash the file on disk, not a shell variable. Command substitution (`$(curl ...)`) strips trailing newlines from the captured content, changing the hash:

```sh
# WRONG — hash differs from the original file
script=$(curl -sfL "$URL")
echo "$script" | shasum -a 256

# RIGHT — hash matches the original file
curl -sfL "$URL" -o /tmp/script.sh
actual=$(sha256sum /tmp/script.sh 2>/dev/null || shasum -a 256 /tmp/script.sh)
actual=${actual%% *}
[ "$actual" = "$EXPECTED_SHA" ] || { echo "hash mismatch"; exit 1; }
bash /tmp/script.sh
```

Store the expected hash in a single location (e.g., `.githooks/pre-commit`). Never duplicate it across files — hash drift is silent and breaks CI.

Use `sha256sum` (Linux) with `shasum -a 256` (macOS) fallback for portability.
