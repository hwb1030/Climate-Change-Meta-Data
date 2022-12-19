***************************************************************
*Trying to create a dataset that can use
***********************************************************
keep  f_0_le m_0_le Pop_PC_0_15 Pop_PC_16_64 Pop_PC_65_over Time_period Region Area_Code Year Central_Gov_Funding_Total Central_Gov_Funding_Total_PerCap Net_Spend_PH Net_Spend_PH_PP Net_Spend_EPH Net_Spend_EPH_PP H_Price_Avg f_0_hle m_0_hle London

reshape wide f_0_le m_0_le Pop_PC_0_15 Pop_PC_16_64 Pop_PC_65_over Time_period Region Central_Gov_Funding_Total CGFTPC Net_Spend_PH Net_Spend_PH_PP Net_Spend_EPH Net_Spend_EPH_PP H_Price_Avg f_0_hle m_0_hle London, i(Area_Code) j(Year)


*Variable name too long, re-wording
rename Central_Gov_Funding_Total_PerCap CGFTPC

*Need to do this for merging with code info
encode Area_Code, gen(region_code)

*Now sorting out data to get local authority code
keep LAD18CD LAD18NM GOR10CD GOR10NM

*so it can be merged with financial dataset
encode GOR10CD, gen(region_code)

merge m:1 region_code using "C:\Users\brownhw\OneDrive - Lancaster University\Climate Change Project\financial_data_wide.dta"	

keep if _merge==3
drop _merge