/* �v���O���������� */
/* �o��PATH */
<<<<<<< HEAD
%let outpath = C:\Users\user\Documents\DataScientist\PortFolio\Netflix\output;
=======
%let outpath = C:\Users\user\Documents\�f�[�^�T�C�G���e�B�X�g\�|�[�g�t�H���I�쐬\output;
>>>>>>> origin/main
%let gfont=Arial Unicode MS;

/* �t�H�[�}�b�g��` */
proc format;
	value $MovieType
		'1' = 'Movie'
		'2' = 'TV Show'
	;
run;

