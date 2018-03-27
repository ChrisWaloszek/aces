

use abq.dta, clear
gen year = 2000
gen quarter= 1

forvalues yearc=1/17 {
forvalues qtr=1/4 {

append using abq`i'q`qtr'.dta

replace year = 2000+`i' if  year==.
replace quarter=`qtr' if quarter==.

}
}

gen qdate=yq(year ,qtr)
xtset aaa qdate



// currently we assign the whole county even though only the city was treated in most cases....problem?!

gen treat=0
replace treat=1 if st==6 & cnty==75  & date>=mdy(2,5,2007) // San Francisco
replace treat=1 if st==11  & date>=mdy(11,13,2008)  // Washington DC
/* Washington DC treated twice, second time only for tipped employees*/
replace treat=1 if st==11 & date>=mdy(2,22,2014)  // Washington DC
replace treat=1 if st==9 & date>=mdy(1,1,2012)  // Conneticut - service workers only
replace treat=1 if st==53 & cnty==33  & date>=mdy(9,1,2012) // Seattle, WA
replace treat=1 if st==36 & cnty==61 & date>=mdy(4,1,2014) // New York, NY
replace treat=1 if st==36 & cnty==81 & date>=mdy(4,1,2014) // Queens, NY
replace treat=1 if st==36 & cnty==5 & date>=mdy(4,1,2014) // Bronx, NY
replace treat=1 if st==36 & cnty==47 & date>=mdy(4,1,2014) // Kings, NY
replace treat=1 if st==36 & cnty==85 & date>=mdy(4,1,2014) // Richmond, NY
replace treat=1 if st==41 & cnty==51 & date>=mdy(1,1,2014) // "Portland, OR"
replace treat=1 if st==34 & cnty==17 & date>=mdy(1,24,2014) // Jersey City, New Jersey
replace treat=1 if st==34 & cnty==13 & date>=mdy(5,29,2014) //Newark, NJ
replace treat=1 if st==6 & cnty==1 & date>=mdy(3,2,2015)  //"Oakland, CA"
replace treat=1 if st==42 & cnty==101 & date>=mdy(5,13,2015)  //"Philadelphia, PA" 
replace treat=1 if st==6 & date>=mdy(7,1,2015) //"Kalifornien"
replace treat=1 if st==25 & date>=mdy(7,1,2015) //Massachusetts
replace treat=1 if st==41 & date>=mdy(1,1,2016) // Oregon





/* assign treatment based on law passed*/
gen treatlaw=0
replace treatlaw=1 if st==6 & cnty==75  & date>=mdy(11,7,2006)  
replace treatlaw=1 if st==11 & date>=mdy(5,13,2008)  
/* Washington DC treated twice */
replace treatlaw=1 if st==11 & date>=mdy(12,18,2013) 
replace treatlaw=1 if st==9 & date>=mdy(7,1,2011)  
replace treatlaw=1 if st==53 & cnty==33  & date>=mdy(9,12,2011)  
replace treatlaw=1 if st==36 & cnty==61  & date>=mdy(6,26,2013)  
replace treatlaw=1 if st==36 & cnty==5  & date>=mdy(6,26,2013)  
replace treatlaw=1 if st==36 & cnty==47  & date>=mdy(6,26,2013)  
replace treatlaw=1 if st==36 & cnty==85  & date>=mdy(6,26,2013)  
replace treatlaw=1 if st==36 & cnty==81  & date>=mdy(6,26,2013)  
replace treatlaw=1 if st==41 & cnty==51 & date>=mdy(3,13,2013)  
replace treatlaw=1 if st==34 & cnty==17 & date>=mdy(1,24,2014)    // still to check jersey city
replace treatlaw=1 if st==34 & cnty==13 &  date>=mdy(1,29,2014)  
replace treatlaw=1 if st==6 & cnty==1 & date>=mdy(11,4,2014)  
replace treatlaw=1 if st==42 & cnty==101  & date>=mdy(2,12,2015)   
replace treatlaw=1 if st==6 & date>=mdy(9,19,2014)  
replace treatlaw=1 if st==25 & date>=mdy(11,4,2014)  
replace treatlaw=1 if st==41 & date>=mdy(6,22,2015)  


/* assign treatment after probation is over */
gen treatprob=0
replace treatprob=1 if st==6 & cnty==75 & date>=mdy(2,5,2007)+90  
replace treatprob=1 if st==11  & date>=mdy(11,13,2008)+90  
/* Washington DC treated twice */
replace treatprob=1 if st==11  & date>=mdy(2,22,2014) +90  
replace treatprob=1 if st==9 & date>=mdy(5,1,2012)   
replace treatprob=1 if st==53 & cnty==33   & date>=mdy(9,1,2012)+180  
replace treatprob=1 if st==36 & cnty==61  & date>=mdy(4,1,2014)+120  
replace treatprob=1 if st==36 & cnty==5  & date>=mdy(4,1,2014)+120
replace treatprob=1 if st==36 & cnty==47  & date>=mdy(4,1,2014)+120
replace treatprob=1 if st==36 & cnty==85  & date>=mdy(4,1,2014)+120
replace treatprob=1 if st==36 & cnty==81  & date>=mdy(4,1,2014)+120
replace treatprob=1 if  st==41 & cnty==51 & date>=mdy(1,1,2014)+90  
replace treatprob=1 if st==34 & cnty==17 & date>=mdy(1,24,2014)    // still to check jersey city
replace treatprob=1 if st==34 & cnty==13 & date>=mdy(5,29,2014)+90 
replace treatprob=1 if st==6 & cnty==1  & date>=mdy(3,2,2015)+90 
replace treatprob=1 if st==42 & cnty==101  & date>=mdy(5,13,2015)+90  
replace treatprob=1 if st==6  & date>=mdy(7,1,2015)+90 
replace treatprob=1 if st==25 & date>=mdy(7,1,2015)+90 
replace treatprob=1 if st==41  & date>=mdy(1,1,2016)+90 






