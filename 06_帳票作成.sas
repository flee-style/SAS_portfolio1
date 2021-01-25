/*--- �f�[�^�c�ς� ---*/
data table1;
	set NETFLIX_TRAN(drop=Movie 'TV show'n rename=(rating_ = _NAME_)) NETFLIX_DUR_TRAN(rename=(Movie=Movie_ 'TV Show'n='TV Show_'n));
run;

/*--- ���[�h�ɏo�� ---*/
ods rtf file = 'C:\Users\user\Documents\�f�[�^�T�C�G���e�B�X�g\�|�[�g�t�H���I�쐬\output\nexflix.rtf' style=Styles.Default  ;
proc report data=work.netflix_tran missing
	style(column) = {asis=off background=white vjust=center};
	column rating_ ('���[�r�[�^�C�v' Movie 'tv show'n);
	define rating_ / '���[�g' order;
	define Movie   / '�f��';
	define 'tv show'n   / '�e���r�ԑg';
run;
ods rtf close;