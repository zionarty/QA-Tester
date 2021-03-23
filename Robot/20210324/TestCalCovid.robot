*** Settings ***
Documentation  Basic database related keywords
Library  DatabaseLibrary

*** Variables ***
${DB_CONNECT_STRING} =  'appuser/appuser@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=db.sew.com)(PORT=1522))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=sewdb)))'

${bill_period}    =   '256402'
${user_seq}     =   '048791'
${net_amt}   =   790.95
${amt_ft_total}     =   -32.33
${vat}  =   39.04
${amount}   =   797.66
${pay_amount}   = 596.74

${queryString}      select count(*) from BILL.user_seq_master a,BILL.unit_process b,BILL.disc_process c where b.user_seq = a.user_seq and C.user_seq = a.user_seq and C.bill_period = b.bill_period and b.bill_period ${bill_period} and a.user_seq  ${user_seq} and b.net_amt ${net_amt} and b.amt_ft_total ${amt_ft_total} and b.vat ${vat} and b.amount ${amount} and b.amount-c.disc_amt ${pay_amount}

*** Test Cases ***
Connecting
  connect

  @{queryResults}  Query  ${queryString}

  log to console  @{queryResults}
  #Log to console  ${queryString}

*** Keywords ***
Connect
    connect to database using custom params  cx_Oracle  ${DB_CONNECT_STRING}

Disconnect
    disconnect from database