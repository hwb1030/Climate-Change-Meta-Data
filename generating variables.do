*********************************************************
*Generating some variables example
**************************************************
*Example with population bucket
encode pop_bucket, gen(pop_size)
sort pop_size
browse
gen population_size=.
replace population_size=3 if pop_size==1|pop_size==2|pop_size==3|pop_size==11|pop_size==14|pop_size==15
replace population_size=2 if pop_size==4|pop_size==5|pop_size==6|pop_size==8
replace population_size=1 if pop_size==9|pop_size==10|pop_size==16
replace population_size=0 if pop_size==7|pop_size==12|pop_size==13
label variable population_size "Size of area"
tab population_size
drop pop_size


***********************************************
*Seeing if we can manually merge some area
sort _merge
*So this puts everything in order via the original datasets
*On the top is IMD
*Next is climate emergency
*it needs to be on data edit mode
*To get to data edit mode -
browse
*Then once dataset appears on the command bar press data and then data editor

*Checking the merged dataset
browse LocalAuthorityDistrictname2 officialname