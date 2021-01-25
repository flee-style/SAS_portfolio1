/* 文字スタイルを変更 */
proc template;
	define style styles.htmlblue2;
	parent=styles.htmlblue;
	class GraphFonts /
	  'NodeDetailFont' = ("&gfont",7pt)
	  'NodeInputLabelFont' = ("&gfont",9pt)
	  'NodeLabelFont' = ("&gfont",9pt)
	  'NodeTitleFont' = ("&gfont",9pt)
	  'GraphDataFont' = ("&gfont",7pt)
	  'GraphUnicodeFont' = ("&gfont",9pt)
	  'GraphValueFont' = ("&gfont",9pt)
	  'GraphLabel2Font' = ("&gfont",10pt)
	  'GraphLabelFont' = ("&gfont",10pt)
	  'GraphFootnoteFont' = ("&gfont",10pt)
	  'GraphTitleFont' = ("&gfont",11pt,bold)
	  'GraphTitle1Font' = ("&gfont",14pt,bold)
	  'GraphAnnoFont' = ("&gfont",10pt);
	end;
run;
filename graph "&outpath.\gragh.htm" ;
ods html style=htmlblue2 path="&outpath." file='graph.html' ;

/* 折れ線グラフ作成 */
ods listing gpath="C:\Users\user\Documents\データサイエンティスト\ポートフォリオ作成" style=htmlblue2;
axis2 label=(font=mincho h=1.5 ANGLE=-90 ROTATE=90 '性別');
proc sgplot data= work.netflix_tran;
	vline rating_/response=Movie;
	vline rating_/response='tv show'n;
run;