select * from tab;
select * from employees

/*
select employee_id, last_name, salary
from employees;
*/

select employee_id, salary
from employees;

desc employees
�̸�             ��?       ����           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)

select * from employees;

select employee_id, commission_pct, salary * 12 * commission_pct
from employees;

number
date
char

select salary, salary * 12, hire_date, hire_date - 1
from employees;

if commission_pct is null then
else commission_pct
end_if;

select employee_id, salary, commission_pct, salary * 12 * nvl(commission_pct,1) annual_salary
from employees;

select last_name || 


select distinct department_id, job_id
from employees;

1�� ����
select employee_id "EMP#", last_name||' ' ||first_name "Employee Name"
from employees;

2�� ����, ����
select last_name||', '|| job_id "Employee and Title"
from employees;

3�� ����, ����
select department_name||q'[ Department's Managerk Id: ]'||manager_id "Department and manager"
from departments;

select department_name||'Department''s Managerk Id:'||manager_id "Department and manager"
from departments;

select *
from employees
where employee_id = 100;

select *
from employees
where last_name = 'King';
select last_name

from employees;

 

instr -> ���� ��ġ

 

select last_name, instr(last_name, 'a', 1,1), instr(last_name, 'a',1,2), instr(last_name, 'a',1,3)

from employees;

 

select last_name

from employees

where instr(last_name, 'a',1,2)>2

 

select last_name

from employees

where last_name like '%a%a%';

 

substr -> ���������� ��� ����

 

select last_name, substr(last_name,1,2)

from employees;

 

select last_name, substr(last_name,1,2), substr(last_name,2,2)

from employees;

 

substr���� �ڿ������� � �̰������ -�Է�

 

select last_name, substr(last_name,-2,2)

from employees;

 

select substr('�����ٶ󸶹ٻ�',1,2), substrb('�����ٶ󸶹ٻ�',1,3)

from dual;

 

-trim : ���ο� ���̿� ���ӵǴ� �ش繮�ڸ� ����

 

select trim('a' from 'aabbacaa')

from dual;

 

select length('  aaa              '), length(trim('  aaa      '))

from employees;

 

- ltrim : ���� ���ӹ��� ���� rtrim: �����ʿ��ӹ��� ����

 

select ltrim('aabacaa','a'), rtrim('aabacaa','a')

from dual;

 

[���� 14]

select initcap(last_name), length(last_name)

from employees

where instr(last_name,'J',1,1)=1

Or instr(last_name,'A',1,1)=1

or instr(last_name,'M',1,1)=1

order by last_name asc;

 

�̷��� �Ҽ����ְ� substr��

 

select initcap(last_name), length(last_name)

from employees

where substr(last_name,1,1) in ('J', 'A', 'M')

order by last_name asc;

 

select initcap(last_name), length(last_name)

from employees

where instr(last_name,'J',1,1)>0

Or instr(last_name,'A',1,1)>0

or instr(last_name,'M',1,1)>0

order by last_name asc;

 

[���� 15] instr �߽�ߴ�

 

select *

from employees

where department_id = 50

and instr(last_name, 'a',2,1)=2;

 

select *

from employees

where department_id = 50

and substr(last_name, 2,1)= 'a';

 

last_name like '_a%'

 

- replace ��� ������ �ٲܰ�

          ���� �ְų� ���ٶ��� ����

select replace('100-001','-','%')

from dual;

 

select replace('100-001','-','')

from dual;

 

select trim('    100   001   '), replace('    100   001   ',' ')

from dual;

 

select replace(last_name, 'A')

from employees;

 

 

 

- lpad, rpad

 

select salary,

    lpad(salary,10,'*'),

    rpad(salary,10,'*')

from employees;

 

desc employees

select last_name, lpad(last_name, 20,'*')

from employees;

 

[����16]

select salary, lpad('*',(salary/1000),'*') "STAR"

from employees;

 

select salary, lpad(' ',(salary/1000+1),'*') "STAR"

from employees;

 

 

�����Լ�

lower, upper, initcap, length, lengthb, substr, substrb, instr, replace, trim, ltrim, rtrim, lpad, rpad, concat

 

������

like

 

�����Լ�

round -> �Ҽ��� ���ڸ����� �ݿø��ؼ� ǥ����

 

select round(45.926,2), round (45.926,1), round(45.926,0), round(45.926,-1), round(45.926,-2), round(55.926, -2)

from dual;

 

trunc -> �Ҽ��� ���ڸ� ���� �츮�� ������ ����(����)

 

select trunc(45.926,2), trunc (45.926,1), trunc(45.926,0), trunc(45.926,-1), trunc(45.926,-2), trunc(55.926, -2)

from dual;

 

ceil-> ���� ū ������ ��ȯ (�Ҽ��� �����鼭 ū ������ �ø�)

 

select round(10.1), ceil(10.1)

from dual;

 

floor-> ���� ���� ������ ��ȯ (�Ҽ��� �����鼭 ������ ����)

 

select round(10.1), floor(10.1)

from dual;

 

mod - ���� ������ �� ��ȯ

 

select 12/7, mod(12, 7)

from dual;

 

[����17]

 

select employee_id, last_name, salary, round(salary*1.1,0) "New Salary",

    salary - round(salary*1.1) "Diff New Salary"

from employees;

 

 

-POWER �ŵ�����

 

select 2*2*2, power(2,3)

from dual;

 

��¥

sysdate: ���� ���� ��¥�� �����ϴ� �Լ�

systimestamp: ���� ���� ��¥ �ð� Ÿ���� ����

current_date: ���� Ŭ���̾�Ʈ�� ��¥�� ����

current_timestamp: ���� Ŭ���̾�Ʈ�� ��¥ �ð� Ÿ���� ����

localtimestamp: ���� Ŭ���� ��¥, �ð� ����

 

 

��¥ +- �ϼ� -> ��¥ ���

��¥ +- ��¥ -> �ϼ� ���

 

��¥ +- �ð� -> ��¥�� ����

 

select sysdate, systimestamp, current_date, current_timestamp, localtimestamp

from dual;

 

select sysdate +100

from dual;

 

select employee_id, sysdate, hire_date, sysdate - hire_date "�ٹ��ϼ�"

from employees;

 

select sysdate + 12/24

from employees;

 

select localtimestamp, localtimestamp + 12/24

from employees;

 

 

to_char -> date �� char ���·� ��ȯ(�������·�)

 

select sysdate + 12/24, to_char(sysdate+12/24, 'yyyy-mm-dd hh24:mi:ss')

from dual;

 

select sysdate + 12/24, to_char(sysdate+60/(24*60*60), 'yyyy-mm-dd hh24:mi:ss')

from dual;

 

select employee_id, sysdate - hire_date, months_between(sysdate, hire_date)

from employees;

 

[����18]

select employee_id, hire_date, months_between(sysdate, hire_date)

from employees

where months_between(sysdate, hire_date) >= 180;

 

select sysdate, add_months(sysdate,5), add_months(sysdate,-5)

from dual;

 

- next_day : �Է��� ��¥ ���� ã���ִ� ���� ���尡��� ��¥

 

select next_day(sysdate,'�ݿ���') -----------�����̴ϱ� �� ���ӵ�

from dual;

 

[����19]

select last_name, hire_date, next_day(add_months(hire_date,6),'������') "REVIEW"

from employees;

 

 

- last_day : ���س�¥ ���� ������ ��¥ ����

 

select sysdate, last_day(sysdate), last_day(add_months(sysdate,2))

from dual;

 

����

select employee_id, department_id, salary

from employees

order by 2 asc, 3 desc;

select '210101-1234567' "�ֹι�ȣ_1", replace('210101-1234567', substr('210101-1234567','9','6'),'******') "�ֹι�ȣ_2" 
from dual;

select '210101-1234567' "�ֹι�ȣ_1", rpad(substr('210101-1234567','1','8'),'14','*') "�ֹι�ȣ_2"
from dual;

select '010-1000-1004' "��ȭ��ȣ_1", replace('010-1000-1004',substr('010-1000-1004','5','4'),'****') "��ȭ��ȣ_2"
from dual;

select 'james@itwill.com' "EMAIL_1", substr('james@itwill.com','2'


day �Ͽ��� dy �� d 1

����23
select employee_id, to_char(hire_date, 'day')
from employees
order by to_char(hire_date, 'd') asc;

����24
select *
from employees
where to_char(hire_date, 'day') = '�Ͽ���';

���� 25
select to_char(sysdate, 'yyyy"��" mm"��" dd"��" day')
from employees;

Ȥ��

select to_char(sysdate, 'dl')
from employees;

���� 26
select last_name, hire_date, to_char(next_day(add_months(hire_date, 6),'������'), 'day", the "Ddspth "of" fmmm, yyyy')
from employees;

select to_char(sysdate+1/24,'fmhh hh24 pm')
from dual;

select employee_id, salary, 
to_char(salary, '999,999.00'),
to_char(salary, '000,999.00'),
to_char(salary, '999'),
to_char(salary, '$9999,999.00'),
to_char(salary, '19999,999.00'),
to_char(salary, '19999g999d00')
from employees;

select to_char(hire_date,'mm'), mod(to_number(to_char(hire_date,'mm')),2)
from employees;

select *
from employees
where mod(to_number(to_char(hire_date,'mm')),2)=0;

nvl2 �Ҷ��� ���ڸ� ����, ���ڸ� ���� ������Ÿ�� ��ġ�ؾ� �����־�

select employee_id, salary, commission_pct, nvl2(commission_pct, (salary*12)+(salary*12*commission_pct), salary*12) annual_sal
from employees;

coalesce - null�� �߻����� ����������!

select employee_id, coalesce((salary*12)+(salary*12*commission_pct), salary*12,0)
from employees;

null if (1, 2) - > �ΰ��� ��ġ�ϸ� ,null, ��ġ���������� 1�� ���� 

select employee_id, last_name, first_name, nullif(length(last_name),length(first_name))
from employees;

select employee_id, job_id,
    decode(job_id,
        'IT_PROG', salary*1.1,
        'ST_CLERK', salary*1.2,
        'SA_REP', salary*1.3,
        salary) revised_salary
from employees;

case ���ذ�

����29

select employee_id, salary,
    case
        when salary <= 4999 then 'low'
        when salary Between 5000 and 9999 then 'medium'
        when salary between 10000 and 19999 then 'good'
        when salary >= 20000 then 'excellent'
    end
from employees;

[����30]

decode�� Ǯ��

 

select job_id,

    decode(job_id, 'AD_PRES', 'A',

                    'ST_MAN', 'B',

                    'IT_PROG', 'C',

                    'SA_REP', 'D',

                    'ST_CLERK', 'E',

                    'z') GRADE

from employees;

 

 

 

 

 

case�� Ǯ��

 

'=' �� �ƴ� in > < �̷��� ������ �� �ڿ� ���ذ��� �� �־������

select job_id,

    case

        when job_id = 'AD_PRES' then 'A'

        when job_id = 'ST_MAN' then 'B'

        when job_id = 'IT_PROG' then 'C'

        when job_id = 'SA_REP' then 'D'

        when job_id = 'ST_CLERK' then 'E'

    else 'Z' end as GRADE

 

from employees;

 

select employee_id,

        nvl2(commission_pct, (salary*12)+(salary*12*commission_pct), salary*12) ann_sal

from employees;

 

decode, case ǥ���Ŀ��� null check ���

 

select employee_id,

        decode(commission_pct, null, salary*12, (salary*12)+(salary*12*commission_pct)) ann_sal

from employees;

 

select employee_id,

    case

        when commission_pct is null then

            salary*12

        else

            (salary*12)+(salary*12*commission_pct)

        end ann_sal

from employees;

 

select * from nls_session_parameters;

 

select 

to_char(to_date('95-10-27', 'yy-mm-dd'),'yyyy-mm-dd') "YY",

to_char(to_date('95-10-27', 'rr-mm-dd'),'yyyy-mm-dd') "RR"

 

from dual;

 

yy : ����⵵�� ���⸦ �ݿ� : 2095-10-27 

rr : 2000�⵵ ǥ����� �ڵ�ȭ�� ����

 

���翬�� �������Է� ��¥   YY            RR

1994    95-10-27       1995         1995

1994    17-10-27       1917         2017

2001    17-10-27       2017         2017

2048    52-10-27       2052         1952

2051    47-10-27       2047         2047

 

�̰� �򰥸��ϱ� �� 4�ڸ� ����!!!!!!!!!!!

 

 

������ �Լ�

- �����Լ�, �����Լ�, ��¥�Լ�, ����ȯ�Լ�, NULL�����Լ�, �������� �����Լ�

 

�׷��Լ�

- ������� �ϳ��� ����� ��ȯ

- sum, avg, median, variance, stddev, max, min, count

 

select count(*)       ---------- null�� ������ ���� ��

from employees

where department_id = 50;

 

select count(commission_pct), count(employee_id) ------null�� ������ ����� ���Ѵ�.

from employees

where department_id = 50;

 

select count(distinct department_id)

from employees;

 

select sum(salary)

from employees;

 

select sum(salary)

from employees

where department_id = 50;

 

select avg(salary)

from employees;

 

select avg(commission_pct)---------��տ����� null ����. R ���̽��� �����ü�� �ȵȴ�

from employees;

 

�ΰ��� �����ؼ� 0�̶� ����� ��ճ����� nvl

 

select avg(nvl(commission_pct,0))

from employees;

 

median

������(n) Ȧ���� : (n+1) / 2

������(n) ¦���� : ((n/2), (n+1) / 2) �� ���

 

variance

stddev

 

select max(salary), min(salary), max(salary) - min(salary)

from employees;

 

select max(hire_date), min(hire_date), max(last_name), min(last_name)

from employees;

 

 

------------------------------

�μ���(�ұ׷�)���� �޿� �Ѿ� ���ϱ�   -group by

 

 

select sum(salary)

from employees

group by department_id;

 

select department_id, sum(salary)

from employees

group by department_id;

 

 

�׷��Լ� �� �� null�� �������� ���� ����, select���� �׷��Լ��� ���Ե��� �ʴ� �����÷��� �ϳ��� �������� group by ���� ����ؾ� �Ѵ�.

 

select department_id, job_id, sum(salary)

from employees

group by department_id, job_id;

 

select department_id, sum(salary)

from employees

group by department_id;

 

select * from employees order by department_id;

 

select department_id, sum(salary)

from employees

where sum(salary) >= 10000   ----------�̰� ���� ���� . where ���� ���� �����ϴ°��� �׷��Լ� ����� �����ϴ� �� �ƴ�.

group by department_id;

 

----------------------

�׷��� �ʿ��Ѱ� having!!!!!!  �׷��Լ��� ����� ��������

 

select department_id, sum(salary)

from employees

group by department_id

having sum(salary) >= 10000;

 

select department_id, sum(salary)

from employees

where last_name like '%i%'

group by department_id

having sum(salary) >= 20000

order by 1;

 

select max(avg(salary)) ------ �׷��Լ� �ι���ø????? -=> �����÷��� ���ߵȴ�! �����÷������ϱ� � �μ��� �ƽ����� �𸥴ٰ�. �׶�, sub_query ����ϴ°ž�

from employees

group by department_id;

 

[����31]

select job_id, count(job_id)

from employees

where hire_date >= to_date('2008-01-01','yyyy-mm-dd') and hire_date < to_date('2009-01-01','yyyy-mm-dd')

group by job_id

order by count(job_id) desc;

 

[����32]

select count(employee_id), to_char(hire_date, 'rrrr')

from employees

group by to_char(hire_date, 'rrrr');

 

[����33]

select count(employee_id), to_number(to_char(hire_date, 'fmmm'))

from employees

group by to_number(to_char(hire_date, 'fmmm'))

order by 2 asc;

 

[����34]

select to_char(hire_date, 'rrrr')

from employees;

 

 

------------------------������ �Լ� �ȿ� �׷��Լ��� ������ ����. case(count(~)) �� �ȵȴٰ�.

decode�� �ϱ�

select count(*) total,

            count(decode(to_char(hire_date, 'rrrr'), '2001',1)) "2001��",

            count(decode(to_char(hire_date, 'rrrr'), '2002',1)) "2002��",

            count(decode(to_char(hire_date, 'rrrr'), '2003',1)) "2003��"

from employees;

 

case�� �ϱ�

select count(*) total,

            count(case to_char(hire_date, 'rrrr') when '2001' then 1 end) "2001��",

            count(case to_char(hire_date, 'rrrr') when '2002' then 1 end) "2002��",

            count(case to_char(hire_date, 'rrrr') when '2003' then 1 end) "2003��"

from employees;

 

join    ------ �ΰ� �̻��� ���̺��� ���� ���ϴ� �����͸� �������� ���

 

 

1. cartesian product

- �������� ������ ���

- �������� �߸� ���� ���

- ù��° ���̺� ���� ���� �ι�° ���̺� ���� ���� ��������.

 

select employee_id, department_name

from employees, departments;

 

2. equi join, inner join, simple join, �����

 

equi join

 

select employee_id, department_name

from employees, departments

where employees.department_id = departments.department_id;

 

-----------�������� �̷��� ���̺� ��Ī ���� ���� �鿩����!!!!!-=-----------

 

select e.employee_id, d.department_name

from employees e, departments d

where e.department_id = d.department_id;

 

�ڡڡڡڡڡڡڡ١ڤ�������� �����ȣ, �ٹ����ø� ����Ͻÿ�. --> employees �� locations�� ������ �� �ʿ���. �װ� departments

select e.employee_id, l.city

from employees e, locations l, departments d

where e.department_id = d.department_id

    and d.location_id = l.location_id;

 

 

����36

�����ȣ, �����̸� ���

4���� ���� �Ϸ��� �������Ǽ���� 3��������.

select e.employee_id, c.country_name

from employees e, countries c, departments d, locations l

where e.department_id = d.department_id

    and d.location_id = l.location_id

    and l.country_id = c.country_id;


select e.last_name, e.job_id, d.department_name, l.city
from employees e, departments d, locations l
where
    e.department_id = 80
    and e.department_id = d.department_id
    and d.location_id = l.location_id;
    
select last_name, job_id, department_id, department_name
from employees e, departments d, lacations l
where
    l.city =toronto
    and e.department_id = d. department_id
    and 
    
    
Outer join - Ű���� ��ġ���� �ʾƵ� ���. Ű���� �ִ� �ʿ� (+) �ٿ��ش�.

����39
select e.*, d.*
from employees e, departments d
where e.employee_id = d.manager_id;

����40
select last_name, commission_pct, department_name
from employees e, department d
where e.department_id=d.department_id
    and commission_pct is not null;
    
����41
select e.last_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
and e.last_name like '%a%';

select count(*) from employees where last_name like '%a%';

4. self join - �ڽ��� ���̺� ����

select w.last_name, m.last_name
from employees w, employees m
where w.manager_id = m.employee_id;

select * from employees;

CREATE TABLE job_grades
( grade_level varchar2(3),
  lowest_sal  number,
  highest_sal number);

INSERT INTO job_grades VALUES ('A',1000,2999);
INSERT INTO job_grades VALUES ('B',3000,5999);
INSERT INTO job_grades VALUES ('C',6000,9999);
INSERT INTO job_grades VALUES ('D',10000,14999);
INSERT INTO job_grades VALUES ('E',15000,24999);
INSERT INTO job_grades VALUES ('F',25000,40000);
commit;

select * from job_grades;

5. non equi join

select e.employee_id, e.salary, j.grade_level
from employees e, job_grades j
where e.salary >= j.lowest_sal
    and e.salary <= j.highest_sal;
    
[����43]
select  j.grade_level,count(*)
from employees e, job_grades j
where e.salary between j.lowest_sal and j.highest_sal
group by j.grade_level
order by 1;

[����44]
select employee_id, salary, grade_level, department_name
from employees e, job_grades j, department d
where e.salary between j.lowest_sal and j.highest_sal
and e.employee_id = 

[����45]
select e.employee_id, e.salary, j.grade_level, d.department_name, l.city
from employees e, job_grades j, departments d, locations l
where e. salary between j.lowest_sal and j.highest_sal
and e.department_id = d. department_id(+)
and d.location_id = l.location_id(+);


ANSI join (ANSI ǥ��)

1. natural join
- equi join
-�������� ��� �ڵ����� ����� �ش�.
-���� ���̺��� ������ �̸� ��� �÷��� �������� �������Ǽ�� ����� �ش�.

select e.employee_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and e.manager_id = d.manager_id;       -------------�߸��Ȱ�

select e.employee_id, d.department_name
from employees e natural join departments d;

select department_name, city
from departments natural join locations;

2. join using
- equi join
- ���������� ���� �÷��� �����Ѵ�.
- using ���� ���� �����÷��� ��� ���̺��̶�� �����ϸ� �ȵȴ�.

select e.employee_id, d.department_name
from employees e join departments d
using(department_id)
where department_id = 30;

select e.employee_id, d.department_name, l.city
from employees e join departments d
using(department_id)
join locations 1
using(location_id)
where department_id = 30;

3. join on ----------------------���� ���� ��
- equi join
- on ���� �̿��ؼ� �������� ��� ���� ���� ����Ѵ�.

select e.employee_id, d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where e.department_id in (30,50);

[����46]
select e.employee_id, e.salary, j.grade_level, d.department_name
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal
join departments d
on e.department_id = d.department_id;

select w.last_name, m.last_name
from employees w join employees m
on w.manager_id = m.employee_id(+);

�̰Ŷ�������

select w.last_name, m.last_name
from employees w left outer join employees m
on w.manager_id = m.employee_id;

outer�� ��������.

����Ŭ ������ outer join ����� �� ���ʿ� (+) �ȵ��ݾ�

1) �ذ���

select e.employee_id, e.salary, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id
union -- �̰� �ΰ��� �����شٰ�
select e.employee_id, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

2) �ذ��� ANSI ǥ���� full outer join

select e.employee_id, e.salary, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;



cartesian product �ǵ������� ����°���

select e.employee_id, e.salary, d.department_name
from employees e, department d;

select e.employee_id, e.salary, d.department_name
from employees e cross join departments d;

[����47]
����Ŭ
select d.department_name, sum(e.salary)
from employees e, departments d
where e.hire_date between to_date('2016/01/01','yyyy-mm-dd') 
and to_date('2016/12/31','yyyy-mm-dd')
and e.department_id = d.department_id
group by d.department_name;

select d.department_name, avg(e.salary)
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name;

ANSI ǥ��
select d.department_name, sum(e.salary)
from employees e join departments d
    on e.department_id = d.department_id
    where e.hire_date between to_date('2016/01/01','yyyy-mm-dd') and to_date('2016/12/31','yyyy-mm-dd')
group by d.department_name;

[����48] ----------------------�̰� ���� �ٽ� �����
select l.city, sum(e.salary)
from employees e, departments d, locations l
where e.hire_date >= to_date('2016-01-01','yyyy-mm-dd') and e.hire_date < to_date('2017-01-01','yyyy-mm-dd')
and e.department_id = d.department_id
and d.location_id = l.location_id
group by l.city;

[����49]
select l.city, sum(e.salary)
from employees e, departments d, locations l
where e.hire_date >= to_date('2007/01/01','yyyy-mm-dd')
and e.hire_date < to_date('2008/01/01','yyyy-mm-dd')
and e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
group by l.city;

[����51]
select w.last_name, w.hire_date, m.last_name, m.hire_date
from employees w join employees m
    on w.manager_id = m.employee_id
where w.hire_date < m.hire_date;


=----------------------
subquery
- SQL�� �ȿ� SELECT���� ����������� �Ѵ�.
- Select���� ���������� �� () ����� �Ѵ�.
- where�������� �񱳿����� ������ �Է��ؾ��Ѵ�.

��ø�������� (nested subquery)

1. ���������� ���� ����
2. ������ ���� ������ main������ ����

select *
from employees
where salary > (select salary
                from employees
                where employee_id = 110);
                
select *
from employees
where salary > (select salary
                from employees
                where last_name = 'King'); --------�̰� ����!
                
������ ��������

������ ��������
- ���������� ����� ������ ��
- �� ���� in, any, all ����ߴ�

select *
from employees
where salary > any(select salary
                from employees
                where last_name = 'King');
                
[����53]
select *
from employees
where job_id = (select job_id
                from employees
                where employee_id = 110)
and salary > (select salary
            from employees
            where employee_id = 110);

where 
                
[����54]
select *
from employees
where salary = (select min(salary)
                from employees);
                
having ������ subquery ���
having = �׷��Լ��� ����� �����ϰ� ���� ��

select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 40);
                        
select min(avg(salary)) -- �׷��Լ� �ι� ��ø�ϸ� �����÷� ���� �� ����
from employees
group by department_id;

�׷� �����÷� ���� ���� ������ ���? �̷���

[����55] �ּ� ��հ��� ���� �μ���ȣ, ����� ���

select department_id, avg(salary)
from employees
group by department_id
having avg(salary) = (select min(avg(salary))
                        from employees
                        group by department_id);


select *
from employees
where salary in (select min(salary)
                from employees
                group by department_id);

any �Ӽ��� or �ǹ�
all �� and �ǹ�

select *
from employees
where salary > (select min(salary)
                        from employees
                        where job_id = 'IT_PROG');
                        
[����56]
select job_id, sum(salary)
from employees
where job_id in (select job_id
                from employees
                where hire_date >= to_date('2006-01-01','yyyy-mm-dd') 
                and hire_date < to_date('2007-01-01','yyyy-mm-dd'))
group by job_id
having sum(salary) >= 50000;

[����57]
select e.last_name, e.department_id, e.job_id, l.location_id
from employees e, departments d, locations l
where e.department_id = d.department_id
    and d.location_id = l.location_id
    and l.location_id = 1700
order by department_id asc;
    
    
 !!!!!!!!!!!!!!&&&&& ����, ������ ������, ������ �Ҷ��� �̷��� ���̺� ������ ���� x.
 ���ʿ䵵 ����. �� ������ ���� select�� ���� �����ϴ°Ŵϱ�
select e.last_name, e.department_id, e.job_id, l.location_id
from employees e, departments d, locations l
where e.department_id = d.department_id
    and d.location_id = l.location_id
    and l.location_id = (select location_id
                        from locations
                        where location_id = 1700);

select last_name, department_id, job_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id = 1700);
                        
[����58]
select *
from employees
where salary > all (select salary
                from employees
                where department_id = 60);
                
[���� 59]
select*
from employees
where employee_id in (select manager_id
                            from employees);
                            
[���� 60]         not in ������ �������� null ������ ��ȸ�� ����
select *
from employees
where employee_id not in (select manager_id
                            from employees
                            where manager_id is not null);-- TRUE AND NULL �� �Ǿ NULL�� ����. NULL���� ����ߴ�

OR ����ǥ
TRUE OR TRUE = TRUE
TRUE OR FALSE = TRUE
TRUE OR NULL(T/F) = TRUE
FALSE OR NULL(T/F) = NULL !

AND ����ǥ
TRUE AND TRUE = TRUE
TRUE AND FALSE = FALSE
TRUE AND NULL = NULL
FALSE AND NULL = FALSE


��ø ��������
correlated sub-query

select employee_id, salary, department_id
from employees;

select avg(salary)
from employees
where department_id = ���� ;

select *
from employees o
where salary > (select avg(salary)
                from employees
                where department_id = o.department_id);

correlated subquery
1. main query(outer query)�� ���� ����
2. ù��°���� �ĺ������� ��� �ĺ��ప�� ���������� ����
3. �ĺ��ప�� ����ؼ� �������� �����Ѵ�
4. �������� ������� ����ؼ� �ĺ���� ���Ѵ�.
5. �������� �ĺ������� ��� 2,3,4���� �ݺ������Ѵ�.

exists
- �ĺ��ప�� ���������� �����ϴ��� ���θ� ã�� ������
- �ĺ��ప�� ���������� �����ϸ� TRUE, �츮�� ã�� ������ �˻�����
- �ĺ��ప�� ���������� �������� ������ FALSE �츮�� ã�� �����Ͱ� �ƴϴ�.
not exists

select *
from employees o
where exists (select 'x'
                from employees
                where manager_id = o.employee_id);

[����62] �Ҽӻ���� �ִ� �μ����� ���
1) in  -------�ߺ��� ���Ե� ��ȿ��

select * 
from departments
where department_id in (select department_id
                        from employees);
                        
2)exists -----�� �˻��ϴ°� �ƴ϶� ���� ������ ����ϰ� ����ٰ�

select *
from departments d
where exists (select 'x'
                from employees
                where department_id = d.department_id);
                
not exists 
- �ĺ��ప�� ���������� �������� �ʴ� ������ ã��. �ѹ��� �Ǹžȵ� ��ǰ ã��
[����66]
select last_name, job_id
from employees
where department_id = (select department_id
                        from departments
                        where department_name = 'Executive');
                        
[����67]
select employee_id, last_name, salary
from employees
where salary > (select avg(salary)
                from employees)
and department_id in (select department_id
                            from employees
                            where last_name like '%z%');
                
exists

select employee_id, last_name, salary
from employees o
where salary > (select avg(salary)
                from employees)
and exists (select 1
                            from employees
                            where last_name like '%z%'
                            and department_id = o.department_id);
                            
select *
from employees o
where salary > (select avg(salary)
                from employees
                where department_id = o.department_id);
                

INLINE VIEW
-�������̺�
-from �� subquery�� INLINE VIEW

select *
from (select department_id, avg(salary) avg_sal
    from employees
    group by department_id) dept_avg;
    
[����68]
select d.department_name, l.city, count(*)
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
group by d.department_name, l.city
having count(*) = (select max(count(*))
                    from employees
                    group by department_id);
                    
INLINE VIEW�� Ǯ��
select e.cnt, d.department_name, l.city
from (select department_id, count(*)cnt
        from employees
        group by department_id
        having count(*) = (select max(count(*))
                    from employees
                    group by department_id))e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

[����69]
select employee_id, last_name, to_char(hire_date,'day')
from employees
where to_char(hire_date,'day') in (select to_char(hire_date,'day')
                                from employees
                                group by to_char(hire_date,'day')
                                having count(*) = (select max(count(*))
                                                     from employees
                                                    group by to_char(hire_date,'day')));


[����70]
select
    count(decode(department_id, 10, 1)) "10",
    count(decode(department_id, 20, 1)) "20",
    count(decode(department_id, 30, 1)) "30",
    count(decode(department_id, 40, 1)) "40",
    count(decode(department_id, 50, 1)) "50",
    count(decode(department_id, 60, 1)) "60",
    count(decode(department_id, 70, 1)) "70",
    count(decode(department_id, 80, 1)) "80",
    count(decode(department_id, 90, 1)) "90",
    count(decode(department_id, 100, 1)) "100",
    count(decode(department_id, null, 1)) "�μ��� ���� ���"
from employees;

PIVOT 
�� �� ����

select*
from (select department_id
        from employees)
pivot(count(*) for department_id in (10,20,30,40,50,60,70,80,90,100,110,null as "�μ��� ���� ���"));

select *
from(select to_char(hire_date,'yyyy') year
    from employees)
pivot(count(*) for year in ('2001' "2001", '2002' "2002"));

����72

select to_char(hire_date,'day'), count(*)
from employees
group by to_char(hire_date,'day');

select *
from (select to_char(hire_date,'dy') day, salary
        from employees)
pivot(count(*) for day in ('��' "��", 'ȭ' "ȭ", '��' "��", '��' "��", '��' "��", '��' "��", '��' "��"))
    (sum(salary) for day in ('��' "��", 'ȭ' "ȭ", '��' "��", '��' "��", '��' "��", '��' "��", '��' "��"));

unpivot
���� ������ ����

[����74]

select to_char(hire_date,'yyyy'), to_char(hire_date,'q'), sum(salary)
from employees
group by to_char(hire_date,'yyyy'), to_char(hire_date,'q');

select to_char(hire_date,'yyyy') "�⵵",
        nvl(sum(decode(to_char(hire_date,'q'),1,salary)),0) "1�б�",
        nvl(sum(decode(to_char(hire_date,'q'),2,salary)),0) "2�б�",
        nvl(sum(decode(to_char(hire_date,'q'),3,salary)),0) "3�б�",
        nvl(sum(decode(to_char(hire_date,'q'),4,salary)),0) "4�б�"
from employees
group by to_char(hire_date,'yyyy')
order by 1;

select �⵵, nvl("1�б�",0) "1�б�", nvl("2�б�",0) "2�б�", nvl("3�б�",0) "3�б�", nvl("4�б�",0) "4�б�"
from (select to_char(hire_date,'yyyy') �⵵, to_char(hire_date,'q') quarter, salary
        from employees)
pivot(sum(salary) for quarter in (1 "1�б�",2 "2�б�",3 "3�б�",4 "4�б�"));

[����75]
select ��, nvl("2001��",0) "2001��", nvl("2002��",0) "2002��", nvl("2003��",0) "2003��", nvl("2004��",0)
from (select to_char(hire_date,'yyyy') �⵵, to_char(hire_date, 'mm') ��, salary
        from employees)
pivot(sum(salary) for �⵵ in ('2001' "2001��", '2002' "2002��", '2003' "2003��", '2004' "2004��"))
order by 1 ;

���߿� ��������

�ֺ�
select *
from employees
where (manager_id, department_id) in (select manager_id, department_id
                                        from employees
                                        where first_name = 'John');
                                        
[����76]
select *
from employees
where (department_id, salary) in (select department_id, salary
                                    from employees
                                    where commission_pct is not null);
[����77]                                  
select *
from employees
where (salary, nvl(commission_pct,0)) in (select e.salary, nvl(e.commission_pct,0)
                                    from employees e, departments d
                                    where d.location_id = 1700);
                                    
                                    
                                    
��Į�� �������� (�������� �ʾƵ� �Ǵ� ĳ�ñ��)  
- ���࿡�� ��Ȯ�� �ϳ��� ������ ��ȯ�ϴ� ����(�����÷�, ���ϰ��� ����)
- ������ �Է°��� ������ ���� Ƚ���� �ּ�ȭ �� �� �ִ� ������ �����Ѵ�.
- ��Į�� �������� �ϸ� �ƿ��� ���� ���ص� Ű����ġ���� �ʴ� ����� �̾Ƴ�
select employee_id, department_id, (select department_name
                                    from departments
                                    where department_id = e.department_id)
from employees e
order by 2;

[����78]
�μ��̸��� �޿��� �Ѿ�, ��� ���ϱ�

1)�Ϲ����� ����
select d.department_name, sum(e.salary), avg(e.salary)
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name
order by 1;

2) inline view  �Ϲ����� ������ � �������� ��������?
- �̸� ������ �� ���� ������. ������ ���� �ؼ� ���̺��� ����� ���� ���� ������ �ϸ�
    ��ȸ�� �� �ص� ���ݾ�.

select d.department_name, e.sum_sal, e.avg_sal
from (select department_id, sum(salary) sum_sal, avg(salary) avg_sal
        from employees
        group by department_id) e, departments d
where e.department_id = d.department_id(+);

3) scalar subquery �̿�  - ���⼭�� �Ȱ��� ���̺��� �ι� ��ȸ�ϴϱ� ���� ������ ����/

select department_name,(select sum(salary)
                        from employees
                        where department_id = d.department_id) sum_sal,
                        (select avg(salary)
                        from employees
                        where department_id = d.department_id) avg_sal
from departments d;

3) - 1 scalr subquery ȿ�������� ���� ���

select department_name, (select 'sum_sal:'||sum(salary)||',' ||'avg_sal:'||avg(salary)
                        from employees e
                        where department_id=d.department_id)
    from departments d;
    
3) - 2 �ٵ� ������ �÷� ������ ������?
select department_name ,substr(sal,1,10) sum_sal, substr(sal,11) avg_sal
from (select department_name, (select lpad(sum(salary),10)||lpad(avg(salary),10)
                            from employees
                            where department_id = d.department_id) sal
    from departments d)
where sal is not null;

[����79] ������� last_name, salary, grade_level�� ���

1) ����

select e.last_name, e.salary, j.grade_level
from employees e, job_grades j
where e.salary >= j.lowest_sal and e.salary <= j.highest_sal;
--between and �ص���

2) scalar subquery
select last_name, salary, (select grade_level
                            from job_grades
                            where e.salary between lowest_sal and highest_sal)
from employees e;

[����80] ������� employee_id, last_name ���, department_name ���� ����

select e.employee_id, e.last_name
from employees e, departments d
where e.department_id = d.department_id
order by d.department_name;

�̰� ���� �����ϱ� ������ ��ϳĸ�, �����ϴ� �κ� �ָ� �ٸ� ���̺��̴ϱ� order by �� ��Į�� �־����

select employee_id, last_name
from employees e
order by (select department_name
            from departments
            where department_id = e.department_id) desc;
            
subquery�� group by ������ �� �� ���°ž�.

[���� 81]

select to_char(hire_date,'yyyy') �⵵,
        to_char(nvl(sum(decode(job_id,'SA_REP',salary)),0),'l999,999')||'��' SA_REP,
        to_char(nvl(sum(decode(job_id,'SH_CLERK',salary)),0),'l999,999')||'��' SH_CLERK,
        to_char(nvl(sum(decode(job_id,'ST_CLERK',salary)),0),'l999,999')||'��' ST_CLERK
from employees
group by to_char(hire_date,'yyyy')
order by 1;


select �⵵, to_char(nvl(SA_REP,0),'l999,999')||'��' SA_REP, to_char(nvl(SH_CLERK,0),'l999,999')||'��' SH_CLERK, to_char(nvl(ST_CLERK,0),'l999,999')||'��' ST_CLERK
from (select to_char(hire_date,'yyyy')�⵵,job_id,salary
        from employees)
pivot(sum(salary) for job_id in ('SA_REP' "SA_REP",'SH_CLERK' "SH_CLERK",'ST_CLERK' "ST_CLERK"))
order by 1;

���տ����� UNION
-select ���� �÷� ������ ��ġ�ؾ� ��
-ù���� select���� �÷��� �����Ǵ� �ι��� select�� �÷��� ������ Ÿ���� ��ġ
- union, intersect, minus �����ڴ� �ߺ��� �����Ѵ�.
- �� ������ �ߺ����Ű� ���ķ� �ڵ����� ����.
- union all �ߺ�����
- order by ���� �������� ���
- order by���� �÷�, ��Ī, ��ġ ǥ����� ���


select employee_id, job_id, salary
from employees
union
select employee_id, job_id, to_number('0')
from job_history;

[����82] job_id�� �ѹ��̶� �ٲ� ���

1)���տ�����
select *
from employees
where employee_id in(select employee_id
                  from employees
                  intersect
                  select employee_id
                  from job_history);
                  
2)exists ������
select *
from employees e
where exists (select 'x'
                from job_history
                where employee_id = e.employee_id);
                
[����83] job_id�� �ѹ��� �ٲ��� ���� ��� 
��1)���տ�����
select *
from employees
where employee_id in(select employee_id
                  from employees
                  minus
                  select employee_id
                  from job_history);
                
2) not exists

select *
from employees e
where not exists (select 'x'
                from job_history
                where employee_id = e.employee_id);
                
[����84] �μ��� �������� ���� ������ ����Ʈ, country_id, country_name ���

select country_id, country_name
from countries
minus
select c.country_id, c.country_name
from departments d, locations l, countries c
where d.location_id = l.location_id
and l.country_id = c.country_id;

select country_id, country_name
from countries c
where not exists(select 'x'
                from departments d, locations l
                where d.location_id = l.location_id
                and l.country_id = c.country_id);
                
[����85] Union -> union all + not exists

select e.employee_id, e.last_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
union all
select null, null, department_name
from departments d
where not exists (select 'x'
                    from employees
                    where department_id = d.department_id);

�̰͵� ��ȿ���̶� full outer join ���� �ؾߵ� ANSI ǥ��

[����86]
1) department_id, job_id, manager_id �������� �Ѿ� �޿� ���
2) department_id, job_id �������� �Ѿױ޿� ���
3) department_id �������� �Ѿױ޿����
4) ��ü �Ѿױ޿� ���

select department_id, job_id, manager_id, sum(salary)
from employees
group by department_id, job_id, manager_id
union all
select department_id, job_id, null, sum(salary)
from employees
group by department_id, job_id
union all
select department_id, null, null, sum(salary)
from employees
group by department_id
union all
select null, null, null, sum(salary)
from employees;

rollup ������
group by �� ������ �� ����Ʈ�� �����ʿ��� ���ʹ������� �̵��ϸ鼭 �׷�ȭ


select department_id, job_id, manager_id, sum(salary)
from employees
group by rollup(department_id, job_id, manager_id);

cube ������
rollup�� �����ϰ� ��� �׷�ȭ �� �� �ִ� �� ����
rollup�� �����ʺ��� �̵��ϸ鼭 �׷�ȭ�ݾ� �ٵ� �̰� �÷��� ������ ���� �� �׷�ȭ��

grouping sets
���� ���ϴ� �׷��� ����� ������

group by grouping sets ((a,b),(a,c));

[����87] �⵵ �б⺰ �Ѿ��� ���ϼ���. �����հ� �����յ� ���ϼ���.

select year,
        max(decode(quarter,1,sum_sal)) "1�б�",
        max(decode(quarter,2,sum_sal)) "2�б�",
        max(decode(quarter,3,sum_sal)) "3�б�",
        max(decode(quarter,4,sum_sal)) "4�б�",
        max(decode(quarter,null,sum_sal)) "��"  
from (select to_char(hire_date,'yyyy') year,to_char(hire_date,'q') quarter ,sum(salary) sum_sal
        from employees
        group by cube(to_char(hire_date,'yyyy'),to_char(hire_date,'q')))
group by year
order by 1;

pivot���� Ǯ��
select *
from (select year, nvl(quarter,0) quarter, sum_sal
        from (select to_char(hire_date,'yyyy') year,to_char(hire_date,'q') quarter ,sum(salary) sum_sal
                from employees
                group by cube(to_char(hire_date,'yyyy'),to_char(hire_date,'q'))))
pivot (max(sum_sal) for quarter in (1,2,3,4))
order by 1;

[����88]

select nvl(�⵵, '������') �⵵,
        to_char(nvl(SA_REP,0), 'l999,999')||'��' SA_REP,
        to_char(nvl(SH_CLERK,0), 'l999,999')||'��' SH_CLERK,
        to_char(nvl(ST_CLERK,0), 'l999,999')||'��' ST_CLERK,
        to_char(������, 'l999,999')||'��' ������
    from (select �⵵, nvl(job_id, 'x') job_id, sum_sal
            from (select to_char(hire_date,'yyyy') �⵵, job_id, sum(salary) sum_sal
                    from employees
                    where job_id in ('SA_REP','SH_CLERK','ST_CLERK')
                    group by cube(to_char(hire_date,'yyyy'),job_id)))
pivot(max(sum_sal) for job_id in ('SA_REP' "SA_REP", 'SH_CLERK' "SH_CLERK", 'ST_CLERK' "ST_CLERK", 'x' "������"))
order by 1;

�����˻� (hierarchical query)

�����
select employee_id, last_name, manager_id
from employees
start with employee_id = 100
connect by prior employee_id = manager_id;

�����
    select level, lpad(' ',2*level-2,' ')||last_name
    from employees
    start with employee_id = 110
    connect by employee_id = prior manager_id;
    
    select level, lpad(' ',2*level-2,' ')||last_name
    from employees
    start with employee_id = 100
    connect by prior employee_id = manager_id;
    
    select level, lpad(' ',2*level-2,' ')||last_name
    from employees
    start with employee_id = 100
    connect by prior employee_id = manager_id
    order siblings by last_name;
    
    select level, lpad(' ',2*level-2,' ')||last_name
    from employees
    start with employee_id = 100
    connect by prior employee_id = manager_id
    and employee_id != 101;
    
[����89]select �� �̿��ؼ� 1~100 ���
select level
from dual
connect by level <= 100;

[����90] select �� �̿��ؼ� 2���� ���
select '2 * '||level||' = '|| 2*level "2��"
from dual 
connect by level <= 9;

[����91] 2�� ~ 9�� ���
select '2 * '||level||' = '|| 2*level "2��",
        '3 * '||level||' = '|| 3*level "3��",
        '4 * '||level||' = '|| 4*level "4��",
        '5 * '||level||' = '|| 5*level "5��",
        '6 * '||level||' = '|| 6*level "6��",
        '7 * '||level||' = '|| 7*level "7��",
        '8 * '||level||' = '|| 8*level "8��",
        '9 * '||level||' = '|| 9*level "9��"

from dual 
connect by level <= 9;


select dan || '*' || num || ' = ' || dan*num ������
from (select level + 1 dan
        from dual
        connect by level <= 8),
     (select level num
        from dual
        connect by level <=9);
-----------------------------------------------------------------------


DDL (Data Definition Language)
- create
- alter
- drop
- rename
- truncate
- comment

�� ��������
����(privilege)
- Ư���� SQL���� ������ �� �ִ� �Ǹ�
- �ý��۱��� : �����ͺ��̽��� ������ �ټ� �ִ� ����
- ��ü���� : ��ü�� ����� �� �ִ� ����
- ROLE(��) : �������� �ο��� �� �ִ� ������ ��� ���� ��ü, ���� ������ ���� ���� ������ ����

- ���� ���� �ý��� ������ Ȯ��
select * from user_sys_privs;

- ���� ���� �Ǵ� ���� �ο��� ��ü������ Ȯ��
select * from user_tap_privs;

- ���� ���� ���� Ȯ��
select * from session_roles;

- ���� ���� �Ѿȿ� �ý��� ������ Ȯ��
select * from role_sys_privs;

- ���� ���� �Ѿȿ� ��ü������ Ȯ��
select * from role_tab_privs;

- �� ���� ���� ����
select * from user_users;

- �����ͺ��̽��� ������ ���� ����
select * from dba_users;

- �ý��۱����� ��������� �ο� �ߴ��� Ȯ��
select * from dba_sys_privs where grantee = 'HR';

- ��ü������ � �������� �ο� �ߴ��� Ȯ��
select * from dba_tab_privs where grantee = 'HR';

- �����ͺ��̽��� ������ �ѿ� ���� ���� Ȯ��
select * from dba_roles;

- �������� �ο��� �ѿ� ���� ���� Ȯ��
select * from dba_role_privs where grantee = 'HR';

����Ŭ �����ͺ��̽��� �����͸� �����ϴ� ����

        ����     ������
    database      OS
    tablespace    data file   -----�������� �з��ؼ� ����
    segment
    extent
    block        OS block
    block : ����Ŭ�� �ּ� INPUT / OUTPUT ����
select * from dba_data_files;
    
å = table(segment)
�� = extent
������ = block
���� = row

��������
create user james
identified by james
default tablespace users -- ���̺� ������ ����� �� �ִ� ���̺����̽�
temporary tablespace temp -- �����۾��� �޸𸮿��� �� �� �� ������ �����͸� �ӽ÷� �����ϴ� ����
quota 10m on users; -- tablespace�� ����� �� �ִ� ����

select * from dba_users where username = 'JAMES';
select * from dba_ts_quotas;

���Ѻο�
DCL(Data Control Language)
-grant :���� �ο�
-revoke : ���� ȸ��

- create session ������ �������� �ο��ϴ� ���
grant create session to james;

-- grant �ý��۱��� to �����̸�

select * from dba_sys_privs where grantee = 'james';

revoke create session from james;
-- revoke �ý��۱��� from �����̸�

���� ����
drop user james;

�� ���̺���� (object, segment)
- �����͸� �����ϴ� ��ü
- ��� ���� �����Ǿ� �ִ�.

���̺��� �����Ϸ��� �ΰ����� üũ�ؾ��Ѵ�.
1. ���̺��� �����Ҽ� �ִ� ����
    create table �ý��� ����
select * from session_privs;

2. ���̺��� �����Ҽ� �ִ� ���̺����̽� ����

select * from user_ts_quotas; -- �Ϲ� ���� ���忡�� Ȯ��
select * from dba_ts_quotas; -- sys ���忡�� Ȯ��

���̺��̸�, �÷��̸�, �����̸�, �ٸ���ü�̸�, ���������̸�
- ���ڷ� ����
- ������ ���̴� 1~30
- ����, ����, Ư������(_,#,$) ����
- ��ҹ��� �������� ����
- ������ ������ ������ ��ü�̸��� �ߺ��Ǹ� �ȵ�
- ������ ����� �� ���� (select, distinct, ...)

�÷��� Ÿ��
desc employees
- number(p,s) : �������� ���� Ÿ��, p : ��ü�ڸ��� , s: �Ҽ����ڸ���, number(5,2)
- varchar2(4000) : �������� ���� Ÿ��
- char(2000) : �������� ���� Ÿ��
- date : ��¥Ÿ��
- clob : �������� ���� Ÿ��, 4gbyte
- blob : �������� ���� ������Ÿ��,4gbyte
- bfile : �ܺ����Ͽ� ����� ���� ������Ÿ��, 4gbyte

create table hr.emp(
        id number(4),
        name varchar2(30),
        day date default sysdate);
        
���⼭ ���̺����̽� �����������ϱ� 
default tablespace�� ����ȴ�.

select * from user_users;

select * from user_tables where table_name = 'EMP';

- ���̺� ����
drop table hr.emp purge;

create table hr.emp(
        id number(4),
        name varchar2(30),
        day date default sysdate)
tablespace users;

select * from user_tables where table_name = 'EMP';

desc emp

DML (Data Manipulation Language)
- insert
- update
- delete
- merge (insert, update, delete �Ѳ����� ����)

TCL(Transaction Control LAnguage)
- commit(DML ������ ����)
- rollback (DML ������ ���)
- savepount(rollback ����� �����ִ� ǥ����)

Transaction : �������� DML�� �ϳ��� ��� ó���ϴ� �۾� ����

- insert ��
���̺� ���ο� ���� �Է��ϴ� SQL��
desc emp --insert �ϱ� ���� ���̺��� ������ Ȯ��
insert into ������.���̺��̸�(�÷�,�÷�,...)
values(������,������,...);

insert into hr.emp(id,name,day)
values(1,'ȫ�浿',to_date('2021-12-16','yyyy-mm-dd'));

select * from hr.emp; -- �̸�������. ������ ����Ȱ� �Ƴ� cmd���� sqlplus ���� �ȳ���

commit; -- ������ ����

insert into hr.emp(id, name, day) ----- �� �ؿ� Ŀ���� ���⼭���� transaction ���۵Ǵ°ž�
values(2, '����ȣ', sysdate);

select*from emp;

insert into hr.emp(id,name,day)
values(3, '����', to_date('2021-11-20','yyyy-mm-dd'));

select * from emp;

commit;

insert into hr.emp(id,name,day)
values(4,'����',to_date('2020-10-10','yyyy-mm-dd'));

select * from emp;
rollback;


-- day �÷��� default ���� �����Ǹ� default ���� �Էµȴ�
-- insert�� �����ϴ� ������ default������ ������ sysdate ������ �Էµȴ�.

insert into hr.emp(id,name)
values(5,'�̹���');

insert into hr.emp(id,name,day)
values(6,'�����',default);

select * from hr.emp;

- NULL �Է��ϴ� ���
insert into hr.emp(id,name,day)
values(7,'�ϵ�', null); -- day �÷��� default ���� �����Ǿ� �ִ��� null�� �켱������ ����.
select * from hr.emp -- �̸������ϴ½���!

insert into hr.emp(id,name,day)
values(8,null,null);

commit;
rollback; -- ���⼭ �ѹ��ؔf�� �ȵ��ư�. �̹� Ŀ�����ڳ�. �����ϰ�;����� insert�ϰ� Ŀ���ϱ� ���� �ѹ��߾�ߵ�


- update
�ʵ尪 ����

update ������.���̺�
set ������ �ʵ尡 �ִ� �÷� = ���ο� ��
where ����;

update hr.emp -- transaction ����
set day = to_date('2002-01-01');

select * from hr.emp;

update hr.emp
set day = to_date('2001-01-01','yyyy-mm-dd')
where id = 1;

select * from hr.emp;
commit;

-- �����÷��� �ʵ尪�� ����
update hr.emp
set name = 'Ŀ��', day = default
where id = 8;

rollback;
commit;

- delete
delete�� ���� ����°���. �ʵ尪�� ����� ������ update �� null ���� �־��ִ°ž�.

delete from ������.���̺�;
delete from ������.���̺� where �����ؾ��� ���� ����;

delete from hr.emp

delete from hr.emp
where id = 1;

- ���̺���, CTAS
���̺���, ��(������), ���������߿� not null �� ����

desc employees
drop table hr.emp purge;

create table hr.emp
as select*from hr.employees;

desc hr.emp

create table emp_20
as select employee_id, upper(last_name) name, salary
from employees
where department_id = 20;

drop table emp_20 purge;

select*from hr.emp;


-�����ʹ� �����ϰ� ���̺��� ������ ����

create table emp
as select * from employees where 1=2;

- insert subquery

select * from emp;

insert into emp
select * from employees;

drop table emp purge;

create table dept(
        id number,
        name varchar2(60),
        dept_id number,
        dept_name varchar2(30))
tablespace users;

insert into emp(id,name)
select employee_id,last_name||' '||first_name
from employees;

select * from emp;

ETL(Extraction, Transformation, Loading) �۾�

- update subquery

update emp
set name = null
where id = 100;
select*from emp where id =100;
commit;


update emp
set name = (select last_name||' '||first_name
            from employees
            where employee_id = 100)
where id = 100;

update emp
set dept_id = (select department_id
                from employees
                where employee_id = 101)
                
- correlated subquerty �̿��� update
update emp e
set dept_id = (select department_id
                from employees
                where employee_id = e.id);
                
                
update emp e
set dept_name = (select department_name
                from departments
                where department_id = e.dept_id);
                
- delete subquery

delete from emp where name like 'K%';
rollback;

[����93] emp ���̺� �ִ� ������ �� job_history�� �����ϴ� ����� ����

select *
from emp
where id in (select employee_id
            from job_history);
            
�ٵ� in�� �����ʾ�
�̷��� �ϴ°� ����

select *
from emp e
where exists (select 'x'
                from job_history
                where employee_id = e.id);
                
delete from emp
where exists (select 'x'
            from job_history
            where employee_id = e.id);
            

�ڵ� commit �߻��ҋ�
- DDL(create, alter, drop, rename, truncate, comment)
- DCL(grant, revoke)
- sqlplus ���� exit �����ϸ�
- sqlplus ���� �ٸ������� �����Ҷ�
DML �۾��� ������ �� �� ��������� transaction �����ϴ� ���� ����


�ڵ� rollback �߻��Ҷ�
- â�ݱ⸦ �ϸ� ���������� ����
- ��Ʈ��ũ�� ��ְ� �߻��ϴ� ���
-��ǻ�Ͱ� ������������ ����


select * from emp;
delete from emp;
select * from emp;

create table dept
as select * from department; ---------- delete �ϰ� ���� CTAS �ϸ� auto commit�� �Ǿ ���(rollback)�� �ȵ�

select * from dept;

insert into dept
select * from departments;
commit;
select * from dept;


savepoint : dml �۾��ÿ� rollback�� �����ִ� ǥ����
            commit, rollback �����ϸ�, transaction�� �����ϸ� ǥ���ڴ� �����

insert into emp_20(employee_id,last_name) ------- transaction ����
values(300,'ȫ�浿');
select * from emp_20;

savepoint a;

update emp_20
set last_name = '����ȣ'
where employee_id = 201;

select * from emp_20;

savepoint b;

delete from emp_20 where employee_id = 202;

select * from emp_20;

rollback; -- transaction ���� ���� ���� rollback

rollback to b; ------- savepoint ���� �ѹ�, ǥ���� b ���Ͽ� �ִ� delete�� ���



- ���� ���̺� insert
- source ���̺��� �����͸� �����ؼ� �������� target �� �����ϴ� SQL��
- ETL 
- source �ý��ۿ��� ������ �����ؼ� data warehouse �� �������� �۾�

1. ������ insert all

create table sal_history
as select employee_id, hire_date, salary from employees where 1 = 2;

select * from sal_history;

create table mgr_history
as select employee_id, manager_id, salary from employees where 1 = 2;

select * from mgr_history;

source table(employees)   ---------->target table(sal_history, mgr_history) ETL �۾�

��)
insert into sal_history(employee_id, hire_date, salary)
select employee_id, hire_date, salary
from employees;

select * from sal_history;

insert into mgr_history(employee_id, manager_id, salary)
select employee_id, manager_id, salary
from employees;

select * from mgr_history;

rollback;

------------��ó�� �ϸ� ��ȿ��. insert all �ع���

insert all
into sal_history(employee_id, hire_date, salary) values(id, day, sal)
into mgr_history(employee_id, manager_id, salary) values(id, mgr, sal)
select employee_id id, hire_date day, manager_id mgr, salary sal
from employees;

select * from sal_history;
select * from mgr_history

select employee_id hire_date, manager_id, salary
from employees;

2. ���� insert all
create table emp_history
as select employee_id, hire_date, salary from employees where 1=2;

create table emp_sal
as select employee_id, commission_pct, salary from employees where 1=2;

select * from emp_history;
select * from emp_sal;

insert all
when day < to_date('2005-01-01','yyyy-mm-dd') and sal >= 5000 then
    into emp_history(employee_id,hire_date,salary) values(id,day,sal)
when comm is not null then
    into emp_sal(employee_id,commission_pct,salary) values(id,comm,sal)
select employee_id id, hire_date day, salary sal, commission_pct comm
from employees;

select *
from emp_history e 
where exists (select 'x'
                from emp_sal
                where employee_id = e.employee_id);
                
3.���� insert first

create table sal_low
as select employee_id, last_name, salary from employees where 1=2;

create table sal_mid
as select employee_id, last_name, salary from employees where 1=2;

create table sal_high
as select employee_id, last_name, salary from employees where 1=2;

select * from sal_low;
select * from sal_mid;
select * from sal_high;


insert first
when sal < 5000 then
    into sal_low(employee_id, last_name, salary) values(id, name, sal)
when sal between 5000 and 10000 then
    into sal_mid(employee_id, last_name, salary) values(id, name, sal)
else
    into sal_high(employee_id, last_name, salary) values(id, name,sal)
select employee_id id, last_name name, salary sal
from employees;

select * from sal_low;
select * from sal_mid;
select * from sal_high;
rollback;

[����95] ����� �߿� �ٹ������� 15�� �̻� �̸鼭 �޿��� 10000�̻� �޿��� �޴� ������� 
emp_1���̺� ���, �̸�(last_name), �Ի���, �ٹ�����, �޿� ������ �Է��ϰ� 
�ٹ������� 15�� �̻� �̸鼭 �޿��� 10000�̸� �޿��� �޴� ������� 
emp_2���̺� ���, �̸�(last_name), �Ի���, �ٹ�����, �޿� ������ �Է��ϼ���.
create table emp_1(id number, name varchar2(30), day date, years number, sal number);
create table emp_2(id number, name varchar2(30), day date, years number, sal number);

insert first
when sal >= 10000 then
    into emp_1(id, name, day, years, sal)
    values(id, name, day, years, sal) 
else
    into emp_2(id, name, day, years, sal)
    values(id, name, day, years, sal)    
select employee_id id, last_name name, hire_date day, round(months_between(sysdate,hire_date)/12) years, salary sal
from employees
where months_between(sysdate,hire_date) / 12 >= 15;

rollback;

oltp (online transaction processing): �¶��� ����ڵ��� �����ͺ��̽��� DML�۾��� �����ϴ� ����
olap (online analytical processing): ������ �м��ϰ� ���ǹ��� ������ ������ ����

create table oltp_emp
as select employee_id, last_name, salary, department_id
from employees;

create table dw_emp
as select employee_id, last_name, salary, department_id
from employees
where department_id = 20;

select * from oltp_emp;
select * from dw_emp;

desc oltp_emp

-������ ���̺��� �÷��� �߰��ϴ� ���
alter table oltp_emp add flag char(1);

select * from oltp_emp where employee_id in (201,202);

update oltp_emp
set flag = 'd'
where employee_id = 202;

update oltp_emp
set salary = 20000
where employee_id = 201;

commit;

[����96] oltp_emp���ִ� ����� �� dw+emp�� �����ϴ� ����� ���� ���
select *
from oltp_emp o
where exists (select 'x'
                from dw_emp
                where employee_id = o.employee_id);
                

[����97] dw_emp�� �ִ� ����� �� oltp_emp�� �����ϴ� ������� oltp_emp �� �޿� �������� 10% �λ�
select *
from dw_emp d
where exists (select 'x'
                from oltp_emp
                where employee_id = d.employee_id);

select * from oltp_emp where employee_id in (201,202);

update dw_emp d
set salary = (select salary*1.1
                from oltp_emp
                where employee_id = d.employee_id);
rollback;
[����98] dw_emp�� �ִ� ����� �� oltp_emp�� �����ϴ� ����� �� falg ���� 'd'�� ��� ����
select *
from dw_emp d
where exists(select 'x'
                from oltp_emp
                where employee_id = d.employee_id
                where flag = 'd');
                
delete from dw_emp d
where exists (select 'x'
                from oltp_emp
                where employee_id = d.employee_id
                and flag = 'd');
rollback;
                
[����99] oltp_emp���̺� �ִ� ������ �� dw_emp���̺� ���� �����͵��� dw_emp���̺� �Է�


select *
from oltp_emp o
where not exists (select 'x'
                    from dw_emp
                    where employee_id = o.employee_id);
                    
insert into dw_emp(employee_id, last_name, salary, department_id)
select employee_id, last_name, salary, department_id
from oltp_emp o
where not exists (select 'x'
                    from dw_emp
                    where employee_id = o.employee_id);
rollback;

- merge
insert, update, delete ���� �Ѳ����� ����

select * from dw_emp; ----- target table(���� update,delet,insert)
select * from oltp_emp;  ----- source table

merge into dw_emp d ---- target table
using oltp_emp o ---- source table
on (d.employee_id = o.employee_id) --- ��������(Ű ���� ���� ��)
when matched then ---- Ű ���� ��ġ�� �Ǹ�
    update set 
        d.salary = o.salary*1.1
    delete where o.flag = 'd'
when not matched then
    insert(d.employee_id, d.last_name, d.salary, d.department_id)
    values(o.employee_id, o.last_name, o.salary, o.department_id);
    
rollback;

[����100] emp_copy ���̺� �ִ� department_name ���� 
            departments �� department_name ���� �̿��ؼ� �������ּ���
create table emp_copy as select * from employees;
alter table emp_copy add department_name varchar2(30);

select * from emp_copy;


select *
from departments d
where exists(select 'x'
            from emp_copy
            where department_id = d.department_id);
            
1)update
update emp_copy e
set department_name = (select department_name
                        from departments
                        where department_id = e. department_id);
rollback;

2) merge

merge into emp_copy e
using departments d
on(e.department_id = d.department_id)
when matched then
        update set
            e.department_name = d.department_name;
            
rollback;

create user ora
identified by ora
default tablespace users
temporary tablespace temp
quota 10m on users;

grant create session to ora

select * from tab;

drop table dept purge;

create table emp
as select employee_id, last_name, salary
from employees;

grant select on hr.emp to ora;

create table dept
as select * from hr.departments;


���� �ֱ�!
grant select on hr.emp to ora;
grant insert on hr.emp to ora;
grant update on hr.emp to ora;
grant delete on hr.emp to ora;

���� ȸ��!
revoke delete on hr.emp from ora;

�Ѳ����� �̷��� �� ���� ����
revoke select, insert, update on hr.emp from ora;

drop table emp purge;

create table emp1(id number, name varchar2(30), day date);

desc emp1

select * from user_tables where table_name = 'emp1';
select * from user_tab_columns where table_name = 'emp1';


# �÷��� �߰�
alter table emp1 add job_id varchar2(20);
desc emp1

# �÷��� Ÿ��, ũ�⸦ ����
desc emp1

alter table emp1 modify job_id varchar2(30);
desc emp1
alter table emp1 modify job_id char(20);
desc emp1
alter table emp1 modify job_id number; -- ���� �����Ͱ� ����Ǿ��� ��쿡�� Ÿ�� ������ ������ �߻� �� �ִ�.
desc emp1


# �÷� ����
alter table emp1 drop column job_id;
desc emp1


�� ��������
- ���̺��� �����Ϳ� ���� ��Ģ�� �����.
- �����Ϳ� ���� ǰ���� ����Ű�� ���ؼ� �����.

1. primary key
- ���̺��� ��ǥŰ
- unique, null �� ��� X
- ���̺� �� �ϳ�
- �ڵ����� unique index ����

- �������� ���� Ȯ��
select * from user_constraints where table_name = 'emp1';
select * from user_cons_columns where table_name = 'emp1';


- �ε��� ���� Ȯ��
select * from user_indexes where table_name = 'emp1';

- �������� �߰�

alter table emp1 add constraints emp_id_pk primary key(id);

�Ǵ�

alter table emp1 add primary key(id) -- �������� �̸��� ������� ������ �ڵ����� sys_c~~ �������� ����

- �������� ����

alter table emp1 drop constraints emp_id_pk;

�Ǵ�
alter table emp1 drop primary key;

insert into emp1(id, name, day) values(1,'ȫ�浿',sysdate);
insert into emp1(id, name, day) values(1,'����ȣ',sysdate); --����. �����̸Ӹ� Ű-> ������
insert into emp1(id, name, day) values(null,'ȫ�浿',sysdate); -- ����. �����̸Ӹ� Ű -> null�� �ȵ�
select * from emp1;

rollback;

alter table emp1 drop primary key;

select * from user_constraints where table_name = 'EMP1';

insert into emp1(id, name, day) values(1,'ȫ�浿',sysdate);
insert into emp1(id, name, day) values(1,'����ȣ',sysdate); 
insert into emp1(id, name, day) values(null,'�����',sysdate);

---�̷��� ���� ������ �ߺ�, null�� �߰��ǰ� �̷��� ���� ������ ǰ�� ������ �׷��� �����̸Ӹ� Ű �����ϴ°Ŷ��

rollback;

create table dept1(dept_id number, dept_name varchar2(30));

alter table dept1 add constraints dept_pk primary key(dept_id);
- ������ ���������� �������� �̸��� ������ �̸����� �����ؾ� �Ѵ�.

select * from user_constraints where table_name = 'DEPT1';

insert into dept1(dept_id, dept_name) values(10, '�ѹ���');
insert into dept1(dept_id, dept_name) values(20, '�м���');
commit;

select * from dept1;

select * from emp1;
alter table emp1 add dept_id number;
select * from emp1;

insert into emp1(id, name, day, dept_id) values(1,'ȫ�浿',sysdate,10);
insert into emp1(id, name, day, dept_id) values(2,'����ȣ',sysdate,30);
commit;

������� ����, �μ� ���� ���
select e.id, e.name, d.dept_name
from emp1 e, dept1 d
where e.dept_id = d.dept_id(+);

delete from emp1;
select * from emp1;

commit;

select * from dept1;


2. foreign key
- �ܷ�Ű, �������Ἲ ��������
- ������ ���̺��̳� �ٸ� ���̺��� primary key �Ǵ� unique key ���������� �����Ѵ�.
- ������ ǰ��
- �ߺ��� ���, null �� ���
- ���ӵǴ� ���� ������ �����Ѵ�.

alter table emp1 add constraint emp_dept_id_fk
foreign key(dept_id) references dept1(dept_id);

select * from user_constraints where table_name in ('EMP1', 'DEPT1');
select * from user_cons_columns where table_name in ('EMP1', 'DEPT1');

insert into emp1(id, name, day, dept_id) values(1,'ȫ�浿',sysdate,10);
insert into emp1(id, name, day, dept_id) values(2,'����ȣ',sysdate,30); -- ���� : primary key�� ���� Ű���� �Է��� �� ����
insert into emp1(id, name, day, dept_id) values(2,'����ȣ',sysdate,null);

select * from emp1;
commit;
desc dept1

select * from dept1;

delete from dept1 where dept_id = 10; -- ����. �����ϰ� �ִ� �����Ͱ� �ֱ� ������ ������ �� ����. �� �긦 parent�� �ϴ� child record�� �־�

delete from dept1 where dept_id = 20; -- ����. �����ϰ� �ִ� child record�� ���ŵ�

rollback;

alter table dept1 drop primary key; // ����. �̰� reference �ϰ� �ִ� �ֵ��� �����ϱ�. foreign key ���������� �����ϰ� �ֱ⶧���� �����߻�

1) alter table emp1 drop constraint EMP_DEPT_ID_FK;

2) alter table dept1 drop primary key;

�� �ΰ��� �ѹ��� �ϴ°�

alter table dept1 drop primary key cascade; - cascade�� ����ϸ� foreign key ���������� ���� �����ϰ� primary key ���������� �����Ѵ�.

select * from user_constraints where table_name in ('EMP1', 'DEPT1');


3) unique ��������
- ������ ���� üũ
- null ���
- �ڵ����� unique index ����

select * from user_constraints where table_name = 'DEPT1';
select * from dept1;

dept ���̺� �ִ� dept_name�� ������ ���� �Է��� �� �ֵ��� unique ���������� �߰�����.
alter table dept1 add constraint dept_name_uk unique(dept_name);
select * from user_constraints where table_name = 'DEPT1';
select * from user_cons_columns where table_name = 'DEPT1';
select * from user_indexes where table_name = 'DEPT1';
select * from user_indexes where table_name = 'DEPT1';
select * from user_ind_columns where table_name = 'DEPT1';

select * from dept1;
insert into dept1(dept_id, dept_name) values(30,'�ѹ���'); - unique �������� ����. �� ���̺� ������ �ѹ��� ������ �ϴ°� unique Ű��!! �̹� �ѹ��� �����ϱ� �߰� �ȵǴ°���.
insert into dept1(dept_id, dept_name) values(30,NULL); - ����

select * from dept1;

rollback;

update dept1
set dept_name = '�ѹ���'
where dept_id = 20;

# unique key ����
alter table dept1 drop constraint dept_name_uk;

# unique key ����
alter table dept1 add constraint dept_name_uk unique(dept_name);
select * from user_constraints where table_name = 'DEPT1'; 

# unique key ����

alter table dept1 drop unique(dept_name);

4. check ��������
- ���ǿ� ���� ture �� ���, insert, update �� �� �ֵ��� ����� ��������
- null ����Ѵ�. �ߺ��Ǵ� �� ����Ѵ�.

select * from emp1;
alter table emp1 add sal number;

alter table emp1 add constraint emp_sal_ck check (sal >= 1000);
select * from user_constraints where table_name = 'EMP1';

insert into emp1(id,name,day,dept_id,sal)
values(3,'Ŀ��',sysdate,20,500); -- check ���ǿ� ���ݵǴϱ� �ȵ�.

update emp1
set sal = 600
where id = 1;

insert into emp1(id,name,day,dept_id,sal)
values(3,'Ŀ��',sysdate,20,5000);

rollback;

# check �������� ����
alter table emp1 drop constraint emp_sal_ck;

# check �������� ����
alter table emp1 add constraint emp_sal_ck check(sal >= 1000 and sal <= 5000);

select * from user_constraints where table_name = 'EMP1';

rollback;

5. not null ��������
- null ���� ����� �� ���� ��������
- not null ���������� modify �θ� �߰��ؾ��Ѵ�


select * from user_constraints where table_name = 'DEPT1';
alter table dept1 add constraint dept_name_uk unique(dept_name);
insert into dept1(dept_id, dept_name) values(30, null);
rollback;

alter table dept1 add constraint dept_name_nn not null(dept_name);

alter table dept1 modify dept_name constraint dept_name_notnull not null;

select * from user_constraints where table_name = 'DEPT1';
select * from user_cons_columns where table_name = 'DEPT1';

insert into dept1(dept_id, dept_name) values(30,'�ѹ���'); -- unique �������� ����.
insert into dept1(dept_id, dept_name) values(30,null); -- not null �������� ����

select * from user_constraints where table_name = 'DEPT1';
select * from user_cons_columns where table_name = 'DEPT1';

- not null �������� ����
alter table dept1 drop constraint dept_name_notnull;
�Ǵ�
alter table dept1 modify dept_name null;

desc dept1

drop table emp1 purge;
alter table dept1 add constraint dept_dept_id_pk primary key(dept_id);

create table emp1(
        id number constraint emp_id_pk primary key, -- ������ ����
        name varchar2(30) constraint emp_name_nn not null, --not null ���������� ������ ���Ǹ� ����
        sal number,
        dept_id number constraint emp_dept_id_fk references dept1(dept_id), -- ������ ������ ���� foreign key Ű���� �Ƚ�. ���̺����� �Ҷ� ��.
        constraint emp_name_uk unique(name), -- ���̺� ���� ����, �������� �ڿ� �÷� (name) ���� ����ߴ�
        constraint emp_sal_ck check(sal between 1000 and 5000));
        

select * from user_constraints where table_name in ('EMP1','DEPT1');

drop table emp1 purge;


---------------------------------------�������� �̰Ŷ� ���غ�-------------------
create table emp1(
        id number constraint emp_id_pk primary key, -- ������ ����
        name varchar2(30) constraint emp_name_nn not null, --not null ���������� ������ ���Ǹ� ����
        sal number,
        dept_id number,
        constraint emp_name_uk unique(name), -- ���̺� ���� ����, �������� �ڿ� �÷� (name) ���� ����ߴ�
        constraint emp_sal_ck check(sal between 1000 and 5000)
        constraint emp_dept_id_fk foreign key(dept_id) references dept1(dept_id)); --���̺� ������ foreign key �������� �� ���� foreign key��°� �� ���ߴ�
        
�� ���̺� �̸� ����

1) ��� 1
drop table emp_copy purge;
rename emp1 to emp_copy;
select * from emp_copy;

select * from user_constraints where table_name = 'EMP_COPY';
rollback;

2) ��� 2
alter table emp_copy rename to copy_emp;


�� ���̺� �̸� ����
desc copy_emp

alter table copy_emp rename column id to emp_id;

�� �������� �̸� ����

select * from user_constraints where table_name = 'COPY_EMP';
alter table copy_emp rename constraint emp_id_pk to copy_emp_id_pk;

select * from user_indexes where table_name = 'COPY_EMP';

�� INDEX �̸� ����

alter index emp_id_pk rename to copy_emp_idx;


�� flashback table

show recyclebin

select * from user_recyclebin;

purge recyclebin

create table emp_2022
as select * from employees;

drop table emp_2022; purge; ----------�̰� ������ �����ϴ°ž� ����!

show recyclebin

select * from user_recyclebin;

flashback table emp_2022 to before drop;

select * from emp_2022;

select * from user_constraints where table_name = 'EMP_2022';

create table new as select * from employees;
alter table new add constraint new_id_pk primary key(employee_id);
select * from user_constraints where table_name = 'NEW';
drop table new;
select * from user_recyclebin;

������ ���̺�� ���� �����ϴ� ���̺� �̸��� �����Ҷ� ������

�׷��� �̷��� rename to �߰�
flashback table emp_2022 to before drop rename to 'emp_2022_1';

select * from user_recyclebin;
create table new as select * from employees;
drop table new;
select * from user_recyclebin;
-recyclebin �ȿ� ������ ���̺� �̸��� ���� ��쿡�� ���� �ֱٿ� ������ �� �����Ѵ�.
flashback table new to before drop;

alter session set time_zone = '-05:00'; -- ���� ������ ������ timezone ����
select sysdate, systimestamp, current_date, current_timestamp, localtimestamp
from dual;

timestamp with local time zone : ���� ������ ���� ��¥ �ð��� �ڵ� ����ȭ ����
interval yeat to month : �Ⱓ�� ��Ÿ���� ��¥ Ÿ��, ���, ������
interval day to second : �Ⱓ�� ��Ÿ���� ��¥ Ÿ��, �ϼ�, �ú���.����9�ڸ�

create table time_test(
        a date,
        b date,
        c timestamp(9),
        d timestamp(9) with time zone,
        e timestamp with local time zone);

desc time_test        

insert into time_test(a,b,c,d,e)
values(sysdate, current_date, localtimestamp,current_timestamp,localtimestamp);
commit;

select * from time_test;

alter session set time_zone = '+08:00'; -- ���� ������ ������ timezone ����
select sysdate, systimestamp, current_date, current_timestamp, localtimestamp
from dual;

char -> timestamp ����ȯ
select to_timestamp('2022-01-04 11:30:00','yy-mm-dd hh24:mi:ss') from dual;

char -> timestamp with local time zone ����ȯ
select to_timestamp('2022-01-04 11:30:00.123456789 +09:00','yy-mm-dd hh24:mi:ss.ff tzh:tzm') from dual;

create table time_test_1(
        a interval year(3) to month,
        b interval day(3) to second);
        

char -> interval year to month ����ȯ�Լ�, to_yminterval('���-������')
select to_yminterval('10-11') from dual;
select sysdate + to_yminterval('10-11') from dual;
select add_months(sysdate,120) from dual; -- �̰Ŷ� �ؿ����� ����
select sysdate + to_yminterval('10-00') from dual;

char -> interval day to second ����ȯ�Լ�
select localtimestamp + to_dsinterval('100 10:00:00') from dual;

��¥ + ����(�ϼ�) = ��¥
��¥ - ����(�ϼ�) = ��¥
��¥ - ��¥ = ����
��¥ + �ð� = ��¥, �ð�
��¥ + ��¥ = ����
��¥ + interval year to month = ��¥
��¥ + interval day to second = ��¥, �ð�

[����101] �� ����� last_name, hire_date �� �ټ� ������ ����ϴ� query�� �ۼ�
����� �ټ� ������ 5�� �̻��� ��� '5 years of service'�� ���
����� �ټ� ������ 10�� �̻��� ��� '10 years of service'�� ���
����� �ټ� ������ 15�� �̻��� ��� '15 years of service'�� ���
� ���ǵ� ��ġ���� ������ 'maybe next year!' ���
case, to_yminterval ���

select last_name, hire_date,
        case
          when sysdate - to_yminterval('15-0') >= hire_date then '15 years of service'
           when sysdate - to_yminterval('10-0') >= hire_date then '10 years of service'
            when sysdate - to_yminterval('5-0') >= hire_date then '5 years of service'
            else 'maybe next year!'
        end "awards"
from employees;

�� view
- �ϳ� �̻��� ���̺��� �ִ� �����͸� �������� ó���ϴ� ������Ʈ�̴�.
- ���� select ���� ������ �ִ� ��ü
- ���� access(���� �����Ͱ� �ִ� �����͸� access�ϴ°� �ƴϰ� �並 ���ؼ� ���̺��� �����Ѵ�.)
- �並 �����Ϸ��� create view �ý��۱��� �־���Ѵ�.

select * from user_sys_privs; --dba(sys)�� ���� �������� �ý��۱��� Ȯ��
select * from role_sys_privs; --dba(sys)�κ��� ���� ���ؼ� ���� �ý��۱��� Ȯ��
select * from session_privs; -- ����Ŭ�� �α��� �� �� ���� ���� �ý��� ���� Ȯ��
select * from user_ts_quotas; -- dba(sys)�� ���� ���� Ư���� ���̺����̽� ����� �� �ִ� ����

create view emp_view
as select employee_id, last_name, email, job_id, department_id
from employees;

emp_view select �ϴ� ���� �� �����ÿ� ������� 
select employee_id, last_name, email, job_id, department_id
from employees; �̰� ���������� ����ȴ�.

select *
from emp_view;

grant select on hr.emp_view to ora;

select * from user_tab_privs;

create or replace view emp_view
-- or replace ���� �̸����� �䰡 ������ drop�ϰ� create �ϴ� �ɼ�

[���� 102] �μ��̸��� �Ѿױ޿�, ��ձ޿��� access�ϴ� dept_sum_sal �並 �������ּ���.

create or replace view dept_sum_sal
as
select d.department_id, e.sumsal, e.avgsal
from (select department_id, sum(salary) sumsal, avg(salary) avgsal
        from employees
        group by department_id) e, departments d
where e.department_id = d.department_id;

drop view dept_sum_sal;

�ܼ���
- ��ȿ� select���� ���̺��� �ϳ��� �ִ� ���, �� ���ι����� ���� ���
- �Լ��� ������� �ʴ� ���
- �並 ���ؼ� dml�۾��� ������ �� �ִ�.

���պ�
- �� �ȿ� select���� ���̺��� ������ ����� ���, �� ���ι����� �ִ� ���
- �Լ��� ����� ���
- �並 ���ؼ� dml �۾��� ������ �� ����.

drop table test purge;

create table test
as select employee_id id, last_name name, salary sal
from employees
where department_id = 20;

select * from test;

create or replace view test_view
as select * from test;

select * from test_view; -- �ܼ���

- �ܼ���� �並 ���ؼ� insert �� �� �ִ�.
insert into test_view(id,name,sal) values(300,'ȫ�浿',1000);
select*from test_view;
select*from test;

- �ܼ���� �並 ���ؼ� update �� �� �ִ�.
update test_view
set name = '����ȣ'
where id = 201;

select * from test_view;

rollback;

- �ܼ���� �並 ���ؼ� delete �� �� �ִ�.
delete from test_view;
select * from test_view;

- �ٵ� �ܼ��信�� with read only �������� ���̸� : �ܼ��信�� dmls �۾��� ������ �� ������ �ϱ� ���� �ɼ�. �� select�� �����ϵ��� ���� ��
- with check option constraint test_view_dept_20_ck; -- check ��������

- with check option : �信�� check ���������� �����ϴ� �ɼ�
- check �������� �� : �� ������ select ���� where ���� �ִ� ������ check �������� ���� �ȴ�.

create or replace view test_view
as select id, upper(name) name, sal * 1.1 sal
from test;

- ���պ�� �並 ���ؼ� insert �� �� ����.
- ���պ�� �並 ���ؼ� update �� �� ����.
insert into test_view(id,name,sal) values(300,'ȫ�浿',1000);

- ���պ�� �κ������� �並 ���ؼ� delete �� �� �ִ�. (delete ��ŭ�� �κ������� ����)
- ���ι����� �ִ� ��쿡�� delete �ȵ�

delete from test_view;

�� sequence
- �ڵ��Ϸù�ȣ�� �����ϴ� ��ü
- sequence ��ü�� �����Ϸ��� create sequence �ý��۱����� �ʿ��ϴ�.

select * from session_privs;

create sequence id_seq;
select * from user_sequences where sequence_name = 'ID_SEQ';

create table seq_test(id number, name varchar2(30), day timestamp);
insert into seq_test(id,name,day) values(id_seq.nextval,'ȫ�浿',localtimestamp);
insert into seq_test(id,name,day) values(id_seq.nextval,'����ȣ',localtimestamp);

- sequence�̸�.nextval : �����÷�, �����밡���� ��ȣ�� ����
- sequence�̸�.currval : �������� ��ȣ�� �������ش�.

rollback;

insert into seq_test(id,name,day) values(id_seq.nextval,'ȫ�浿',localtimestamp);
insert into seq_test(id,name,day) values(id_seq.nextval,'����ȣ',localtimestamp);

commit;

select * from user_sequences where sequence_name = 'ID_SEQ';

- sequence ���� 

�� synonym
- �䰴ü �̸��� ª�� �̸����� ����ϴ� ��ü
- create synonym �ý��۱����ʿ�
- ��� �������� ����Ҽ� �ִ� synonym�� �����Ϸ��� create public �ý��� ������ �־���Ѵ�.

- public synonym ����
create public synonym emp for hr.employees;

select * from session_privs;

drop public synonym emp; -- create ������ �ִ��� ���� ����� ������ ���� drop ���� ������.

select *
from hr.employees
where employee_id = 100;

select * from user_tables where table_name = 'EMPLOYEES'; -- ���� �����

select * from dba_data_files; -- ������ �����

�� Data access method - ����� �� ���� �ش� �ƴϱ� ��
å = ���̺�
������ = block(4k, 8k, 16k, 32k)
���� = ��(row)
Ư���� �ܾ�(����Ŭ)�� ã�ƾ� �ϸ�? �ٵ� ������ ���ٸ�?

- full table scan : ���̺��� ù��° ����� ������ ����� access�ϴ� ���
- rowid scan : ���� ������ �ּҸ� ������ ã�� ���, ������ access ��� �߿� ���� ���� ���
        1) BY USER ROWID SCAN
            select * from employees where rowid = 'AAAEAbAAEAAAADNAAA';
        2) BY INDEX ROWID SCAN
        select * from employees where employee_id = 100;

rowid : ������ row �ּ�
AAAEAb(6�ڸ�) : data object id
AAE(3�ڸ�) : file id
select * from dba_data_file;
AAAADN(6�ڸ�) : block id
AAA(3�ڸ�) : row slot id

optimizer : SQL ���� �����ϱ� ���� �����ȹ�� �����.

�� INDEX
- by index rowid scan ����� ����ؼ� �˻��ӵ��� ���̱� ���ؼ� ����ϴ� ��ü.
- �ε����� �̿��ؼ� ���� �˻��ϸ� i/o(�Է�/���)�� ���� �� �ִ�.
- �ε����� ���̺���� ���������� �����ȴ�.
- �ε����� ����Ŭ�� �ڵ����� ���������Ѵ�.
- primary key, unique ���������� �����ϰ� �Ǹ� unique index �� �ڵ����� �����ȴ�.
- �������� �����Ѵ�.



select * from user_indexes where table_name = 'EMPLOYEES';

select * from user_ind_columns where table_name = 'EMPLOYEES';

employees �� department_id �� �ߺ��Ǿ� ���ݾ�. �׷��� ���� �ε��� ���� department_id �κ��� uniqueness�� nonunique�� �Ǿ�����.

select * from employees;

drop table emp purge;
create table emp as select * from employees;

select * from user_constraints where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';

select * from emp where employee_id = 100; -- full table scan�� �߻��ؼ� �ð� ��û �ɸ�����
select rowid, employee_id from emp;
select * from emp where rowid = 'AAAFBGAAEAAAAFTAAA'; -- by user rowid scan ���� ���� ����̾�.

- primary key ���� ���� �߰�
alter table emp add constraint emp_id_pk primary key(employee_id);
select * from user_constraints where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';

select * from emp where employee_id = 100;

emp_id_pk �ε���
select employee_id, rowid
from emp
order by 1;

select * from emp where employee_id = 100; -- by index rowid scan : rowid�� ã�� �������̺��� rowid�� �´� Ű���� ã��. ����.

select * from emp where last_name = 'King'; -- full table scan ����.

-nonunique index ����
create index emp_last_name_idx on emp(last_name);

select * from emp where last_name = 'King'; -- by index rowid scan
1) King�� �ش��ϴ� rowid�� emp_last_name_idx�� ���� ã�´�.
2) ã�� rowid�� ������ emp ���̺� ã�� ����.
3) �̰� �ݺ��ϴٰ� ������ ����.
4) ������� �������� ����.

- primary key �������� ����
select * from user_constraints where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';

alter table emp drop primary key;

- nonunique index
create index emp_id_idx on emp(employee_id);
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';
select * from emp where employee_id = 100;

drop index emp_id_idx;

employee_id�� �����Ѱ��� ��������ϱ� ������ũ ���� ����ũ �ε����� ����������

create unique index emp_id_idx on emp(employee_id);
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';
select * from emp where employee_id = 100;

unique index �����ϰ� �Ǹ� employee_id �÷��� ���� ���� �Է� x
- unique �������� �� �� ���� ȿ��

drop table test purge;
create table test(id number, name varchar2(30));
create unique index test_id_idx on test(id);

insert into test(id,name) values(1, user); -- user �Լ��� ���� insert�� �����ϴ� ����Ŭ 

unique �������� �Ȱɾ��µ��� �ɸ���ó�� �ɷ�

rollback;

drop table test purge;

- �����ε���
drop index emp_last_name_idx;

create index emp_last_first_name_idx on emp(last_name, first_name);

select * from user_ind_columns where table_name = 'EMP';

select last_name, first_name, rowid
from emp
order by 1;

select *
from emp
where last_name = 'King'
and first_name = 'Steven';

�� comment
���̺�� �÷��� ����(�ּ�))�� �����.

drop table emp purge;

create table emp as select * from employees;

select * from user_tab_comments where table_name = 'EMP';

select * from user_col_comments where table_name = 'EMP';

- ���̺� �ּ� ����
comment on table emp is '������� ���̺�';
select * from user_tab_comments where table_name = 'EMP';

- �÷� �ּ� ����
comment on column emp.employee_id is '���'

- ���̺� �ּ� ����
comment on table emp is '';
select * from user_tab_comments where table_name = 'EMP';

- �÷� �ּ� ����
comment on column emp.employee_id is '';

delete from emp;

select * from emp;

rollback;

select * from user_segments where segment_name = 'EMP';

UNDO tablespace �ϴ���?
dml �۾��� �������� �����ϴ� ����
��?
select salary from hr.employees where employee_id = 100;

update hr.employees
set salary = 2400
where employee_id = 100;

rollback; - �ѹ� �ϱ� ���ؼ� �������� �������� ����ؾ��� �װ� �ٷ� UNDO tablespace
        - bin�� ���� �ƴ϶� ���̺� Ʋ ��ü�� DROP �� �� �����ϴ� ���̰�;
        
�̷��� UNDO ���ٰ� ������ �ʰ� �ٷ� ���ִ� �� �ٷ�
�� truncate
���̺��� ���� �� �����ϴ� ������ delete ���� ��������� truncate���� ��������� �ʱ���·� �����. ����� �� ����. delete�� rollback �� �� ���ڳ�
undo�� ���� ����.
rollback�� ������ ���� �ѹ� �ȵ�


truncate table emp;

�� �м��Լ�

select sum(salary)
from employees;

select employee_id, department_id, salary, 691416, salary - 691416
from employees;

select employee_id, department_id, salary, sum(salary)
from employees;

select employee_id, department_id, salary, sum(salary) over(), salary - sum(salary) over()
from employees;

select employee_id, department_id, salary, max(salary) over(), salary - max(salary) over()
from employees;

- ������
select employee_id, department_id, salary, sum(salary) over(order by employee_id) ������
from employees;

select employee_id, department_id, salary, sum(salary) over(partition by department_id) �μ�������
from employees;

select employee_id, department_id, salary, sum(salary) over(partition by department_id order by employee_id) �μ���������
from employees;

select employee_id, department_id, salary, count(*) over(partition by department_id) �μ����ο���
from employees;

select employee_id, department_id, salary, 
    count(*) over(partition by department_id) �μ����ο���,
    max(salary) over(partition by department_id) �μ����ְ�޿�,
    min(salary) over(partition by department_id) �μ��������޿�
from employees;

TOP-N �м�
�ְ� �޿��� �߿� 10������ ���

1) �޿� ���� �������� ���� =
select employee_id, salary
from employees
order by salary desc;

2) ������ ����� ������ 10�� ������ �ؾ��Ѵ�.

- rownum : fetch��ȣ�� �����ϴ� �����÷�
select rownum, employee_id
from employees;


select employee_id, salary
from employees
where rownum <= 10 - �̷��� �����ϸ� �����ϰ� 10�� �̾�
order by salary desc; - �״����� 10�� �̾Ƴ��� ������ ���� . ������ �߸���. where ���Ͷ�. �׷��� ������ ���� ��Ű�� ��ŷ �̰���ݾ�


����!! �츮ȸ�翡 �Ȱ��� �޿��ڰ� ���ٶ�� �ϸ� �Ʒ��� ���� query���� �����ص� �ǰ�����, 
        ���� �޿��ڵ��� �ִٰ� �ϸ� �ؿ�ó�� top-n �м��ϸ� �ȵ���. 11������ ©������ ���� �����ϱ�
select *
from (select employee_id, salary
    from employees
    order by salary desc)
where rownum <= 10;

�׷��� RANK �� DENSE_RANK ��ߵ�

- rank() : ������ ���ϴ� �Լ�, ������ ������ ������ �����ϰ�, ���� ����
- dense_rank() : ������ ���ϴ� �Լ�, ������ ������ �־ ������ ����.

select rank() over(order by salary desc) "rank",
        dense_rank() over(order by salary desc) "dense_rank",
        employee_id, salary
from employees;


select *
from (select dense_rank() over(order by salary desc) "dense_rank",
        employee_id, salary from employees)
where dense_rank <= 10;

�� with �� (ANSI ǥ�ؾƴ�. ����Ŭ)
- �ι��̻� �ݺ��Ǵ� select ���� query block(�������̺�) ���� ���
- ���� ���

with
dept_cnt as (select department_id, count(*) cnt
            from employees
            group by department_id)
select *
from dept_cnt
where cnt = (select max(cnt)
                from dept_cnt);

alter session set nls_date_format = 'yyyy-mm-dd'

select hire_date
from employees;