select * from tab;
select * from employees

/*
select employee_id, last_name, salary
from employees;
*/

select employee_id, salary
from employees;

desc employees
이름             널?       유형           
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

1번 공백
select employee_id "EMP#", last_name||' ' ||first_name "Employee Name"
from employees;

2번 공백, 오류
select last_name||', '|| job_id "Employee and Title"
from employees;

3번 공백, 오류
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

 

instr -> 문자 위치

 

select last_name, instr(last_name, 'a', 1,1), instr(last_name, 'a',1,2), instr(last_name, 'a',1,3)

from employees;

 

select last_name

from employees

where instr(last_name, 'a',1,2)>2

 

select last_name

from employees

where last_name like '%a%a%';

 

substr -> 시작점부터 몇개만 추출

 

select last_name, substr(last_name,1,2)

from employees;

 

select last_name, substr(last_name,1,2), substr(last_name,2,2)

from employees;

 

substr에서 뒤에서부터 몇개 뽑고싶으면 -입력

 

select last_name, substr(last_name,-2,2)

from employees;

 

select substr('가나다라마바사',1,2), substrb('가나다라마바사',1,3)

from dual;

 

-trim : 접두와 접미에 연속되는 해당문자를 제거

 

select trim('a' from 'aabbacaa')

from dual;

 

select length('  aaa              '), length(trim('  aaa      '))

from employees;

 

- ltrim : 왼쪽 연속문자 제거 rtrim: 오른쪽연속문자 제거

 

select ltrim('aabacaa','a'), rtrim('aabacaa','a')

from dual;

 

[문제 14]

select initcap(last_name), length(last_name)

from employees

where instr(last_name,'J',1,1)=1

Or instr(last_name,'A',1,1)=1

or instr(last_name,'M',1,1)=1

order by last_name asc;

 

이렇게 할수도있고 substr로

 

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

 

[문제 15] instr 잘써야대

 

select *

from employees

where department_id = 50

and instr(last_name, 'a',2,1)=2;

 

select *

from employees

where department_id = 50

and substr(last_name, 2,1)= 'a';

 

last_name like '_a%'

 

- replace 어떤거 기존거 바꿀거

          공백 넣거나 없앨때도 쓰임

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

 

[문제16]

select salary, lpad('*',(salary/1000),'*') "STAR"

from employees;

 

select salary, lpad(' ',(salary/1000+1),'*') "STAR"

from employees;

 

 

문자함수

lower, upper, initcap, length, lengthb, substr, substrb, instr, replace, trim, ltrim, rtrim, lpad, rpad, concat

 

연산자

like

 

숫자함수

round -> 소수점 그자리까지 반올림해서 표현해

 

select round(45.926,2), round (45.926,1), round(45.926,0), round(45.926,-1), round(45.926,-2), round(55.926, -2)

from dual;

 

trunc -> 소수점 그자리 까지 살리고 나머지 버려(내림)

 

select trunc(45.926,2), trunc (45.926,1), trunc(45.926,0), trunc(45.926,-1), trunc(45.926,-2), trunc(55.926, -2)

from dual;

 

ceil-> 가장 큰 정수로 반환 (소수점 버리면서 큰 정수로 올림)

 

select round(10.1), ceil(10.1)

from dual;

 

floor-> 가장 작은 정수로 반환 (소수점 버리면서 정수만 남김)

 

select round(10.1), floor(10.1)

from dual;

 

mod - 나눈 나머지 값 반환

 

select 12/7, mod(12, 7)

from dual;

 

[문제17]

 

select employee_id, last_name, salary, round(salary*1.1,0) "New Salary",

    salary - round(salary*1.1) "Diff New Salary"

from employees;

 

 

-POWER 거듭제곱

 

select 2*2*2, power(2,3)

from dual;

 

날짜

sysdate: 현재 서버 날짜를 리턴하는 함수

systimestamp: 현재 서버 날짜 시간 타임존 리턴

current_date: 현재 클라이언트의 날짜를 리턴

current_timestamp: 현재 클라이언트의 날짜 시간 타임존 리턴

localtimestamp: 현재 클라의 날짜, 시간 리턴

 

 

날짜 +- 일수 -> 날짜 계산

날짜 +- 날짜 -> 일수 계산

 

날짜 +- 시간 -> 날짜만 나옴

 

select sysdate, systimestamp, current_date, current_timestamp, localtimestamp

from dual;

 

select sysdate +100

from dual;

 

select employee_id, sysdate, hire_date, sysdate - hire_date "근무일수"

from employees;

 

select sysdate + 12/24

from employees;

 

select localtimestamp, localtimestamp + 12/24

from employees;

 

 

to_char -> date 를 char 형태로 변환(문자형태로)

 

select sysdate + 12/24, to_char(sysdate+12/24, 'yyyy-mm-dd hh24:mi:ss')

from dual;

 

select sysdate + 12/24, to_char(sysdate+60/(24*60*60), 'yyyy-mm-dd hh24:mi:ss')

from dual;

 

select employee_id, sysdate - hire_date, months_between(sysdate, hire_date)

from employees;

 

[문제18]

select employee_id, hire_date, months_between(sysdate, hire_date)

from employees

where months_between(sysdate, hire_date) >= 180;

 

select sysdate, add_months(sysdate,5), add_months(sysdate,-5)

from dual;

 

- next_day : 입력한 날짜 기준 찾고있는 요일 가장가까운 날짜

 

select next_day(sysdate,'금요일') -----------요일이니까 언어에 종속됨

from dual;

 

[문제19]

select last_name, hire_date, next_day(add_months(hire_date,6),'월요일') "REVIEW"

from employees;

 

 

- last_day : 기준날짜 달의 마지막 날짜 리턴

 

select sysdate, last_day(sysdate), last_day(add_months(sysdate,2))

from dual;

 

연습

select employee_id, department_id, salary

from employees

order by 2 asc, 3 desc;

select '210101-1234567' "주민번호_1", replace('210101-1234567', substr('210101-1234567','9','6'),'******') "주민번호_2" 
from dual;

select '210101-1234567' "주민번호_1", rpad(substr('210101-1234567','1','8'),'14','*') "주민번호_2"
from dual;

select '010-1000-1004' "전화번호_1", replace('010-1000-1004',substr('010-1000-1004','5','4'),'****') "전화번호_2"
from dual;

select 'james@itwill.com' "EMAIL_1", substr('james@itwill.com','2'


day 일요일 dy 일 d 1

문제23
select employee_id, to_char(hire_date, 'day')
from employees
order by to_char(hire_date, 'd') asc;

문제24
select *
from employees
where to_char(hire_date, 'day') = '일요일';

문제 25
select to_char(sysdate, 'yyyy"년" mm"월" dd"일" day')
from employees;

혹은

select to_char(sysdate, 'dl')
from employees;

문제 26
select last_name, hire_date, to_char(next_day(add_months(hire_date, 6),'월요일'), 'day", the "Ddspth "of" fmmm, yyyy')
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

nvl2 할때는 문자면 문자, 숫자면 숫자 데이터타입 일치해야 쓸수있어

select employee_id, salary, commission_pct, nvl2(commission_pct, (salary*12)+(salary*12*commission_pct), salary*12) annual_sal
from employees;

coalesce - null이 발생하지 않을떄까지!

select employee_id, coalesce((salary*12)+(salary*12*commission_pct), salary*12,0)
from employees;

null if (1, 2) - > 두개가 일치하면 ,null, 일치하지않으면 1번 리턴 

select employee_id, last_name, first_name, nullif(length(last_name),length(first_name))
from employees;

select employee_id, job_id,
    decode(job_id,
        'IT_PROG', salary*1.1,
        'ST_CLERK', salary*1.2,
        'SA_REP', salary*1.3,
        salary) revised_salary
from employees;

case 기준값

문제29

select employee_id, salary,
    case
        when salary <= 4999 then 'low'
        when salary Between 5000 and 9999 then 'medium'
        when salary between 10000 and 19999 then 'good'
        when salary >= 20000 then 'excellent'
    end
from employees;

[문제30]

decode로 풀기

 

select job_id,

    decode(job_id, 'AD_PRES', 'A',

                    'ST_MAN', 'B',

                    'IT_PROG', 'C',

                    'SA_REP', 'D',

                    'ST_CLERK', 'E',

                    'z') GRADE

from employees;

 

 

 

 

 

case로 풀기

 

'=' 가 아닌 in > < 이런거 쓰려면 웬 뒤에 기준값을 다 넣어줘야해

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

 

decode, case 표현식에서 null check 방법

 

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

 

yy : 현재년도의 세기를 반영 : 2095-10-27 

rr : 2000년도 표기법을 자동화로 변경

 

현재연도 데이터입력 날짜   YY            RR

1994    95-10-27       1995         1995

1994    17-10-27       1917         2017

2001    17-10-27       2017         2017

2048    52-10-27       2052         1952

2051    47-10-27       2047         2047

 

이거 헷갈리니까 걍 4자리 쓰자!!!!!!!!!!!

 

 

단일행 함수

- 문자함수, 숫자함수, 날짜함수, 형변환함수, NULL관련함수, 조건제어 관련함수

 

그룹함수

- 여러행당 하나의 결과를 반환

- sum, avg, median, variance, stddev, max, min, count

 

select count(*)       ---------- null을 포함한 행의 수

from employees

where department_id = 50;

 

select count(commission_pct), count(employee_id) ------null을 제외한 행수를 구한다.

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

 

select avg(commission_pct)---------평균에서도 null 제외. R 파이썬은 계산자체가 안된대

from employees;

 

널값을 포함해서 0이라 여기고 평균내려면 nvl

 

select avg(nvl(commission_pct,0))

from employees;

 

median

관측수(n) 홀수면 : (n+1) / 2

관측수(n) 짝수면 : ((n/2), (n+1) / 2) 의 평균

 

variance

stddev

 

select max(salary), min(salary), max(salary) - min(salary)

from employees;

 

select max(hire_date), min(hire_date), max(last_name), min(last_name)

from employees;

 

 

------------------------------

부서별(소그룹)으로 급여 총액 구하기   -group by

 

 

select sum(salary)

from employees

group by department_id;

 

select department_id, sum(salary)

from employees

group by department_id;

 

 

그룹함수 쓸 때 null값 포함하지 않음 주의, select절에 그룹함수에 포함되지 않는 개별컬럼은 하나도 빠짐없이 group by 절에 명시해야 한다.

 

select department_id, job_id, sum(salary)

from employees

group by department_id, job_id;

 

select department_id, sum(salary)

from employees

group by department_id;

 

select * from employees order by department_id;

 

select department_id, sum(salary)

from employees

where sum(salary) >= 10000   ----------이거 오류 나옴 . where 절은 행을 제한하는거지 그룹함수 결과를 제한하는 게 아님.

group by department_id;

 

----------------------

그래서 필요한게 having!!!!!!  그룹함수의 결과를 제한해줌

 

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

 

select max(avg(salary)) ------ 그룹함수 두번중첩????? -=> 개별컬럼을 뺴야된다! 개별컬럼없으니까 어떤 부서가 맥스인지 모른다고. 그때, sub_query 써야하는거야

from employees

group by department_id;

 

[문제31]

select job_id, count(job_id)

from employees

where hire_date >= to_date('2008-01-01','yyyy-mm-dd') and hire_date < to_date('2009-01-01','yyyy-mm-dd')

group by job_id

order by count(job_id) desc;

 

[문제32]

select count(employee_id), to_char(hire_date, 'rrrr')

from employees

group by to_char(hire_date, 'rrrr');

 

[문제33]

select count(employee_id), to_number(to_char(hire_date, 'fmmm'))

from employees

group by to_number(to_char(hire_date, 'fmmm'))

order by 2 asc;

 

[문제34]

select to_char(hire_date, 'rrrr')

from employees;

 

 

------------------------단일행 함수 안에 그룹함수를 넣을순 없어. case(count(~)) 는 안된다고.

decode로 하기

select count(*) total,

            count(decode(to_char(hire_date, 'rrrr'), '2001',1)) "2001년",

            count(decode(to_char(hire_date, 'rrrr'), '2002',1)) "2002년",

            count(decode(to_char(hire_date, 'rrrr'), '2003',1)) "2003년"

from employees;

 

case로 하기

select count(*) total,

            count(case to_char(hire_date, 'rrrr') when '2001' then 1 end) "2001년",

            count(case to_char(hire_date, 'rrrr') when '2002' then 1 end) "2002년",

            count(case to_char(hire_date, 'rrrr') when '2003' then 1 end) "2003년"

from employees;

 

join    ------ 두개 이상의 테이블에서 내가 원하는 데이터를 가져오는 방법

 

 

1. cartesian product

- 조인조건 생략된 경우

- 조인조건 잘못 만든 경우

- 첫번째 테이블 행의 수와 두번째 테이블 행의 수가 곱해진다.

 

select employee_id, department_name

from employees, departments;

 

2. equi join, inner join, simple join, 등가조인

 

equi join

 

select employee_id, department_name

from employees, departments

where employees.department_id = departments.department_id;

 

-----------위에꺼를 이렇게 테이블 별칭 쓰는 습관 들여야해!!!!!-=-----------

 

select e.employee_id, d.department_name

from employees e, departments d

where e.department_id = d.department_id;

 

★★★★★★★☆★ㅁ사원들의 사원번호, 근무도시를 출력하시오. --> employees 랑 locations를 연결할 게 필요해. 그게 departments

select e.employee_id, l.city

from employees e, locations l, departments d

where e.department_id = d.department_id

    and d.location_id = l.location_id;

 

 

문제36

사원번호, 국가이름 출력

4개를 조인 하려면 조인조건술어는 3개여야지.

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
    
    
Outer join - 키값이 일치되지 않아도 출력. 키값이 있는 쪽에 (+) 붙여준다.

문제39
select e.*, d.*
from employees e, departments d
where e.employee_id = d.manager_id;

문제40
select last_name, commission_pct, department_name
from employees e, department d
where e.department_id=d.department_id
    and commission_pct is not null;
    
문제41
select e.last_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
and e.last_name like '%a%';

select count(*) from employees where last_name like '%a%';

4. self join - 자신의 테이블 참조

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
    
[문제43]
select  j.grade_level,count(*)
from employees e, job_grades j
where e.salary between j.lowest_sal and j.highest_sal
group by j.grade_level
order by 1;

[문제44]
select employee_id, salary, grade_level, department_name
from employees e, job_grades j, department d
where e.salary between j.lowest_sal and j.highest_sal
and e.employee_id = 

[문제45]
select e.employee_id, e.salary, j.grade_level, d.department_name, l.city
from employees e, job_grades j, departments d, locations l
where e. salary between j.lowest_sal and j.highest_sal
and e.department_id = d. department_id(+)
and d.location_id = l.location_id(+);


ANSI join (ANSI 표준)

1. natural join
- equi join
-조인조건 술어를 자동으로 만들어 준다.
-양쪽 테이블의 동일한 이름 모든 컬럼을 기준으로 조인조건술어를 만들어 준다.

select e.employee_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and e.manager_id = d.manager_id;       -------------잘못된거

select e.employee_id, d.department_name
from employees e natural join departments d;

select department_name, city
from departments natural join locations;

2. join using
- equi join
- 조인조건의 기준 컬럼을 지정한다.
- using 절에 사용된 기준컬럼은 어느 테이블이라고 지정하면 안된다.

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

3. join on ----------------------제일 많이 씀
- equi join
- on 절을 이용해서 조인조건 술어를 직접 만들어서 사용한다.

select e.employee_id, d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where e.department_id in (30,50);

[문제46]
select e.employee_id, e.salary, j.grade_level, d.department_name
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal
join departments d
on e.department_id = d.department_id;

select w.last_name, m.last_name
from employees w join employees m
on w.manager_id = m.employee_id(+);

이거랑같은게

select w.last_name, m.last_name
from employees w left outer join employees m
on w.manager_id = m.employee_id;

outer도 마찬가지.

오라클 전용의 outer join 사용할 떄 양쪽에 (+) 안되잖아

1) 해결방법

select e.employee_id, e.salary, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id
union -- 이게 두개를 합쳐준다고
select e.employee_id, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

2) 해결방법 ANSI 표준의 full outer join

select e.employee_id, e.salary, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;



cartesian product 의도적으로 만드는거자

select e.employee_id, e.salary, d.department_name
from employees e, department d;

select e.employee_id, e.salary, d.department_name
from employees e cross join departments d;

[문제47]
오라클
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

ANSI 표준
select d.department_name, sum(e.salary)
from employees e join departments d
    on e.department_id = d.department_id
    where e.hire_date between to_date('2016/01/01','yyyy-mm-dd') and to_date('2016/12/31','yyyy-mm-dd')
group by d.department_name;

[문제48] ----------------------이거 제발 다시 물어보자
select l.city, sum(e.salary)
from employees e, departments d, locations l
where e.hire_date >= to_date('2016-01-01','yyyy-mm-dd') and e.hire_date < to_date('2017-01-01','yyyy-mm-dd')
and e.department_id = d.department_id
and d.location_id = l.location_id
group by l.city;

[문제49]
select l.city, sum(e.salary)
from employees e, departments d, locations l
where e.hire_date >= to_date('2007/01/01','yyyy-mm-dd')
and e.hire_date < to_date('2008/01/01','yyyy-mm-dd')
and e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
group by l.city;

[문제51]
select w.last_name, w.hire_date, m.last_name, m.hire_date
from employees w join employees m
    on w.manager_id = m.employee_id
where w.hire_date < m.hire_date;


=----------------------
subquery
- SQL문 안에 SELECT문을 서브쿼리라고 한다.
- Select문의 서브쿼리는 꼭 () 묶어야 한다.
- where절에서는 비교연산자 오른쪽 입력해야한다.

중첩서브쿼리 (nested subquery)

1. 서브쿼리를 먼저 수행
2. 수행한 값을 가지고 main쿼리를 수행

select *
from employees
where salary > (select salary
                from employees
                where employee_id = 110);
                
select *
from employees
where salary > (select salary
                from employees
                where last_name = 'King'); --------이거 오류!
                
단일행 서브쿼리

여러행 서브쿼리
- 서브쿼리의 결과가 여러개 값
- 이 때는 in, any, all 써줘야대

select *
from employees
where salary > any(select salary
                from employees
                where last_name = 'King');
                
[문제53]
select *
from employees
where job_id = (select job_id
                from employees
                where employee_id = 110)
and salary > (select salary
            from employees
            where employee_id = 110);

where 
                
[문제54]
select *
from employees
where salary = (select min(salary)
                from employees);
                
having 절에서 subquery 사용
having = 그룹함수의 결과를 제한하고 싶을 때

select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 40);
                        
select min(avg(salary)) -- 그룹함수 두번 중첩하면 개별컬럼 적을 수 없음
from employees
group by department_id;

그럼 개별컬럼 기준 쓰고 싶으면 어떡해? 이렇게

[문제55] 최소 평균값을 가진 부서번호, 평균을 출력

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

any 속성은 or 의미
all 은 and 의미

select *
from employees
where salary > (select min(salary)
                        from employees
                        where job_id = 'IT_PROG');
                        
[문제56]
select job_id, sum(salary)
from employees
where job_id in (select job_id
                from employees
                where hire_date >= to_date('2006-01-01','yyyy-mm-dd') 
                and hire_date < to_date('2007-01-01','yyyy-mm-dd'))
group by job_id
having sum(salary) >= 50000;

[문제57]
select e.last_name, e.department_id, e.job_id, l.location_id
from employees e, departments d, locations l
where e.department_id = d.department_id
    and d.location_id = l.location_id
    and l.location_id = 1700
order by department_id asc;
    
    
 !!!!!!!!!!!!!!&&&&& 조인, 섭쿼리 같지만, 섭쿼리 할때는 이렇게 테이블 여러개 연결 x.
 할필요도 없음. 걍 섭쿼리 안의 select를 따로 실행하는거니까
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
                        
[문제58]
select *
from employees
where salary > all (select salary
                from employees
                where department_id = 60);
                
[문제 59]
select*
from employees
where employee_id in (select manager_id
                            from employees);
                            
[문제 60]         not in 에서는 섭쿼리에 null 있으면 조회를 안해
select *
from employees
where employee_id not in (select manager_id
                            from employees
                            where manager_id is not null);-- TRUE AND NULL 이 되어서 NULL이 나와. NULL값은 뺴줘야대

OR 진리표
TRUE OR TRUE = TRUE
TRUE OR FALSE = TRUE
TRUE OR NULL(T/F) = TRUE
FALSE OR NULL(T/F) = NULL !

AND 진리표
TRUE AND TRUE = TRUE
TRUE AND FALSE = FALSE
TRUE AND NULL = NULL
FALSE AND NULL = FALSE


중첩 서브쿼리
correlated sub-query

select employee_id, salary, department_id
from employees;

select avg(salary)
from employees
where department_id = 변수 ;

select *
from employees o
where salary > (select avg(salary)
                from employees
                where department_id = o.department_id);

correlated subquery
1. main query(outer query)를 먼저 수행
2. 첫번째행을 후보행으로 잡고 후보행값을 서브쿼리에 전달
3. 후보행값을 사용해서 서브쿼리 수행한다
4. 서브쿼리 결과값을 사용해서 후보행과 비교한다.
5. 다음행을 후보행으로 잡고 2,3,4번을 반복수행한다.

exists
- 후보행값이 서브쿼리에 존재하는지 여부를 찾는 연산자
- 후보행값이 서브쿼리에 존재하면 TRUE, 우리가 찾는 데이터 검색종료
- 후보행값이 서브쿼리에 존재하지 않으면 FALSE 우리가 찾는 데이터가 아니다.
not exists

select *
from employees o
where exists (select 'x'
                from employees
                where manager_id = o.employee_id);

[문제62] 소속사원이 있는 부서정보 출력
1) in  -------중복이 포함됨 비효율

select * 
from departments
where department_id in (select department_id
                        from employees);
                        
2)exists -----다 검색하는게 아니라 값이 나오면 출력하고 멈춘다고

select *
from departments d
where exists (select 'x'
                from employees
                where department_id = d.department_id);
                
not exists 
- 후보행값이 서브쿼리에 존재하지 않는 데이터 찾음. 한번도 판매안된 상품 찾아
[문제66]
select last_name, job_id
from employees
where department_id = (select department_id
                        from departments
                        where department_name = 'Executive');
                        
[문제67]
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
-가상테이블
-from 절 subquery를 INLINE VIEW

select *
from (select department_id, avg(salary) avg_sal
    from employees
    group by department_id) dept_avg;
    
[문제68]
select d.department_name, l.city, count(*)
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
group by d.department_name, l.city
having count(*) = (select max(count(*))
                    from employees
                    group by department_id);
                    
INLINE VIEW로 풀기
select e.cnt, d.department_name, l.city
from (select department_id, count(*)cnt
        from employees
        group by department_id
        having count(*) = (select max(count(*))
                    from employees
                    group by department_id))e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

[문제69]
select employee_id, last_name, to_char(hire_date,'day')
from employees
where to_char(hire_date,'day') in (select to_char(hire_date,'day')
                                from employees
                                group by to_char(hire_date,'day')
                                having count(*) = (select max(count(*))
                                                     from employees
                                                    group by to_char(hire_date,'day')));


[문제70]
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
    count(decode(department_id, null, 1)) "부서가 없는 사원"
from employees;

PIVOT 
행 열 변경

select*
from (select department_id
        from employees)
pivot(count(*) for department_id in (10,20,30,40,50,60,70,80,90,100,110,null as "부서가 없는 사원"));

select *
from(select to_char(hire_date,'yyyy') year
    from employees)
pivot(count(*) for year in ('2001' "2001", '2002' "2002"));

문제72

select to_char(hire_date,'day'), count(*)
from employees
group by to_char(hire_date,'day');

select *
from (select to_char(hire_date,'dy') day, salary
        from employees)
pivot(count(*) for day in ('월' "월", '화' "화", '수' "수", '목' "목", '금' "금", '토' "토", '일' "일"))
    (sum(salary) for day in ('월' "월", '화' "화", '수' "수", '목' "목", '금' "금", '토' "토", '일' "일"));

unpivot
열을 행으로 변경

[문제74]

select to_char(hire_date,'yyyy'), to_char(hire_date,'q'), sum(salary)
from employees
group by to_char(hire_date,'yyyy'), to_char(hire_date,'q');

select to_char(hire_date,'yyyy') "년도",
        nvl(sum(decode(to_char(hire_date,'q'),1,salary)),0) "1분기",
        nvl(sum(decode(to_char(hire_date,'q'),2,salary)),0) "2분기",
        nvl(sum(decode(to_char(hire_date,'q'),3,salary)),0) "3분기",
        nvl(sum(decode(to_char(hire_date,'q'),4,salary)),0) "4분기"
from employees
group by to_char(hire_date,'yyyy')
order by 1;

select 년도, nvl("1분기",0) "1분기", nvl("2분기",0) "2분기", nvl("3분기",0) "3분기", nvl("4분기",0) "4분기"
from (select to_char(hire_date,'yyyy') 년도, to_char(hire_date,'q') quarter, salary
        from employees)
pivot(sum(salary) for quarter in (1 "1분기",2 "2분기",3 "3분기",4 "4분기"));

[문제75]
select 달, nvl("2001년",0) "2001년", nvl("2002년",0) "2002년", nvl("2003년",0) "2003년", nvl("2004년",0)
from (select to_char(hire_date,'yyyy') 년도, to_char(hire_date, 'mm') 달, salary
        from employees)
pivot(sum(salary) for 년도 in ('2001' "2001년", '2002' "2002년", '2003' "2003년", '2004' "2004년"))
order by 1 ;

다중열 서브쿼리

쌍비교
select *
from employees
where (manager_id, department_id) in (select manager_id, department_id
                                        from employees
                                        where first_name = 'John');
                                        
[문제76]
select *
from employees
where (department_id, salary) in (select department_id, salary
                                    from employees
                                    where commission_pct is not null);
[문제77]                                  
select *
from employees
where (salary, nvl(commission_pct,0)) in (select e.salary, nvl(e.commission_pct,0)
                                    from employees e, departments d
                                    where d.location_id = 1700);
                                    
                                    
                                    
스칼라 서브쿼리 (조인하지 않아도 되는 캐시기능)  
- 한행에서 정확히 하나의 열값만 반환하는 쿼리(단일컬럼, 단일값만 리턴)
- 동일한 입력값이 들어오면 수행 횟수를 최소화 할 수 있는 로직을 구현한다.
- 스칼라 서브쿼리 하면 아우터 조인 안해도 키값일치하지 않는 결과도 뽑아냄
select employee_id, department_id, (select department_name
                                    from departments
                                    where department_id = e.department_id)
from employees e
order by 2;

[문제78]
부서이름별 급여의 총액, 평균 구하기

1)일반적인 형식
select d.department_name, sum(e.salary), avg(e.salary)
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name
order by 1;

2) inline view  일반적인 형식의 어떤 문제점을 개선했지?
- 미리 조인의 일 양을 줄이자. 군집을 먼저 해서 테이블을 만들어 놓고 나서 조인을 하면
    조회를 덜 해도 되잖아.

select d.department_name, e.sum_sal, e.avg_sal
from (select department_id, sum(salary) sum_sal, avg(salary) avg_sal
        from employees
        group by department_id) e, departments d
where e.department_id = d.department_id(+);

3) scalar subquery 이용  - 여기서는 똑같은 테이블을 두번 조회하니까 별로 안좋은 경우야/

select department_name,(select sum(salary)
                        from employees
                        where department_id = d.department_id) sum_sal,
                        (select avg(salary)
                        from employees
                        where department_id = d.department_id) avg_sal
from departments d;

3) - 1 scalr subquery 효율적으로 쓰는 경우

select department_name, (select 'sum_sal:'||sum(salary)||',' ||'avg_sal:'||avg(salary)
                        from employees e
                        where department_id=d.department_id)
    from departments d;
    
3) - 2 근데 위에껄 컬럼 나누고 싶으면?
select department_name ,substr(sal,1,10) sum_sal, substr(sal,11) avg_sal
from (select department_name, (select lpad(sum(salary),10)||lpad(avg(salary),10)
                            from employees
                            where department_id = d.department_id) sal
    from departments d)
where sal is not null;

[문제79] 사원들의 last_name, salary, grade_level을 출력

1) 조인

select e.last_name, e.salary, j.grade_level
from employees e, job_grades j
where e.salary >= j.lowest_sal and e.salary <= j.highest_sal;
--between and 해도댐

2) scalar subquery
select last_name, salary, (select grade_level
                            from job_grades
                            where e.salary between lowest_sal and highest_sal)
from employees e;

[문제80] 사원들의 employee_id, last_name 출력, department_name 기준 정렬

select e.employee_id, e.last_name
from employees e, departments d
where e.department_id = d.department_id
order by d.department_name;

이거 지금 조인하기 싫으면 어떡하냐면, 정렬하는 부분 애만 다른 테이블이니까 order by 에 스칼라 넣어버려

select employee_id, last_name
from employees e
order by (select department_name
            from departments
            where department_id = e.department_id) desc;
            
subquery는 group by 절에는 쓸 수 없는거야.

[문제 81]

select to_char(hire_date,'yyyy') 년도,
        to_char(nvl(sum(decode(job_id,'SA_REP',salary)),0),'l999,999')||'원' SA_REP,
        to_char(nvl(sum(decode(job_id,'SH_CLERK',salary)),0),'l999,999')||'원' SH_CLERK,
        to_char(nvl(sum(decode(job_id,'ST_CLERK',salary)),0),'l999,999')||'원' ST_CLERK
from employees
group by to_char(hire_date,'yyyy')
order by 1;


select 년도, to_char(nvl(SA_REP,0),'l999,999')||'원' SA_REP, to_char(nvl(SH_CLERK,0),'l999,999')||'원' SH_CLERK, to_char(nvl(ST_CLERK,0),'l999,999')||'원' ST_CLERK
from (select to_char(hire_date,'yyyy')년도,job_id,salary
        from employees)
pivot(sum(salary) for job_id in ('SA_REP' "SA_REP",'SH_CLERK' "SH_CLERK",'ST_CLERK' "ST_CLERK"))
order by 1;

집합연산자 UNION
-select 절의 컬럼 갯수가 일치해야 함
-첫번쨰 select절의 컬럼의 대응되는 두번쨰 select절 컬럼의 데이터 타입이 일치
- union, intersect, minus 연산자는 중복을 제거한다.
- 위 세개는 중복제거가 정렬로 자동으로 들어간다.
- union all 중복포함
- order by 제일 마지막에 기술
- order by에는 컬럼, 별칭, 위치 표기법을 사용


select employee_id, job_id, salary
from employees
union
select employee_id, job_id, to_number('0')
from job_history;

[문제82] job_id를 한번이라도 바꾼 사원

1)집합연산자
select *
from employees
where employee_id in(select employee_id
                  from employees
                  intersect
                  select employee_id
                  from job_history);
                  
2)exists 연산자
select *
from employees e
where exists (select 'x'
                from job_history
                where employee_id = e.employee_id);
                
[문제83] job_id를 한번도 바꾸지 않은 사원 
ㅍ1)집합연산자
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
                
[문제84] 부서가 소재하지 않은 국가의 리스트, country_id, country_name 출력

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
                
[문제85] Union -> union all + not exists

select e.employee_id, e.last_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
union all
select null, null, department_name
from departments d
where not exists (select 'x'
                    from employees
                    where department_id = d.department_id);

이것도 비효율이라 full outer join 으로 해야돼 ANSI 표준

[문제86]
1) department_id, job_id, manager_id 기준으로 총액 급여 출력
2) department_id, job_id 기준으로 총액급여 출력
3) department_id 기준으로 총액급여출력
4) 전체 총액급여 출력

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

rollup 연산자
group by 절 지정된 열 리스트를 오른쪽에서 왼쪽방향으로 이동하면서 그룹화


select department_id, job_id, manager_id, sum(salary)
from employees
group by rollup(department_id, job_id, manager_id);

cube 연산자
rollup을 포함하고 모든 그룹화 할 수 있는 걸 만듬
rollup은 오른쪽부터 이동하면서 그룹화잖아 근데 이건 컬럼의 조합을 만들어서 다 그룹화함

grouping sets
내가 원하는 그룹을 만드는 연산자

group by grouping sets ((a,b),(a,c));

[문제87] 년도 분기별 총액을 구하세요. 행의합과 열의합도 구하세요.

select year,
        max(decode(quarter,1,sum_sal)) "1분기",
        max(decode(quarter,2,sum_sal)) "2분기",
        max(decode(quarter,3,sum_sal)) "3분기",
        max(decode(quarter,4,sum_sal)) "4분기",
        max(decode(quarter,null,sum_sal)) "합"  
from (select to_char(hire_date,'yyyy') year,to_char(hire_date,'q') quarter ,sum(salary) sum_sal
        from employees
        group by cube(to_char(hire_date,'yyyy'),to_char(hire_date,'q')))
group by year
order by 1;

pivot으로 풀기
select *
from (select year, nvl(quarter,0) quarter, sum_sal
        from (select to_char(hire_date,'yyyy') year,to_char(hire_date,'q') quarter ,sum(salary) sum_sal
                from employees
                group by cube(to_char(hire_date,'yyyy'),to_char(hire_date,'q'))))
pivot (max(sum_sal) for quarter in (1,2,3,4))
order by 1;

[문제88]

select nvl(년도, '열의합') 년도,
        to_char(nvl(SA_REP,0), 'l999,999')||'원' SA_REP,
        to_char(nvl(SH_CLERK,0), 'l999,999')||'원' SH_CLERK,
        to_char(nvl(ST_CLERK,0), 'l999,999')||'원' ST_CLERK,
        to_char(행의합, 'l999,999')||'원' 행의합
    from (select 년도, nvl(job_id, 'x') job_id, sum_sal
            from (select to_char(hire_date,'yyyy') 년도, job_id, sum(salary) sum_sal
                    from employees
                    where job_id in ('SA_REP','SH_CLERK','ST_CLERK')
                    group by cube(to_char(hire_date,'yyyy'),job_id)))
pivot(max(sum_sal) for job_id in ('SA_REP' "SA_REP", 'SH_CLERK' "SH_CLERK", 'ST_CLERK' "ST_CLERK", 'x' "행의합"))
order by 1;

계층검색 (hierarchical query)

하향식
select employee_id, last_name, manager_id
from employees
start with employee_id = 100
connect by prior employee_id = manager_id;

상향식
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
    
[문제89]select 문 이용해서 1~100 출력
select level
from dual
connect by level <= 100;

[문제90] select 문 이용해서 2단을 출력
select '2 * '||level||' = '|| 2*level "2단"
from dual 
connect by level <= 9;

[문제91] 2단 ~ 9단 출력
select '2 * '||level||' = '|| 2*level "2단",
        '3 * '||level||' = '|| 3*level "3단",
        '4 * '||level||' = '|| 4*level "4단",
        '5 * '||level||' = '|| 5*level "5단",
        '6 * '||level||' = '|| 6*level "6단",
        '7 * '||level||' = '|| 7*level "7단",
        '8 * '||level||' = '|| 8*level "8단",
        '9 * '||level||' = '|| 9*level "9단"

from dual 
connect by level <= 9;


select dan || '*' || num || ' = ' || dan*num 구구단
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

■ 유저관리
권한(privilege)
- 특정한 SQL문을 수행할 수 있는 권리
- 시스템권한 : 데이터베이스에 영향을 줄수 있는 권한
- 객체권한 : 객체를 사용할 수 있는 권한
- ROLE(롤) : 유저에게 부여할 수 있는 권한을 모아 놓은 객체, 유지 관리에 대한 편리성 때문에 만듬

- 내가 받은 시스템 권한을 확인
select * from user_sys_privs;

- 내가 받은 또는 내가 부여한 객체권한을 확인
select * from user_tap_privs;

- 내가 받은 롤을 확인
select * from session_roles;

- 내가 받은 롤안에 시스템 권한을 확인
select * from role_sys_privs;

- 내가 받은 롤안에 객체권한을 확인
select * from role_tab_privs;

- 내 정보 내가 보기
select * from user_users;

- 데이터베이스에 생성된 유저 정보
select * from dba_users;

- 시스템권한을 어떤유저한테 부여 했는지 확인
select * from dba_sys_privs where grantee = 'HR';

- 객체권한을 어떤 유저한테 부여 했는지 확인
select * from dba_tab_privs where grantee = 'HR';

- 데이터베이스에 생성된 롤에 대한 정보 확인
select * from dba_roles;

- 유저한테 부여한 롤에 대한 정보 확인
select * from dba_role_privs where grantee = 'HR';

오라클 데이터베이스에 데이터를 저장하는 구조

        논리적     물리적
    database      OS
    tablespace    data file   -----업무별로 분류해서 저장
    segment
    extent
    block        OS block
    block : 오라클의 최소 INPUT / OUTPUT 단위
select * from dba_data_files;
    
책 = table(segment)
장 = extent
페이지 = block
문장 = row

유저생성
create user james
identified by james
default tablespace users -- 테이블 생성시 사용할 수 있는 테이블스페이스
temporary tablespace temp -- 정렬작업시 메모리에서 다 할 수 없으면 데이터를 임시로 저장하는 공간
quota 10m on users; -- tablespace를 사용할 수 있는 권한

select * from dba_users where username = 'JAMES';
select * from dba_ts_quotas;

권한부여
DCL(Data Control Language)
-grant :권한 부여
-revoke : 권한 회수

- create session 권한을 유저한테 부여하는 방법
grant create session to james;

-- grant 시스템권한 to 유저이름

select * from dba_sys_privs where grantee = 'james';

revoke create session from james;
-- revoke 시스템권한 from 유저이름

유저 삭제
drop user james;

■ 테이블생성 (object, segment)
- 데이터를 저장하는 객체
- 행과 열로 구성되어 있다.

테이블을 생성하려면 두가지를 체크해야한다.
1. 테이블을 생성할수 있는 권한
    create table 시스템 권한
select * from session_privs;

2. 테이블을 저장할수 있는 테이블스페이스 권한

select * from user_ts_quotas; -- 일반 유저 입장에서 확인
select * from dba_ts_quotas; -- sys 입장에서 확인

테이블이름, 컬럼이름, 유저이름, 다른객체이름, 제약조건이름
- 문자로 시작
- 문자의 길이는 1~30
- 문자, 숫자, 특수문자(_,#,$) 가능
- 대소문자 구분하지 않음
- 동일한 유저가 소유한 객체이름은 중복되면 안됨
- 예약어는 사용할 수 없다 (select, distinct, ...)

컬럼의 타입
desc employees
- number(p,s) : 가변길이 숫자 타입, p : 전체자리수 , s: 소수점자리수, number(5,2)
- varchar2(4000) : 가변길이 문자 타입
- char(2000) : 고정길이 문자 타입
- date : 남짜타입
- clob : 가변길이 문자 타입, 4gbyte
- blob : 가변길이 이진 데이터타입,4gbyte
- bfile : 외부파일에 저장된 이진 데이터타입, 4gbyte

create table hr.emp(
        id number(4),
        name varchar2(30),
        day date default sysdate);
        
여기서 테이블스페이스 지정안했으니까 
default tablespace에 저장된다.

select * from user_users;

select * from user_tables where table_name = 'EMP';

- 테이블 삭제
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
- merge (insert, update, delete 한꺼번에 수행)

TCL(Transaction Control LAnguage)
- commit(DML 영구히 저장)
- rollback (DML 영구히 취소)
- savepount(rollback 기능을 도와주는 표시자)

Transaction : 논리적으로 DML을 하나로 묶어서 처리하는 작업 단위

- insert 문
테이블에 새로운 행을 입력하는 SQL문
desc emp --insert 하기 전에 테이블의 구조를 확인
insert into 소유자.테이블이름(컬럼,컬럼,...)
values(데이터,데이터,...);

insert into hr.emp(id,name,day)
values(1,'홍길동',to_date('2021-12-16','yyyy-mm-dd'));

select * from hr.emp; -- 미리보기임. 영구히 저장된게 아냐 cmd에서 sqlplus 보면 안나옴

commit; -- 영구히 저장

insert into hr.emp(id, name, day) ----- 저 밑에 커밋은 여기서부터 transaction 시작되는거야
values(2, '박찬호', sysdate);

select*from emp;

insert into hr.emp(id,name,day)
values(3, '윤건', to_date('2021-11-20','yyyy-mm-dd'));

select * from emp;

commit;

insert into hr.emp(id,name,day)
values(4,'나얼',to_date('2020-10-10','yyyy-mm-dd'));

select * from emp;
rollback;


-- day 컬럼에 default 값이 구성되면 default 값이 입력된다
-- insert를 수행하는 시점에 default값으로 구성된 sysdate 값으로 입력된다.

insert into hr.emp(id,name)
values(5,'이문세');

insert into hr.emp(id,name,day)
values(6,'손흥민',default);

select * from hr.emp;

- NULL 입력하는 방법
insert into hr.emp(id,name,day)
values(7,'하든', null); -- day 컬럼에 default 값이 설정되어 있더라도 null이 우선순위가 높음.
select * from hr.emp -- 미리보기하는습관!

insert into hr.emp(id,name,day)
values(8,null,null);

commit;
rollback; -- 여기서 롤백해봣자 안돌아가. 이미 커밋햇자나. 수정하고싶었으면 insert하고 커밋하기 전에 롤백했어야돼


- update
필드값 수정

update 소유자.테이블
set 수정할 필드가 있는 컬럼 = 새로운 값
where 조건;

update hr.emp -- transaction 시작
set day = to_date('2002-01-01');

select * from hr.emp;

update hr.emp
set day = to_date('2001-01-01','yyyy-mm-dd')
where id = 1;

select * from hr.emp;
commit;

-- 여러컬럼의 필드값을 수정
update hr.emp
set name = '커리', day = default
where id = 8;

rollback;
commit;

- delete
delete는 행을 지우는거임. 필드값을 지우고 싶으면 update 로 null 값을 넣어주는거야.

delete from 소유자.테이블;
delete from 소유자.테이블 where 삭제해야할 행의 조건;

delete from hr.emp

delete from hr.emp
where id = 1;

- 테이블복제, CTAS
테이블구조, 행(데이터), 제약조건중에 not null 만 복제

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


-데이터는 제외하고 테이블의 구조만 복제

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

ETL(Extraction, Transformation, Loading) 작업

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
                
- correlated subquerty 이용한 update
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

[문제93] emp 테이블에 있는 데이터 중 job_history에 존재하는 사원들 삭제

select *
from emp
where id in (select employee_id
            from job_history);
            
근데 in은 좋지않아
이렇게 하는게 좋지

select *
from emp e
where exists (select 'x'
                from job_history
                where employee_id = e.id);
                
delete from emp
where exists (select 'x'
            from job_history
            where employee_id = e.id);
            

자동 commit 발생할떄
- DDL(create, alter, drop, rename, truncate, comment)
- DCL(grant, revoke)
- sqlplus 에서 exit 수행하면
- sqlplus 에서 다른유저로 접속할때
DML 작업을 수행한 후 꼭 명시적으로 transaction 종료하는 습관 갖자


자동 rollback 발생할때
- 창닫기를 하면 비정상적인 종료
- 네트워크가 장애가 발생하는 경우
-컴퓨터가 비정상적으로 종료


select * from emp;
delete from emp;
select * from emp;

create table dept
as select * from department; ---------- delete 하고 나서 CTAS 하면 auto commit이 되어서 취소(rollback)가 안돼

select * from dept;

insert into dept
select * from departments;
commit;
select * from dept;


savepoint : dml 작업시에 rollback을 도와주는 표시자
            commit, rollback 수행하면, transaction이 종료하면 표시자는 사라짐

insert into emp_20(employee_id,last_name) ------- transaction 시작
values(300,'홍길동');
select * from emp_20;

savepoint a;

update emp_20
set last_name = '박찬호'
where employee_id = 201;

select * from emp_20;

savepoint b;

delete from emp_20 where employee_id = 202;

select * from emp_20;

rollback; -- transaction 시작 부터 전부 rollback

rollback to b; ------- savepoint 까지 롤백, 표시자 b 이하에 있는 delete만 취소



- 다중 테이블 insert
- source 테이블에서 데이터를 추출해서 여러개의 target 에 저장하는 SQL문
- ETL 
- source 시스템에서 데이터 추출해서 data warehouse 로 가져오는 작업

1. 무조건 insert all

create table sal_history
as select employee_id, hire_date, salary from employees where 1 = 2;

select * from sal_history;

create table mgr_history
as select employee_id, manager_id, salary from employees where 1 = 2;

select * from mgr_history;

source table(employees)   ---------->target table(sal_history, mgr_history) ETL 작업

예)
insert into sal_history(employee_id, hire_date, salary)
select employee_id, hire_date, salary
from employees;

select * from sal_history;

insert into mgr_history(employee_id, manager_id, salary)
select employee_id, manager_id, salary
from employees;

select * from mgr_history;

rollback;

------------위처럼 하면 비효율. insert all 해버려

insert all
into sal_history(employee_id, hire_date, salary) values(id, day, sal)
into mgr_history(employee_id, manager_id, salary) values(id, mgr, sal)
select employee_id id, hire_date day, manager_id mgr, salary sal
from employees;

select * from sal_history;
select * from mgr_history

select employee_id hire_date, manager_id, salary
from employees;

2. 조건 insert all
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
                
3.조건 insert first

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

[문제95] 사원들 중에 근무연수가 15년 이상 이면서 급여는 10000이상 급여를 받는 사원들은 
emp_1테이블에 사번, 이름(last_name), 입사일, 근무연수, 급여 정보를 입력하고 
근무연수가 15년 이상 이면서 급여는 10000미만 급여를 받는 사원들은 
emp_2테이블에 사번, 이름(last_name), 입사일, 근무연수, 급여 정보를 입력하세요.
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

oltp (online transaction processing): 온라인 사용자들이 데이터베이스에 DML작업을 수행하는 업무
olap (online analytical processing): 데이터 분석하고 유의미한 정보를 만들어내는 업무

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

-기존의 테이블의 컬럼을 추가하는 방법
alter table oltp_emp add flag char(1);

select * from oltp_emp where employee_id in (201,202);

update oltp_emp
set flag = 'd'
where employee_id = 202;

update oltp_emp
set salary = 20000
where employee_id = 201;

commit;

[문제96] oltp_emp에있는 사원들 중 dw+emp에 존재하는 사원의 정보 출력
select *
from oltp_emp o
where exists (select 'x'
                from dw_emp
                where employee_id = o.employee_id);
                

[문제97] dw_emp에 있는 사원들 중 oltp_emp에 존재하는 사원들을 oltp_emp 에 급여 기준으로 10% 인상
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
[문제98] dw_emp에 있는 사원들 중 oltp_emp에 존재하는 사원들 중 falg 값이 'd'인 사원 삭제
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
                
[문제99] oltp_emp테이블에 있는 데이터 중 dw_emp테이블에 없는 데이터들을 dw_emp테이블에 입력


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
insert, update, delete 문을 한꺼번에 수행

select * from dw_emp; ----- target table(실제 update,delet,insert)
select * from oltp_emp;  ----- source table

merge into dw_emp d ---- target table
using oltp_emp o ---- source table
on (d.employee_id = o.employee_id) --- 조인조건(키 값의 연결 고리)
when matched then ---- 키 값이 일치가 되면
    update set 
        d.salary = o.salary*1.1
    delete where o.flag = 'd'
when not matched then
    insert(d.employee_id, d.last_name, d.salary, d.department_id)
    values(o.employee_id, o.last_name, o.salary, o.department_id);
    
rollback;

[문제100] emp_copy 테이블에 있는 department_name 값을 
            departments 의 department_name 값을 이용해서 수정해주세요
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


권한 주기!
grant select on hr.emp to ora;
grant insert on hr.emp to ora;
grant update on hr.emp to ora;
grant delete on hr.emp to ora;

권한 회수!
revoke delete on hr.emp from ora;

한꺼번에 이렇게 할 수도 있음
revoke select, insert, update on hr.emp from ora;

drop table emp purge;

create table emp1(id number, name varchar2(30), day date);

desc emp1

select * from user_tables where table_name = 'emp1';
select * from user_tab_columns where table_name = 'emp1';


# 컬럼을 추가
alter table emp1 add job_id varchar2(20);
desc emp1

# 컬럼의 타입, 크기를 수정
desc emp1

alter table emp1 modify job_id varchar2(30);
desc emp1
alter table emp1 modify job_id char(20);
desc emp1
alter table emp1 modify job_id number; -- 기존 데이터가 저장되었을 경우에는 타입 수정시 문제가 발생 수 있다.
desc emp1


# 컬럼 삭제
alter table emp1 drop column job_id;
desc emp1


■ 제약조건
- 테이블의 데이터에 대한 규칙을 만든다.
- 데이터에 대한 품질을 향상시키기 위해서 만든다.

1. primary key
- 테이블의 대표키
- unique, null 값 허용 X
- 테이블 당 하나
- 자동으로 unique index 생성

- 제약조건 정보 확인
select * from user_constraints where table_name = 'emp1';
select * from user_cons_columns where table_name = 'emp1';


- 인덱스 정보 확인
select * from user_indexes where table_name = 'emp1';

- 제약조건 추가

alter table emp1 add constraints emp_id_pk primary key(id);

또는

alter table emp1 add primary key(id) -- 제약조건 이름을 명시하지 않으면 자동으로 sys_c~~ 형식으로 생성

- 제약조건 삭제

alter table emp1 drop constraints emp_id_pk;

또는
alter table emp1 drop primary key;

insert into emp1(id, name, day) values(1,'홍길동',sysdate);
insert into emp1(id, name, day) values(1,'박찬호',sysdate); --오류. 프라이머리 키-> 고유한
insert into emp1(id, name, day) values(null,'홍길동',sysdate); -- 오류. 프라이머리 키 -> null값 안됨
select * from emp1;

rollback;

alter table emp1 drop primary key;

select * from user_constraints where table_name = 'EMP1';

insert into emp1(id, name, day) values(1,'홍길동',sysdate);
insert into emp1(id, name, day) values(1,'박찬호',sysdate); 
insert into emp1(id, name, day) values(null,'손흥민',sysdate);

---이러면 이제 고유값 중복, null값 추가되고 이래서 별로 데이터 품질 안좋아 그래서 프라이머리 키 설정하는거라고

rollback;

create table dept1(dept_id number, dept_name varchar2(30));

alter table dept1 add constraints dept_pk primary key(dept_id);
- 동일한 유저내에서 제약조건 이름은 고유한 이름으로 생성해야 한다.

select * from user_constraints where table_name = 'DEPT1';

insert into dept1(dept_id, dept_name) values(10, '총무부');
insert into dept1(dept_id, dept_name) values(20, '분석팀');
commit;

select * from dept1;

select * from emp1;
alter table emp1 add dept_id number;
select * from emp1;

insert into emp1(id, name, day, dept_id) values(1,'홍길동',sysdate,10);
insert into emp1(id, name, day, dept_id) values(2,'박찬호',sysdate,30);
commit;

사원들의 정보, 부서 정보 출력
select e.id, e.name, d.dept_name
from emp1 e, dept1 d
where e.dept_id = d.dept_id(+);

delete from emp1;
select * from emp1;

commit;

select * from dept1;


2. foreign key
- 외래키, 참조무결성 제약조건
- 동일한 테이블이나 다른 테이블의 primary key 또는 unique key 제약조건을 참조한다.
- 데이터 품질
- 중복값 허용, null 값 허용
- 종속되는 행을 삭제를 불허한다.

alter table emp1 add constraint emp_dept_id_fk
foreign key(dept_id) references dept1(dept_id);

select * from user_constraints where table_name in ('EMP1', 'DEPT1');
select * from user_cons_columns where table_name in ('EMP1', 'DEPT1');

insert into emp1(id, name, day, dept_id) values(1,'홍길동',sysdate,10);
insert into emp1(id, name, day, dept_id) values(2,'박찬호',sysdate,30); -- 오류 : primary key에 없는 키값을 입력할 수 없다
insert into emp1(id, name, day, dept_id) values(2,'박찬호',sysdate,null);

select * from emp1;
commit;
desc dept1

select * from dept1;

delete from dept1 where dept_id = 10; -- 오류. 참조하고 있는 데이터가 있기 때문에 삭제할 수 없다. 즉 얘를 parent로 하는 child record가 있어

delete from dept1 where dept_id = 20; -- 가능. 참조하고 있는 child record가 없거든

rollback;

alter table dept1 drop primary key; // 오류. 이걸 reference 하고 있는 애들이 있으니까. foreign key 제약조건이 참조하고 있기때문에 오류발생

1) alter table emp1 drop constraint EMP_DEPT_ID_FK;

2) alter table dept1 drop primary key;

이 두개를 한번에 하는게

alter table dept1 drop primary key cascade; - cascade를 사용하면 foreign key 제약조건을 먼저 삭제하고 primary key 제약조건을 삭제한다.

select * from user_constraints where table_name in ('EMP1', 'DEPT1');


3) unique 제약조건
- 유일한 값만 체크
- null 허용
- 자동으로 unique index 생성

select * from user_constraints where table_name = 'DEPT1';
select * from dept1;

dept 테이블에 있는 dept_name에 유일한 값만 입력할 수 있도록 unique 제약조건을 추가하자.
alter table dept1 add constraint dept_name_uk unique(dept_name);
select * from user_constraints where table_name = 'DEPT1';
select * from user_cons_columns where table_name = 'DEPT1';
select * from user_indexes where table_name = 'DEPT1';
select * from user_indexes where table_name = 'DEPT1';
select * from user_ind_columns where table_name = 'DEPT1';

select * from dept1;
insert into dept1(dept_id, dept_name) values(30,'총무부'); - unique 제약조건 위반. 한 테이블 내에서 한번만 나오게 하는게 unique 키야!! 이미 총무부 있으니까 추가 안되는거지.
insert into dept1(dept_id, dept_name) values(30,NULL); - 가능

select * from dept1;

rollback;

update dept1
set dept_name = '총무부'
where dept_id = 20;

# unique key 삭제
alter table dept1 drop constraint dept_name_uk;

# unique key 생성
alter table dept1 add constraint dept_name_uk unique(dept_name);
select * from user_constraints where table_name = 'DEPT1'; 

# unique key 삭제

alter table dept1 drop unique(dept_name);

4. check 제약조건
- 조건에 값이 ture 인 경우, insert, update 할 수 있도록 만드는 제약조건
- null 허용한다. 중복되는 값 허용한다.

select * from emp1;
alter table emp1 add sal number;

alter table emp1 add constraint emp_sal_ck check (sal >= 1000);
select * from user_constraints where table_name = 'EMP1';

insert into emp1(id,name,day,dept_id,sal)
values(3,'커리',sysdate,20,500); -- check 조건에 위반되니까 안들어감.

update emp1
set sal = 600
where id = 1;

insert into emp1(id,name,day,dept_id,sal)
values(3,'커리',sysdate,20,5000);

rollback;

# check 제약조건 삭제
alter table emp1 drop constraint emp_sal_ck;

# check 제약조건 생성
alter table emp1 add constraint emp_sal_ck check(sal >= 1000 and sal <= 5000);

select * from user_constraints where table_name = 'EMP1';

rollback;

5. not null 제약조건
- null 값을 허용할 수 없는 제약조건
- not null 제약조건은 modify 로만 추가해야한다


select * from user_constraints where table_name = 'DEPT1';
alter table dept1 add constraint dept_name_uk unique(dept_name);
insert into dept1(dept_id, dept_name) values(30, null);
rollback;

alter table dept1 add constraint dept_name_nn not null(dept_name);

alter table dept1 modify dept_name constraint dept_name_notnull not null;

select * from user_constraints where table_name = 'DEPT1';
select * from user_cons_columns where table_name = 'DEPT1';

insert into dept1(dept_id, dept_name) values(30,'총무부'); -- unique 제약조건 위반.
insert into dept1(dept_id, dept_name) values(30,null); -- not null 제약조건 위반

select * from user_constraints where table_name = 'DEPT1';
select * from user_cons_columns where table_name = 'DEPT1';

- not null 제약조건 삭제
alter table dept1 drop constraint dept_name_notnull;
또는
alter table dept1 modify dept_name null;

desc dept1

drop table emp1 purge;
alter table dept1 add constraint dept_dept_id_pk primary key(dept_id);

create table emp1(
        id number constraint emp_id_pk primary key, -- 열레벨 정의
        name varchar2(30) constraint emp_name_nn not null, --not null 제약조건은 열레벨 정의만 가능
        sal number,
        dept_id number constraint emp_dept_id_fk references dept1(dept_id), -- 열레벨 정의할 때는 foreign key 키워드 안써. 테이블레벨로 할땐 씀.
        constraint emp_name_uk unique(name), -- 테이블 레벨 정의, 제약조건 뒤에 컬럼 (name) 지정 해줘야대
        constraint emp_sal_ck check(sal between 1000 and 5000));
        

select * from user_constraints where table_name in ('EMP1','DEPT1');

drop table emp1 purge;


---------------------------------------위에꺼랑 이거랑 비교해봐-------------------
create table emp1(
        id number constraint emp_id_pk primary key, -- 열레벨 정의
        name varchar2(30) constraint emp_name_nn not null, --not null 제약조건은 열레벨 정의만 가능
        sal number,
        dept_id number,
        constraint emp_name_uk unique(name), -- 테이블 레벨 정의, 제약조건 뒤에 컬럼 (name) 지정 해줘야대
        constraint emp_sal_ck check(sal between 1000 and 5000)
        constraint emp_dept_id_fk foreign key(dept_id) references dept1(dept_id)); --테이블 레벨로 foreign key 제약조건 할 때는 foreign key라는게 꼭 들어가야대
        
■ 테이블 이름 수정

1) 방법 1
drop table emp_copy purge;
rename emp1 to emp_copy;
select * from emp_copy;

select * from user_constraints where table_name = 'EMP_COPY';
rollback;

2) 방법 2
alter table emp_copy rename to copy_emp;


■ 테이블 이름 수정
desc copy_emp

alter table copy_emp rename column id to emp_id;

■ 제약조건 이름 수정

select * from user_constraints where table_name = 'COPY_EMP';
alter table copy_emp rename constraint emp_id_pk to copy_emp_id_pk;

select * from user_indexes where table_name = 'COPY_EMP';

■ INDEX 이름 수정

alter index emp_id_pk rename to copy_emp_idx;


■ flashback table

show recyclebin

select * from user_recyclebin;

purge recyclebin

create table emp_2022
as select * from employees;

drop table emp_2022; purge; ----------이게 영구히 삭제하는거야 퍼지!

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

복원할 테이블과 현재 존재하는 테이블 이름이 동일할때 오류나

그래서 이렇게 rename to 추가
flashback table emp_2022 to before drop rename to 'emp_2022_1';

select * from user_recyclebin;
create table new as select * from employees;
drop table new;
select * from user_recyclebin;
-recyclebin 안에 동일한 테이블 이름이 있을 경우에는 가장 최근에 삭제한 걸 복구한다.
flashback table new to before drop;

alter session set time_zone = '-05:00'; -- 현재 접속한 지역의 timezone 수정
select sysdate, systimestamp, current_date, current_timestamp, localtimestamp
from dual;

timestamp with local time zone : 보는 지역에 따라 날짜 시간을 자동 정규화 해줌
interval yeat to month : 기간을 나타내는 날짜 타입, 년수, 개월수
interval day to second : 기간을 나타내는 날짜 타입, 일수, 시분초.이하9자리

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

alter session set time_zone = '+08:00'; -- 현재 접속한 지역의 timezone 수정
select sysdate, systimestamp, current_date, current_timestamp, localtimestamp
from dual;

char -> timestamp 형변환
select to_timestamp('2022-01-04 11:30:00','yy-mm-dd hh24:mi:ss') from dual;

char -> timestamp with local time zone 형변환
select to_timestamp('2022-01-04 11:30:00.123456789 +09:00','yy-mm-dd hh24:mi:ss.ff tzh:tzm') from dual;

create table time_test_1(
        a interval year(3) to month,
        b interval day(3) to second);
        

char -> interval year to month 형변환함수, to_yminterval('년수-개월수')
select to_yminterval('10-11') from dual;
select sysdate + to_yminterval('10-11') from dual;
select add_months(sysdate,120) from dual; -- 이거랑 밑에꺼랑 같음
select sysdate + to_yminterval('10-00') from dual;

char -> interval day to second 형변환함수
select localtimestamp + to_dsinterval('100 10:00:00') from dual;

날짜 + 숫자(일수) = 날짜
날짜 - 숫자(일수) = 날짜
날짜 - 날짜 = 숫자
날짜 + 시간 = 날짜, 시간
날짜 + 날짜 = 오류
날짜 + interval year to month = 날짜
날짜 + interval day to second = 날짜, 시간

[문제101] 각 사원의 last_name, hire_date 및 근속 연수를 출력하는 query를 작성
사원의 근속 연수가 5년 이상인 경우 '5 years of service'를 출력
사원의 근속 연수가 10년 이상인 경우 '10 years of service'를 출력
사원의 근속 연수가 15년 이상인 경우 '15 years of service'를 출력
어떤 조건도 일치하지 않으면 'maybe next year!' 출력
case, to_yminterval 사용

select last_name, hire_date,
        case
          when sysdate - to_yminterval('15-0') >= hire_date then '15 years of service'
           when sysdate - to_yminterval('10-0') >= hire_date then '10 years of service'
            when sysdate - to_yminterval('5-0') >= hire_date then '5 years of service'
            else 'maybe next year!'
        end "awards"
from employees;

■ view
- 하나 이상의 테이블이 있는 데이터를 논리적으로 처리하는 오브젝트이다.
- 단지 select 문만 가지고 있는 객체
- 간접 access(직접 데이터가 있는 데이터를 access하는게 아니고 뷰를 통해서 테이블을 참조한다.)
- 뷰를 생성하려면 create view 시스템권한 있어야한다.

select * from user_sys_privs; --dba(sys)로 부터 직접받은 시스템권한 확인
select * from role_sys_privs; --dba(sys)로부터 롤을 통해서 받은 시스템권한 확인
select * from session_privs; -- 오라클에 로그인 할 때 내가 받은 시스템 권한 확인
select * from user_ts_quotas; -- dba(sys)로 부터 받은 특정한 테이블스페이스 사용할 수 있는 정보

create view emp_view
as select employee_id, last_name, email, job_id, department_id
from employees;

emp_view select 하는 순간 뷰 생성시에 만들었던 
select employee_id, last_name, email, job_id, department_id
from employees; 이게 내부적으로 수행된다.

select *
from emp_view;

grant select on hr.emp_view to ora;

select * from user_tab_privs;

create or replace view emp_view
-- or replace 기존 이름으로 뷰가 있으면 drop하고 create 하는 옵션

[문제 102] 부서이름별 총액급여, 평균급여를 access하는 dept_sum_sal 뷰를 생성해주세요.

create or replace view dept_sum_sal
as
select d.department_id, e.sumsal, e.avgsal
from (select department_id, sum(salary) sumsal, avg(salary) avgsal
        from employees
        group by department_id) e, departments d
where e.department_id = d.department_id;

drop view dept_sum_sal;

단순뷰
- 뷰안에 select문의 테이블이 하나만 있는 경우, 즉 조인문장이 없는 경우
- 함수를 사용하지 않는 경우
- 뷰를 통해서 dml작업을 수행할 수 있다.

복합뷰
- 뷰 안에 select문의 테이블을 여러개 사용한 경우, 즉 조인문장이 있는 경우
- 함수를 사용한 경우
- 뷰를 통해서 dml 작업을 수행할 수 없다.

drop table test purge;

create table test
as select employee_id id, last_name name, salary sal
from employees
where department_id = 20;

select * from test;

create or replace view test_view
as select * from test;

select * from test_view; -- 단순뷰

- 단순뷰는 뷰를 통해서 insert 할 수 있다.
insert into test_view(id,name,sal) values(300,'홍길동',1000);
select*from test_view;
select*from test;

- 단순뷰는 뷰를 통해서 update 할 수 있다.
update test_view
set name = '박찬호'
where id = 201;

select * from test_view;

rollback;

- 단순뷰는 뷰를 통해서 delete 할 수 있다.
delete from test_view;
select * from test_view;

- 근데 단순뷰에서 with read only 마지막에 붙이면 : 단순뷰에서 dmls 작업을 수행할 수 없도록 하기 위한 옵션. 즉 select만 가능하도록 만들 때
- with check option constraint test_view_dept_20_ck; -- check 제약조건

- with check option : 뷰에서 check 제약조건을 생성하는 옵션
- check 제약조건 식 : 뷰 생성시 select 문의 where 절에 있는 내용이 check 제약조건 식이 된다.

create or replace view test_view
as select id, upper(name) name, sal * 1.1 sal
from test;

- 복합뷰는 뷰를 통해서 insert 할 수 없다.
- 복합뷰는 뷰를 통해서 update 할 수 없다.
insert into test_view(id,name,sal) values(300,'홍길동',1000);

- 복합뷰는 부분적으로 뷰를 통해서 delete 할 수 있다. (delete 만큼은 부분적으로 가능)
- 조인문장이 있는 경우에는 delete 안됨

delete from test_view;

■ sequence
- 자동일련번호를 생성하는 객체
- sequence 객체를 생성하려면 create sequence 시스템권한이 필요하다.

select * from session_privs;

create sequence id_seq;
select * from user_sequences where sequence_name = 'ID_SEQ';

create table seq_test(id number, name varchar2(30), day timestamp);
insert into seq_test(id,name,day) values(id_seq.nextval,'홍길동',localtimestamp);
insert into seq_test(id,name,day) values(id_seq.nextval,'박찬호',localtimestamp);

- sequence이름.nextval : 가상컬럼, 현재사용가능한 번호를 리턴
- sequence이름.currval : 현재사용한 번호를 리턴해준다.

rollback;

insert into seq_test(id,name,day) values(id_seq.nextval,'홍길동',localtimestamp);
insert into seq_test(id,name,day) values(id_seq.nextval,'박찬호',localtimestamp);

commit;

select * from user_sequences where sequence_name = 'ID_SEQ';

- sequence 삭제 

■ synonym
- 긴객체 이름을 짧은 이름으로 사용하는 객체
- create synonym 시스템권한필요
- 모든 유저들이 사용할수 있는 synonym을 생성하려면 create public 시스템 권한이 있어야한다.

- public synonym 생성
create public synonym emp for hr.employees;

select * from session_privs;

drop public synonym emp; -- create 권한이 있더라도 내가 만든걸 없애질 못해 drop 권한 없으면.

select *
from hr.employees
where employee_id = 100;

select * from user_tables where table_name = 'EMPLOYEES'; -- 논리적 저장소

select * from dba_data_files; -- 물리적 저장소

■ Data access method - 여기는 이 과정 해당 아니긴 해
책 = 테이블
페이지 = block(4k, 8k, 16k, 32k)
문장 = 행(row)
특정한 단어(오라클)를 찾아야 하면? 근데 색인이 없다면?

- full table scan : 테이블의 첫번째 행부터 마지막 행까지 access하는 방식
- rowid scan : 행의 물리적 주소를 가지고 찾는 방식, 데이터 access 방법 중에 가장 빠른 방법
        1) BY USER ROWID SCAN
            select * from employees where rowid = 'AAAEAbAAEAAAADNAAA';
        2) BY INDEX ROWID SCAN
        select * from employees where employee_id = 100;

rowid : 물리적 row 주소
AAAEAb(6자리) : data object id
AAE(3자리) : file id
select * from dba_data_file;
AAAADN(6자리) : block id
AAA(3자리) : row slot id

optimizer : SQL 문을 수행하기 위한 실행계획을 만든다.

■ INDEX
- by index rowid scan 방식을 사용해서 검색속도를 높이기 위해서 사용하는 객체.
- 인덱스를 이용해서 행을 검색하면 i/o(입력/출력)을 줄일 수 있다.
- 인덱스는 테이블과는 독립적으로 생성된다.
- 인덱스는 오라클이 자동으로 유지관리한다.
- primary key, unique 제약조건을 생성하게 되면 unique index 가 자동으로 생성된다.
- 수동으로 생성한다.



select * from user_indexes where table_name = 'EMPLOYEES';

select * from user_ind_columns where table_name = 'EMPLOYEES';

employees 의 department_id 는 중복되어 있잖아. 그래서 위에 인덱스 보면 department_id 부분은 uniqueness는 nonunique로 되어있지.

select * from employees;

drop table emp purge;
create table emp as select * from employees;

select * from user_constraints where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';

select * from emp where employee_id = 100; -- full table scan이 발생해서 시간 엄청 걸린거임
select rowid, employee_id from emp;
select * from emp where rowid = 'AAAFBGAAEAAAAFTAAA'; -- by user rowid scan 가장 빠른 방법이야.

- primary key 제약 조건 추가
alter table emp add constraint emp_id_pk primary key(employee_id);
select * from user_constraints where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';

select * from emp where employee_id = 100;

emp_id_pk 인덱스
select employee_id, rowid
from emp
order by 1;

select * from emp where employee_id = 100; -- by index rowid scan : rowid를 찾고 실제테이블에서 rowid에 맞는 키값을 찾아. 빠름.

select * from emp where last_name = 'King'; -- full table scan 이지.

-nonunique index 생성
create index emp_last_name_idx on emp(last_name);

select * from emp where last_name = 'King'; -- by index rowid scan
1) King에 해당하는 rowid를 emp_last_name_idx에 가서 찾는다.
2) 찾은 rowid를 가지고 emp 테이블에 찾아 간다.
3) 이걸 반복하다가 없으면 종료.
4) 결과셋을 유저에게 전달.

- primary key 제약조건 삭제
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

employee_id는 유일한값만 들어있으니까 논유니크 말고 유니크 인덱스로 만들어줘야해

create unique index emp_id_idx on emp(employee_id);
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';
select * from emp where employee_id = 100;

unique index 생성하게 되면 employee_id 컬럼의 같은 값은 입력 x
- unique 제약조건 건 것 같은 효과

drop table test purge;
create table test(id number, name varchar2(30));
create unique index test_id_idx on test(id);

insert into test(id,name) values(1, user); -- user 함수는 현재 insert를 수행하는 오라클 

unique 제약조건 안걸었는데도 걸린것처럼 걸려

rollback;

drop table test purge;

- 조합인덱스
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

■ comment
테이블과 컬럼에 설명(주석))을 만든다.

drop table emp purge;

create table emp as select * from employees;

select * from user_tab_comments where table_name = 'EMP';

select * from user_col_comments where table_name = 'EMP';

- 테이블 주석 생성
comment on table emp is '사원정보 테이블';
select * from user_tab_comments where table_name = 'EMP';

- 컬럼 주석 생성
comment on column emp.employee_id is '사번'

- 테이블 주석 삭제
comment on table emp is '';
select * from user_tab_comments where table_name = 'EMP';

- 컬럼 주석 삭제
comment on column emp.employee_id is '';

delete from emp;

select * from emp;

rollback;

select * from user_segments where segment_name = 'EMP';

UNDO tablespace 하는일?
dml 작업시 이전값을 저장하는 공간
왜?
select salary from hr.employees where employee_id = 100;

update hr.employees
set salary = 2400
where employee_id = 100;

rollback; - 롤백 하기 위해서 누군가는 이전값을 기억해야해 그게 바로 UNDO tablespace
        - bin은 롤이 아니라 테이블 틀 자체를 DROP 한 걸 저장하는 곳이고;
        
이렇게 UNDO 에다가 넣지도 않고 바로 없애는 게 바로
■ truncate
테이블의 행을 다 삭제하는 행위는 delete 문과 비슷하지만 truncate문은 저장공간을 초기상태로 만든다. 취소할 수 없다. delete는 rollback 할 수 잇자나
undo에 들어가지 않음.
rollback할 이유가 없고 롤백 안됨


truncate table emp;

■ 분석함수

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

- 누적합
select employee_id, department_id, salary, sum(salary) over(order by employee_id) 누적합
from employees;

select employee_id, department_id, salary, sum(salary) over(partition by department_id) 부서별총합
from employees;

select employee_id, department_id, salary, sum(salary) over(partition by department_id order by employee_id) 부서별누적합
from employees;

select employee_id, department_id, salary, count(*) over(partition by department_id) 부서별인원수
from employees;

select employee_id, department_id, salary, 
    count(*) over(partition by department_id) 부서별인원수,
    max(salary) over(partition by department_id) 부서별최고급여,
    min(salary) over(partition by department_id) 부서별최저급여
from employees;

TOP-N 분석
최고 급여자 중에 10위까지 출력

1) 급여 기준 내림차순 정렬 =
select employee_id, salary
from employees
order by salary desc;

2) 정렬한 결과를 가지고 10위 제한을 해야한다.

- rownum : fetch번호를 리턴하는 가상컬럼
select rownum, employee_id
from employees;


select employee_id, salary
from employees
where rownum <= 10 - 이렇게 수행하면 랜덤하게 10개 뽑아
order by salary desc; - 그다음에 10개 뽑아낸걸 가지고 정렬 . 순서가 잘못됨. where 부터라서. 그러면 정렬을 먼저 시키고 랭킹 뽑고싶잖아


주의!! 우리회사에 똑같은 급여자가 없다라고 하면 아래와 같은 query문을 수행해도 되겠지만, 
        동일 급여자들이 있다고 하면 밑에처럼 top-n 분석하면 안되지. 11번에서 짤려버릴 수도 있으니까
select *
from (select employee_id, salary
    from employees
    order by salary desc)
where rownum <= 10;

그래서 RANK 랑 DENSE_RANK 써야돼

- rank() : 순위를 구하는 함수, 동일한 순위가 있으면 인정하고, 갭이 생김
- dense_rank() : 순위를 구하는 함수, 동일한 순위가 있어도 연이은 순위.

select rank() over(order by salary desc) "rank",
        dense_rank() over(order by salary desc) "dense_rank",
        employee_id, salary
from employees;


select *
from (select dense_rank() over(order by salary desc) "dense_rank",
        employee_id, salary from employees)
where dense_rank <= 10;

■ with 문 (ANSI 표준아님. 오라클)
- 두번이상 반복되는 select 문을 query block(가상테이블) 만들어서 사용
- 성능 향상

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