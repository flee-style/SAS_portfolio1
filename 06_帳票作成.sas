/*--- データ縦積み ---*/
data table1;
	set NETFLIX_TRAN(drop=Movie 'TV show'n rename=(rating_ = _NAME_)) NETFLIX_DUR_TRAN(rename=(Movie=Movie_ 'TV Show'n='TV Show_'n));
run;

/*--- ワードに出力 ---*/
ods rtf file = 'C:\Users\user\Documents\データサイエンティスト\ポートフォリオ作成\output\nexflix.rtf' style=Styles.Default  ;
proc report data=work.netflix_tran missing
	style(column) = {asis=off background=white vjust=center};
	column rating_ ('ムービータイプ' Movie 'tv show'n);
	define rating_ / 'レート' order;
	define Movie   / '映画';
	define 'tv show'n   / 'テレビ番組';
run;
ods rtf close;