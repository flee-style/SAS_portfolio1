/*--- �f���^�C�v���̌p�����ԁih�j�̕��� ---*/
proc univariate data=NETFLIX_REMAKE noprint;
	var duration_hour;
	output out=NETFLIX_univari min=MIN_dur max=MAX_dur mean=MEAN_dur;
	class type_;
run;

/* �ő�l�ƍŏ��l���H */
data NETFLIX_MIN_MAX(keep=type_ MEAN_dur_ min_max);
	set NETFLIX_univari;
	attrib min_max   length=$10;
	attrib MEAN_dur_ length=$8;
	min_max = compress(put(MIN_dur,2.)) || ' - ' || compress(put(MAX_dur,5.));
	MEAN_dur_ = compress(put(MEAN_dur,8.2));
run;

/*--- ���[�쐬 ---*/
proc transpose data=NETFLIX_MIN_MAX out=NETFLIX_DUR_TRAN;
	var MEAN_dur_ min_max;
	id type_;
run;