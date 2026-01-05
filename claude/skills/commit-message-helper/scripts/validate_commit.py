import re
import sys

def validate_commit_message(message):
    pattern = r'^(feat|fix|docs|style|refactor|perf|test|chore)(\(.+\))?: .{1,50}'
    if re.match(pattern, message.split('\n')[0]):
        return True, "Valid commit message format"
    return False, "Invalid format. Expected: type(scope): subject"

if __name__ == "__main__":
    message = sys.argv[1] if len(sys.argv) > 1 else ""
    valid, msg = validate_commit_message(message)
    print(msg)
    sys.exit(0 if valid else 1)
