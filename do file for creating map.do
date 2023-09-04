
ssc install spmap

ssc install shp2dta

ssc install mif2dta

shp2dta using  "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\LAD.dbf", database(ukdb) coordinates(ukcoord) genid(lad)

merge 1:1 lad using "C:\Users\heath\OneDrive - Lancaster University\Climate Change Project\data 090922.dta"

 spmap IMDAveragerank using ukcoord, id(lad) fcolor(Blues)
 

 spmap weighted_total using ukcoord, id(lad) fcolor(Blues)