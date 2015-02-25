cd data-hold
curl -so tdr.txt http://www.tdcj.state.tx.us/death_row/dr_offenders_on_dr.html
curl -so tx1923_73.txt http://www.tdcj.state.tx.us/death_row/dr_list_all_dr_1923-1973.html
curl -so fdr.txt http://www.dc.state.fl.us/activeinmates/deathrowroster.asp
curl -so felpresent.txt http://www.dc.state.fl.us/oth/deathrow/execlist.html
curl -so fel1924_64.txt http://www.dc.state.fl.us/oth/deathrow/execlist2.html
curl -so cal.txt http://www.cdcr.ca.gov/capital_punishment/docs/condemnedinmatelistsecure.pdf

echo 'im done'
