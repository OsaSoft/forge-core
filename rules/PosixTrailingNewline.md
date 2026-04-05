Every text file ends with `\n`. Line-splitting functions (`lines()` in Rust, `splitlines()` in Python, `split('\n')` in JS) strip the trailing newline, and joining the result back doesn't normally restore it.

Normalize at the write boundary before saving to disk.
