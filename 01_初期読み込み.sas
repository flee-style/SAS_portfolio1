/* �v���O���������� */
/* �o��PATH */
%let outpath = C:\Users\user\Documents\DataScientist\PortFolio\Netflix\output;
%let gfont=Arial Unicode MS;

/* �t�H�[�}�b�g��` */
proc format;
	value $MovieType
		'1' = 'Movie'
		'2' = 'TV Show'
	;
run;

