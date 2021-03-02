data Netflix_remake;
	set WORK.NETFLIX_TITLES;
	attrib rating_ length=$4;
	attrib type_   length=$10 format=MovieType.;
	attrib duration_hour format=8.2;

	/*--- type‰ÁH ---*/
	/* Movie   1 */
	/* TV Show 2 */
	select(type);
		when ('Movie')   type_ = '1';
		when ('TV Show') type_ = '2';
		otherwise type_ = '';
	end;

	/*--- rating‰ÁH ---*/
	/*G,NR,PG,TV-G,TV-PG	all */
	/*TV-Y	                2 - */
	/*TV-Y7,TV-Y7-FV        7 - */
	/*PG-13	                13 -*/
	/*TV-14	                14 -*/	
	/*NC-17	                17 -*/	
	/*R	                    18 -*/	
	/*TV-MA,UR	            20 -*/	
	select ; 
		when (rating in ('G','NR','PG','TV-G','TV-PG')) rating_ = 'all';
		when (rating = 'NC-17') rating_ = '17 -';
		when (rating = 'PG-13') rating_ = '13 -';
		when (rating = 'R')     rating_ = '18 -';
		when (rating = 'TV-14') rating_ = '14 -';
		when (rating = 'TV-MA') rating_ = '20 -';
		when (rating = 'TV-Y')  rating_ = '2 -';
		when (rating in ('TV-Y7','TV-Y7-FV')) rating_ = '7 -';
		when (rating = 'UR')    rating_ = '20 -';
		otherwise rating_ = 'all';
	end;

	/*--- duration‰ÁH ---*/
	/* 1Season ¨ 22˜b ~ 30min */
	if compress(index(duration,'min')) > 0 
		then duration_min = input(substr(duration,1,input(compress(index(duration,'min')),10.)-1),10.);
	else if compress(index(duration,'Season')) > 0 
		then duration_min = input(substr(duration,1,input(compress(index(duration,'Season')),10.)-1),10.) * 22 * 30;
	else duration_min = 0;
	/* min ¨ hour */
	duration_hour = duration_min / 60;

	/*--- release_year‰ÁH ---*/
	select(substr(release_year,1,2));
		when ('19') ;
		when ('20') ;
		otherwise release_year = '';
	end;
run;