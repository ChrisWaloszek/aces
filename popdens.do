/*

var2 = var1([1:end], [1:10000]);
var3 = var1([1:end], [10001:20000]);
var4 = var1([1:end], [20001:30000]);
var5= var1([1:end], [30001:40000]);
var6= var1([1:end], [40001:end]);

 
dlmwrite('my_text', var2 , 'delimiter' , ',');
dlmwrite('my_text1', var3 , 'delimiter' , ',');
dlmwrite('my_text2', var4 , 'delimiter' , ',');
dlmwrite('my_text3', var5 , 'delimiter' , ',');
dlmwrite('my_text4', var6 , 'delimiter' , ',');
*/






set maxvar 11000

clear 
gen x=.
save p1.dta, replace 

local lower=1
local higher=100
import delimited \\nash\mtec-home\spichler\Desktop\gpw-v4-population-density-2000\my_text.txt, clear
forvalues i=1/100 {
preserve
keep v`lower'-v`higher'
gen x=_n
reshape long v, i(x) j(y)
replace v=. if v<=-4.076e+14 & v!=.
drop if v==.
append using p1.dta, 
save p1.dta, replace
restore
local lower=`lower'+100
local higher=`higher'+100
}





clear
local lower=1
local higher=100
forvalues i=1/100 {
import delimited \\nash\mtec-home\spichler\Desktop\gpw-v4-population-density-2000\my_text1
keep v`lower'-v`higher'
gen x=_n
reshape long v, i(x) j(y)
replace y=y+10000
replace v=. if v<=-4.076e+14 & v!=.
drop if v==.
append using p1.dta, 
save p1.dta, replace
local lower=`lower'+100
local higher=`higher'+100
}


clear
local lower=1
local higher=100
forvalues i=1/100 {
import delimited \\nash\mtec-home\spichler\Desktop\gpw-v4-population-density-2000\my_text2
keep v`lower'-v`higher'
gen x=_n
reshape long v, i(x) j(y)
replace y=y+20000
replace v=. if v<=-4.076e+14 & v!=.
drop if v==.
append using p1.dta, 
save p1.dta, replace
local lower=`lower'+100
local higher=`higher'+100
}

clear
local lower=1
local higher=100
forvalues i=1/100 {
import delimited \\nash\mtec-home\spichler\Desktop\gpw-v4-population-density-2000\my_text3
keep v`lower'-v`higher'
gen x=_n
reshape long v, i(x) j(y)
replace y=y+30000
replace v=. if v<=-4.076e+14 & v!=.
drop if v==.
append using p1.dta, 
save p1.dta, replace
local lower=`lower'+100
local higher=`higher'+100
}

clear
local lower=1
local higher=100
forvalues i=1/100 {
import delimited \\nash\mtec-home\spichler\Desktop\gpw-v4-population-density-2000\my_text4
keep v`lower'-v`higher'
gen x=_n
reshape long v, i(x) j(y)
replace y=y+40000
replace v=. if v<=-4.076e+14 & v!=.
drop if v==.
append using p1.dta, 
save p1.dta, replace
local lower=`lower'+100
local higher=`higher'+100
}

