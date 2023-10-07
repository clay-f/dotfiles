--默认打开DBMA_OUTPUT,这样不必要每次在输入这个命令，同时将默认缓冲池设置得尽可能大
set serveroutput on size 1000000
--假脱机输出文本时，会去除文本行两端的空格，而且行宽不定，如果设置为off（默认设置），假脱机输出的文本行宽度则等于所设置的linesize
set trimspool on
--设置选择LONG和CLOB列时显示的默认字节数
set long 5000
--设置显示的文本宽为200个字符
set linesize 200
--设置SQLPLUS多久打印一次标题，将此参数设置大些这样每页只显示一次标题
set pagesize 9999
--设置AUTOTRACE得到解释计划输出的默认宽度，一般80足够放下整个计划
column plan_plus_exp format a80
--设置SQLPLUS提示符，显示格式为用户@数据库名
column global_name new_value gname
set termout off
define gname=idle
column global_name new_value gname
select lower(user) ||'@'|| substr(global_name,1,decode(dot,0,length(global_name),dot-1)) global_name
from (select global_name,instr(global_name,'.') dot from global_name);
set sqlprompt '&gname>'
set termout on
