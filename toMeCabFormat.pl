use warnings;
use strict;
use utf8;
use open ":utf8";
use open ":std";
use Unicode::Normalize;

#オリジナルコーパスをMeCabフォーマットに変換
open my $corpus_file, '>:utf8', 'seed/corpus' or die $!;
my %words;
while(my $line=<>) {
	chomp $line;
	my @a = split /\s+/,$line;
	for my $w(@a) {
		my @features = split ',', word2mecab($w);
		print $corpus_file $features[0]."\t".join(',', @features[4..10])."\n";
		$words{$w} = 1;
	}
	print $corpus_file "EOS\n";
}
close $corpus_file;

#オンドゥル語の50音を辞書に追加
open my $ondulish_file, '<:utf8', 'ondulish.dic' or die $!;
while(my $line=<$ondulish_file>) {
	chomp $line;
	$words{$line} = 1;
}
close $ondulish_file;

#辞書を作成
open my $word_file, '>:utf8', 'seed/word.csv' or die $!;
for my $w(sort keys %words) {
	print $word_file word2mecab($w),"\n";
}
close $word_file;

sub word2mecab {
	my $word = shift;
	my @f = split /\//, $word;
	my @a = split //, NFKC($f[1]);
	my %attr = (
		'ア' => 'a,a',
		'イ' => 'a,i',
		'ウ' => 'a,u',
		'エ' => 'a,e',
		'オ' => 'a,o',
		'ァ' => 'a,a',
		'ィ' => 'a,i',
		'ゥ' => 'a,u',
		'ェ' => 'a,e',
		'ォ' => 'a,o',
		'カ' => 'k,a',
		'キ' => 'k,i',
		'ク' => 'k,u',
		'ケ' => 'k,e',
		'コ' => 'k,o',
		'ガ' => 'g,a',
		'ギ' => 'g,i',
		'グ' => 'g,u',
		'ゲ' => 'g,e',
		'ゴ' => 'g,o',
		'サ' => 's,a',
		'シ' => 's,i',
		'ス' => 's,u',
		'セ' => 's,e',
		'ソ' => 's,o',
		'ザ' => 'z,a',
		'ジ' => 'z,i',
		'ズ' => 'z,u',
		'ゼ' => 'z,e',
		'ゾ' => 'z,o',
		'タ' => 't,a',
		'チ' => 't,i',
		'ツ' => 't,u',
		'テ' => 't,e',
		'ト' => 't,o',
		'ダ' => 'd,a',
		'ヂ' => 'd,i',
		'ヅ' => 'd,u',
		'デ' => 'd,e',
		'ド' => 'd,o',
		'ナ' => 'n,a',
		'ニ' => 'n,i',
		'ヌ' => 'n,u',
		'ネ' => 'n,e',
		'ノ' => 'n,o',
		'ハ' => 'h,a',
		'ヒ' => 'h,i',
		'フ' => 'h,u',
		'ヘ' => 'h,e',
		'ホ' => 'h,o',
		'バ' => 'b,a',
		'ビ' => 'b,i',
		'ブ' => 'b,u',
		'ベ' => 'b,e',
		'ボ' => 'b,o',
		'パ' => 'p,a',
		'ピ' => 'p,i',
		'プ' => 'p,u',
		'ペ' => 'p,e',
		'ポ' => 'p,o',
		'マ' => 'm,a',
		'ミ' => 'm,i',
		'ム' => 'm,u',
		'メ' => 'm,e',
		'モ' => 'm,o',
		'ヤ' => 'y,a',
		'ユ' => 'y,u',
		'ヨ' => 'y,o',
		'ャ' => 'y,a',
		'ュ' => 'y,u',
		'ョ' => 'y,o',
		'ラ' => 'r,a',
		'リ' => 'r,i',
		'ル' => 'r,u',
		'レ' => 'r,e',
		'ロ' => 'r,o',
		'ワ' => 'w,a',
		'ヲ' => 'w,o',
		'ン' => 'n,n',
	);
	my $head = $a[0];
	my $headattr = $attr{$head} || '*,*';
	my $tail = $a[-1] || $a[0];
	my $tailattr = $attr{$tail} || '*,*';
	return "$f[0],0,0,0,$f[1],$head,$headattr,$tail,$tailattr";
}
