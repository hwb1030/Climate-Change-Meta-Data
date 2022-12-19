sum weighted_total

*Generating quartiles for weighted total of climate emergency database

xtile total_quartile=weighted_total,n(4)

xtile IMD_decile=IMDAveragerank,n(10)

recode IMD_decile (10=1) (9=2) (8=3) (7=4) (6=5), gen(imd_decile)

drop IMD_decile


xi: pwcorr i.total_quartile i.imd_decile, sig obs


xi: pwcorr i.total_quartile imd_decile, sig obs

ologit total_quartile imd_decile

gen highdeprivation=0 if imd_decile>=4 & imd_decile<=10
replace highdeprivation=1 if imd_decile==1|imd_decile==2|imd_decile==3
tab highdeprivation

gen binary_total=0 if total_quartile==1|total_quartile==2|total_quartile==3
replace binary_total=1 if total_quartile==4

logistic binary_total imd_decile

encode ruc_cluster, gen(rurality)
sort rurality
browse rurality

gen urban=0 if rurality==1|rurality==2
replace urban=1 if rurality==3|rurality==4
tab urban

encode(region), gen(REGION)
sort REGION

recode REGION (8 4=0 "South East") (9=1 "South West") (10=2 "Wales") (11=3 "West Midlands") (12=4 "Yorkshire and Humber") (2=5 "East Midlands") (3=6 "East Of England") (5=7 "North East") (6=8 "North West"), gen(area) label(area)
tab area

drop if area==2

xi: logit binary_total i.area  highdeprivation urban 
outreg2 using  "C:\Users\brownhw\OneDrive - Lancaster University\Climate Change Project\basic result.dta", eform cti(odds ratio)  dec(3)word 

