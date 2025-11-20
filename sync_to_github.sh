#!/bin/bash

# 检查是否有更改
if [[ -z $(git status -s) ]]; then
  echo "没有检测到更改。"
  exit 0
fi

# 添加所有更改
git add .

# 获取当前时间作为提交信息
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Auto-sync: $TIMESTAMP"

# 提交更改
git commit -m "$COMMIT_MSG"

# 推送到远程仓库 (假设远程名为 origin，分支为 main)
# 如果第一次推送失败，可能需要设置上游分支: git push --set-upstream origin main
git push origin main

echo "成功同步到 GitHub: $TIMESTAMP"
