#!/bin/bash
# SPDX-FileCopyrightText: 2025 Ryuki Ozaki
# SPDX-License-Identifier: BSD-3-Clause

ng=0

# --- 準備 ---
# コマンドが実行可能か確認し、権限を付与
if [ ! -x ./text_stats ]; then
    chmod +x ./text_stats
fi

# --- テスト1: 通常の入力 (Hello World) ---
# echoはデフォルトで末尾に改行を入れるため、
# "Hello World" (11文字) + "\n" (1文字) = 12文字 になるはず
out=$(echo "Hello World" | ./text_stats)

# 出力に期待する数値が含まれているかチェック
# grep -q は静かに実行し、見つかれば終了ステータス0を返す
echo "${out}" | grep -q "Lines Count:.*1" || ng=1
echo "${out}" | grep -q "Word Count:.*2" || ng=1
echo "${out}" | grep -q "Character Count:.*12" || ng=1
echo "${out}" | grep -q "Unique Words Count:.*2" || ng=1

if [ "$ng" -eq 0 ]; then
    echo "Test 1: OK"
else
    echo "Test 1: FAILED"
    echo "Output was:"
    echo "${out}"
    exit 1
fi

# --- テスト2: 空の入力 ---
# 何も入力がない場合はすべて0になるはず
out=$(echo -n "" | ./text_stats)

echo "${out}" | grep -q "Lines Count:.*0" || ng=1
echo "${out}" | grep -q "Word Count:.*0" || ng=1
echo "${out}" | grep -q "Character Count:.*0" || ng=1

if [ "$ng" -eq 0 ]; then
    echo "Test 2: OK"
else
    echo "Test 2: FAILED"
    echo "Output was:"
    echo "${out}"
    exit 1
fi

# --- テスト3: 複数行の入力 ---
# 3行、3単語
out=$(echo -e "Line1\nLine2\nLine3" | ./text_stats)

echo "${out}" | grep -q "Lines Count:.*3" || ng=1
echo "${out}" | grep -q "Word Count:.*3" || ng=1

if [ "$ng" -eq 0 ]; then
    echo "Test 3: OK"
else
    echo "Test 3: FAILED"
    echo "Output was:"
    echo "${out}"
    exit 1
fi

# 全テスト通過
echo "All tests passed."
exit 0
