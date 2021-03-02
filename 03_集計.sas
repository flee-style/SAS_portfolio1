/*--- レーティングと映像タイプ（テレビ番組、映画）の集計 ---*/
proc freq data=NETFLIX_REMAKE ;
	table rating_ * type_ / nopercent norow nocol out=NETFLIX_freq noprint;
run;

/*--- 帳票作成 ---*/
/* 転置 */
proc transpose data=work.netflix_freq out=work.netflix_tran(drop=_NAME_ _LABEL_);
	var COUNT;
	by  rating_;
	id  type_;
run; 
/* 欠損値処理 */
data work.netflix_tran;
	length rating_ $9.;
	length Movie_ 'tv show_'n $10.;
	set work.netflix_tran;
	if Movie      = . then Movie      = 0;
	if 'tv show'n = . then 'tv show'n = 0;
	Movie_      = compress(put(Movie,5.));
	'tv show_'n = compress(put('tv show'n,5.));
run;