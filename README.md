# text_stats
[![test](https://github.com/yukiozaki0511/robosys2025/actions/workflows/test.yml/badge.svg)](https://github.com/yukikozaki0511/robosys2025/actions/workflows/test.yml)

標準入力からテキストを読み込み、行数、単語数、文字数、ユニーク単語数などの統計情報を計算して出力するコマンドです。
文章の規模や構成を素早く把握するのに適しています。

## インストール方法
以下のコマンドを入力してください。

```bash
$ git clone https://github.com/Ryuki-Ozaki/robosys2025.git
```

```bash
$ cd robosys2025
```

## 実行例

例1: 標準入力から文字列を渡すと、その統計情報を表示します。

入力

```bash
$ echo "Hello World" | ./text_stats
```

出力

```text
--- Text Statistics ---
Lines Count:         1
Word Count:          2
Character Count:     12
Unique Words Count:  2
Longest Line Chars:  11
```

例2: 複数行のテキストを入力した場合の例です。

入力

```bash
$ echo -e "This is a pen.\nThat is an apple." | ./text_stats
```

出力

```text
--- Text Statistics ---
Lines Count:         2
Word Count:          8
Character Count:     33
Unique Words Count:  7
Longest Line Chars:  17
```

例3: 既存のテキストファイルの内容を集計する例です。

入力

```bash
$ cat sample.txt | ./text_stats
```

出力例

```text
--- Text Statistics ---
Lines Count:         15
Word Count:          120
Character Count:     850
Unique Words Count:  64
Longest Line Chars:  78
```

## 必要なソフトウェア
- Python
  - テスト済み: 3.7〜3.10

- Ubuntu 22.04.5 LTS

## ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

- © 2025 Ryuki Ozaki
