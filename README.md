# template

## How to apply custom gitmessage
- Execute `git config --local commit.template .gitmessage.txt`

## Commit rule
- [언어] 타입: 꼬릿말 | 파이썬 파일의 경우 [언어] 생략
- ex) .py 파일의 경우, feat: Add tokenizer utils
- ex) 그 외, [shell] feat: Add git action script

## How to use pre-commit
1. Install pre-commit: `pip install pre-commit` or `pip install -r requirements.txt`
2. Execute `pre-commit install` to install git hooks in your .git/ directory.