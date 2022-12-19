encode(GOR10CD), gen(regionid)
encode LAD18CD,gen(lad)

encode(f_0_hle2017), gen(femalehle)
encode(m_0_hle2017), gen(malehle)


 collapse London2018 malehle femalehle H_Price_Avg2018 Net_Spend_EPH_PP2018 Net_Spend_PH_PP2018 Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 IMDAveragerank urban area weighted_total s1_gov s2_ma s3_ca s4_coms s5_mset s6_cb s7_dsi s8_est s9_ee, by(lad)
 
drop if lad=.

xi: reg weighted_total  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 imd_decile urban i.area, cluster(lad)

outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model1.dta", stats(coef se) dec(3) word 

*Also trying without cluster LAD
xi: reg weighted_total  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 imd_decile urban i.area

*Now trying without area

reg weighted_total  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 imd_decile urban Net_Spend_EPH_PP2018 Net_Spend_PH_PP2018, cluster(lad)

outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model2.dta", stats(coef se) dec(3) word 

*Now trying with deprivation dummy
xi: reg weighted_total  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area, cluster(lad)

outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model3.dta", stats(coef se) dec(3) word 


*Now trying with a dummy variable for highest quartile of score (without cluster for LAD)
*Excluding area as it doesn't work
xi: logit binary_total malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban

outreg2 using  "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model4.dta", eform cti(odds ratio)  dec(3) word 

*Finally looking at the different dimensions of the total score in order of each dimension (refer to website for more info)

*S1 (Government development and funding)
xi: reg s1_gov malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s1_gov malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model5.dta", stats(coef se) dec(3) word 

*S2 (Mitigation and Adaption)
xi: reg s2_ma  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s2_ma  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model6.dta", stats(coef se) dec(3) word 

*S3 (Committment and Integration)
xi: reg s3_ca  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s3_ca malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model7.dta", stats(coef se) dec(3) word 

*S4 (Community engagement and communications)
xi: reg s4_coms  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s4_coms malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model8.dta", stats(coef se) dec(3) word 

*S5 (Measuring and setting emission target)
xi: reg s5_mset  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s5_mset malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model9.dta", stats(coef se) dec(3) word 

*S6 (Co-benefits)
xi: reg s6_cb malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s6_cb malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model10.dta", stats(coef se) dec(3) word 

*S7 (Diversity and Social Inclusion)
xi: reg s7_dsi  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s7_dsi  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model11.dta", stats(coef se) dec(3) word 

*S8 (Education, skills, and training)
xi: reg s8_est  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s8_est  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model12.dta", stats(coef se) dec(3) word 

*S9 (Ecological Emergency)
xi: reg s9_ee  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban i.area
*Without area
xi: reg s9_ee  malehle femalehle H_Price_Avg2018  Central_Gov_Funding_Total2018 Pop_PC_65_over2018 Pop_PC_16_642018 highdeprivation urban
outreg2 using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\model13.dta", stats(coef se) dec(3) word 

*For basic descriptive statistics for high and low quartiles

sum imd_decile if total_quartile==1
sum malehle if total_quartile==1
sum femalehle if total_quartile==1
sum H_Price_Avg2018 if  total_quartile==1
sum  Central_Gov_Funding_Total2018  if total_quartile==1
sum Pop_PC_65_over2018 if total_quartile==1
sum Pop_PC_16_642018 if total_quartile==1
sum urban if total_quartile==1

sum imd_decile if total_quartile==4
sum malehle if total_quartile==4
sum femalehle if total_quartile==4
sum H_Price_Avg2018 if  total_quartile==4
sum  Central_Gov_Funding_Total2018  if total_quartile==4
sum Pop_PC_65_over2018 if total_quartile==4
sum Pop_PC_16_642018 if total_quartile==4
sum urban if total_quartile==4


