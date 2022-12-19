*Done first with climate emergency data
gen laname=lower(substr(officialname,1,20))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging.dta", replace 


*Now with IMD
gen laname=lower(substr(LocalAuthorityDistrictname2,1,20))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\IMD data_for merging.dta", replace


*Now attempting to merge together (note will lose quite a few)

merge 1:m laname using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging.dta"


*This case we have merged 21

*First going to try a m:m merge and then will go back and play with characters
merge m:m laname using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging.dta"

*No different to m:1 merge so going to try and change number of characters


*First going up to 25 and then will go down to 15
*Done first with climate emergency data
gen laname=lower(substr(officialname,1,25))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging25.dta", replace 


*Now with IMD
gen laname=lower(substr(LocalAuthorityDistrictname2,1,25))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\IMD data_for merging25.dta", replace

*Now merging together with 25 characters
merge 1:m laname using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging25.dta"

*That is worse leaves only 5 before abandon going to try merging with original merge data of 20 and see what happens

use "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\IMD data_for merging25.dta"

merge 1:m laname using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging.dta"

*Nope only 6 matched

*Now trying with 15 characters
*Done first with climate emergency data
gen laname=lower(substr(officialname,1,15))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging15.dta", replace 


*Now with IMD
gen laname=lower(substr(LocalAuthorityDistrictname2,1,15))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\IMD data_for merging15.dta", replace


*Now attempting to merge together (note will lose quite a few)

merge 1:m laname using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging15.dta"

*this gets us 46 so much better!

*Now going to try with 10 characters
*Done first with climate emergency data
gen laname=lower(substr(officialname,1,10))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging10.dta", replace 


*Now with IMD
gen laname=lower(substr(LocalAuthorityDistrictname2,1,10))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\IMD data_for merging10.dta", replace


*Now attempting to merge together (for 10 characters it is now a many to many merge)

merge m:m laname using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging10.dta"

*Going to try with 8
*Done first with climate emergency data
gen laname=lower(substr(officialname,1,8))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging8.dta", replace 


*Now with IMD
gen laname=lower(substr(LocalAuthorityDistrictname2,1,8))

save "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\IMD data_for merging8.dta", replace


*Now attempting to merge together (for 10 characters it is now a many to many merge)

merge m:m laname using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\scorecard_data_for merging8.dta"

