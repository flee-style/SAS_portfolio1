/* プログラム初期化 */
/* 出力PATH */
<<<<<<< HEAD
%let outpath = C:\Users\user\Documents\DataScientist\PortFolio\Netflix\output;
=======
%let outpath = C:\Users\user\Documents\データサイエンティスト\ポートフォリオ作成\output;
>>>>>>> origin/main
%let gfont=Arial Unicode MS;

/* フォーマット定義 */
proc format;
	value $MovieType
		'1' = 'Movie'
		'2' = 'TV Show'
	;
run;

