MeCabｵﾝﾄﾞｩﾙｺﾞﾁｼ
======================

ｵﾝﾄﾞｩﾙｺﾞﾄﾊ､ｿｸｻｯｱﾝｸﾞﾐ「ｶﾒﾅｴﾝﾀﾞｰｷﾞﾝ」ﾉﾀﾞｶﾚﾂｶﾜﾚﾃﾙﾙｹﾞｺﾞﾛｼﾚｽ。
ｼﾞｮｳｻｲﾝ
http://ja.wikipedia.org/wiki/%E3%82%AA%E3%83%B3%E3%83%89%E3%82%A5%E3%83%AB%E8%AA%9E
ｺｻﾝｼｮｰ。
ｺﾉｵﾝﾄﾞｩﾙｺﾞﾍﾞﾉﾎﾝﾔｸﾝ､MeCabﾅｲﾚﾁｽﾚﾝｽﾙﾉｶﾞ､ｺﾛｳﾞﾛｼｴｸﾞﾄﾃﾞｽ。
ﾃﾞｭﾙﾗｰﾝﾄﾞ､ｶﾝﾃﾞｭﾝｶﾞﾁﾀﾆﾆﾖｳｵﾝﾔｸﾖﾆ､ﾋﾃﾞﾝﾃﾞｨｵﾝﾄﾞｩﾙｺﾞﾝ､ﾅﾙﾝｽﾞﾃﾞｽ。

##ﾚﾝﾀﾀｰｳ・ｼｯｺﾛ
ｼｼｮｯｺﾊﾞﾙﾝﾄﾞｳﾓ・ﾃﾞﾅｶﾝｼｮ､

 % /usr/local/libexec/mecab/mecab-dict-index
 % mecab -d . <ﾍﾀﾆｼﾞｶﾚﾃｷｼﾀ(ｵﾐｦﾃﾞﾝﾀｸｶﾗｶﾞﾀﾞﾃﾞ)

ｿｽﾙﾄﾍｸﾝﾃｷﾜｽ。

MeCabﾊｷﾞﾝﾄﾞﾝﾄﾞｶﾞｲｼｷﾄﾓｰｼﾝ､ｵﾐｦ､ｼｭﾂﾆｮｸｽﾙｺﾞﾄﾓﾃｷﾜｽ。
ｺﾉｺﾄｦﾆﾖｰｽﾚｧｰ､ｶﾆｼﾞﾏｼﾘｲﾉﾑﾅｼﾞｮｳﾃﾓ､ｵﾝﾄﾞｩﾙｺﾞﾆﾎﾝﾔｸｽﾙｺﾄﾞｶﾞﾃｷﾜｽ。

 % mecab -Oyomi | mecab -d . <ﾍﾀﾆｼﾞｶﾚﾃｷｼﾀ(ｶﾆｼﾞﾏｼﾘｲ)


##ｧｸｼｭﾙ
ﾃﾞﾎﾞｼﾀﾆｺﾛﾄｼｮ､ｽｷﾞﾅｲﾜﾅﾄｦｼﾞｯｺﾛｽﾙﾄﾀﾞﾅｲｰｲﾊﾞｽｶｴｧｸｼｭﾙﾃｷﾜｽ。
ｵﾝﾄﾞｩﾙｺﾞﾚﾀｶﾚﾀｼﾆｮｳｶﾞﾀｸﾗｸ､ｺｳﾊﾞｽﾉｷﾎﾞｶﾞｳﾞｿｸｼﾀｲﾜｽ。
ﾄﾞｶﾞﾄﾞｶﾞﾀｲﾔｸｼｼﾝ､ｵﾓﾂﾉﾎｳｧｲｴｯｼｰﾚｧｰ､ｷｮｳﾆｮｸｺﾛﾈｪｧｲｼﾜｽ。

 % sh build.sh

##ﾀﾞｲｼﾝﾀ
Copyright &copy; 2011 Shogo Ichinose

Distributed under the [MIT License][mit].

[MIT]: http://www.opensource.org/licenses/mit-license.php


MeCabオンドゥル語辞書
======================

オンドゥル語とは、特撮番組「仮面ライダー剣」の中で使われている言語らしいです。
詳細は
http://ja.wikipedia.org/wiki/%E3%82%AA%E3%83%B3%E3%83%89%E3%82%A5%E3%83%AB%E8%AA%9E
を参照。
このオンドゥル語への翻訳を、MeCabのみで実現するのが、このプロジェクトです。
従来の、単純な置換による翻訳より、自然なオンドゥル語に、なるはずです。

## インストール・実行
辞書をダウンロード・展開して、

 % /usr/local/libexec/mecab/mecab-dict-index
 % mecab -d . < 変換したいテキスト(読みを全角カタカナで)

とすると変換できます。

MeCabは形態素解析と同時に、読みを、出力することもできます。
このことを利用すれば、漢字混じりの文章でも、オンドゥル語に翻訳することができます。

 % mecab -Oyomi | mecab -d . < 変換したいテキスト(漢字混じり)


## 学習
レポジトリを落として、次のコマンドを実行すると生コーパスから学習できます。
オンドゥル語で書かれた資料が少なく、コーパスの規模が不足しています。
どなたか対訳辞書を、お持ちの方が居らっしゃれば、協力をお願いします。

 % sh build.sh

## ライセンス
Copyright &copy; 2011 Shogo Ichinose

Distributed under the [MIT License][mit].

[MIT]: http://www.opensource.org/licenses/mit-license.php