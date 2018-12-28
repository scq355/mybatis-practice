create table student(
  sno char(19) primary key,
  sname char(20) unique,
  ssex char(2),
  sage smallint,
  sdept char(20)
);

create table course(
  cno char(4) primary key,
  cname char(40) not null,
  cpno char(4),
  ccredit smallint,
  foreign key (cpno) references course(cno)
);

create table sc(
  sno char(9),
  cno char(4),
  grade smallint,
  primary key (sno, cno),
  foreign key (sno) references student(sno),
  foreign key (cno) references course(cno)
);

alter table student add sentrace date;

drop table student cascade;

create view is_student
as
  select sno, sname, sage
from student
where sdept = 'IS';

drop table student restrict;

drop table student cascade;

create unique index in_stu on student(sno, sname);

create unique index stusno on student(sno);
create unique index coucno on course(cno);
create unique index scno on sc(sno asc, cno desc);

select sno, sname, sdept
from student;

select sname, 2018-sage, lower(sdept)
from student;

select sname as 'name',
      'year-of-birth:' birth,
       2018-sage as birthday,
       lower(sdept) as department
from student;

select sno from sc;

select all sno from sc;

select distinct sno from sc;

select sname from student where sdept = 'CS';

select sname, sage from student where sage < 20;

select distinct sno
from sc
where grade < 60;

select sname, sage, sdept
from student
where sage between 20 and 23;

select sname, sage, sdept
from student
where sage not between 20 and 23;

select sname, sdept, ssex
from student
where sdept in ('CS', 'MA', 'IS');

select *
from student
where sno like '2012302492';

select *
from student
where sno = '2012302492';

select sname, sno, ssex
from student
where sname like '孙%';

select sname, sno, ssex
from student
where sname not like '孙%';

select sname, sno, ssex
from student
where sname like '孙__';

select sname, sno, ssex
from student
where sname like '_阳%';

select cno, ccredit
from course
where cname like 'DB\_Design' escape '\\';

select *
from course
where cname like 'DB\_%i__' escape '\\';

select sno, cno
from sc
where grade is null;

select sno, cno
from sc
where grade is not null;

select sname
from student
where sdept='CS' and 'sage' < 20;

select sname, sage
from student
where sdept = 'CS' or sdept = 'MA' or sdept = 'IS';

select sno, grade
from sc
where cno = '3'
order by grade desc;

select *
from student
order by sdept asc, sage desc;

select count(*)
from student;

select count(distinct sno)
from sc;

select avg(grade)
from sc
where cno = '1';

select max(grade)
from sc
where cno = '1';

select sum(ccredit)
from sc, course
where sno='2012302492' and sc.cno = course.cno;

select cno, count(sno)
from sc
group by cno;

select sno
from sc
group by sno
having count(*) > 3;

select sno, avg(grade)
from sc
where avg(grade) > 90
group by sno;

select sno, avg(grade)
from sc
group by sno
having avg(grade) > 90;

select student.*, sc.*
from sc, student
where student.sno = sc.sno;

select student.sno, sname, ssex, sage, sdept, cno, grade
from student, sc
where student.sno = sc.sno;

select student.sno, sname
from student, sc
where student.sno = sc.sno and sc.cno = '2' and sc.grade > 90;

select first.cno, second.cpno
from course first, course second
where first.cpno = second.cno;

select student.sno, sname, ssex, sage, sdept, cno, grade
from student left join sc on student.sno = sc.sno;

select student.sno, sname, cname, grade
from student, sc, course
where student.sno = sc.sno and sc.cno = course.cno;

select sname
from student
where sno in (
  select sno
  from sc
  where cno = '2'
  );


select sname, sdept, sno
from student
where sdept in (
    select sdept
    from student
    where sname = '刘成'
  );

select s1.sno, s1.sname, s1.sdept
from student s1, student s2
where s1.sdept = s2.sdept and s2.sname = '刘成';

select sno, sname
from student
where sno in (
        select sno
        from sc
        where cno in (
          select cno
          from course
          where cname = '信息技术'
          )
        );

select student.sno, sname
from student, sc, course
where student.sno = sc.sno and
      sc.cno = course.cno and
      course.cname = '信息技术';

select sno, sname, sdept
from student
where sdept=
      (
        select sdept
        from student
        where sname = '刘成'
        );

select sno, cno
from sc x
where grade >= (
  select avg(grade)
  from sc y
  where y.sno = x.sno
  );

select sname, sno
from student
where sage < any (
  select sage
  from student
  where sdept = 'CS'
) and sdept <> 'CS';


select sname, sno
from student
where sage < (
  select max(sage)
  from student
  where sdept = 'CS'
  ) and sdept <> 'CS';

select sname, sage
from student
where sage < all (
  select sage
  from student
  where sdept = 'CS'
) and sdept <> 'CS';


select sname, sage
from student
where sage < (
  select min(sage)
  from student
  where sdept = 'CS'
  ) and sdept <> 'CS';

select sname
from student
where exists(
  select *
  from sc
  where sc.sno = student.sno and cno = '1'
  );

select sname
from student
where not exists(
  select *
  from sc
  where sc.sno = student.sno and cno = '1'
  );

select sno, sname, sdept
from student s1
where exists(
  select *
  from student s2
  where s2.sdept = s1.sdept and s2.sname = '刘成'
  );

select sname
from student
where not exists(
  select *
  from course
  where not exists(
    select *
    from sc
    where sc.sno = student.sno and sc.cno = course.cno
    )
  );

select distinct sno
from sc x
where not exists(
  select *
  from sc y
  where y.sno='2012302492' and not exists(
    select *
    from sc z
    where z.sno = x.sno and z.cno = y.cno
    )
  );

select *
from student
where sdept = 'SC'
union
select *
from student
where sage <= 19;

select sno
from sc
where cno = '1'
union
select sno
from sc
where cno = '2';

select sno, cno
from sc,
     (
     select sno, avg(grade)
       from sc
       group by sno
       ) as avg_sc(avg_sno, avg_grade)
where sc.sno = avg_sc.avg_sno and sc.grade > avg_sc.avg_grade;

select sname
from student,
     (
     select sno
       from sc
       where cno = '1'
       ) as sc1
where student.sno = sc1.sno;

create table dept_age(
  sdept char(15),
  avg_age smallint
);

insert into dept_age (sdept, avg_age)
select sdept, avg(sage) from student group by sdept;

update sc
set grade = 0
where sno in (
select sno
from student
where sdept = 'CS'
);

delete from student
where sno = '2012302492';

delete from sc;

delete from sc
where sno in
(
select sno
from student
where sdept = 'SC'
);

select *
from student
where sname is null or sage is null or sdept is null;

select sno
from sc
where grade < 60 and cno = '1'
union
select sno
from sc
where grade is null and cno = '1';

select sno
from sc
where cno = '1' and (grade < 60 or grade is null);

create view is_student
as
select sno, sname, sdept
from student
where sdept = 'IS';

create view is_student
as
select sno, sname, sdept
from student
where sdept = 'IS'
with check option;

create view is_si(sno, sname, grade)
as
select student.sno, sname, grade
from student, sc
where sdept = 'IS' and student.sno = sc.sno and sc.cno = '1';

create view is_s2
as
select sno, sname, grade
from is_si
where grade >=90;

create view bt_s(sno, sname, sbtirth)
as
select sno, sname, 2018-sage
from student;

create view s_g(sno, gavg)
as
select sno, avg(grade)
from sc
group by sc.sno;

create view f_student(f_sno, name, sex, age, dept)
as
select *
from student
where ssex='男';

drop view bt_s;
drop view is_si;

drop view is_si cascade;

select sno, sage
from is_student
where sage > 20;

select sno, sage
from student
where sdept = 'IS' and sage > 20;

select is_student.sno, sname
from is_student, sc
where is_student.sno = sc.sno and sc.cno = '1';

select *
from s_g
where gavg >= 90;

select sno, avg(grade)
from sc
group by sno;

select sno, avg(grade)
from sc
where avg(grade) >= 90
group by sno;

select sno, avg(grade)
from sc
group by sno
having avg(grade) >= 90;

select *
from (
select sno, avg(grade)
from sc
group by sno
) as s_g(sno, gavg)
where gavg >= 90;

update is_student
set sname = '刘成'
where sno = '2012302492';

update student
set sname = '刘成'
where sno = '2012302492' and sdept = 'IS';

insert into is_student
values ('2012302492', '赵信', 20);

insert into student
values ('2012302492', '赵信', 20, 'IS');

delete from is_student
where sno = '2012302492'

delete from student
where sno = '2012302492'and sdept = 'IS';

create view s_g(sno, gavg)
as
select sno, avg(grade)
from sc
group by sc.sno;

update s_g
set s_g.gavg = 90
where s_g.sno = '2012302592';

create view vmgrade
as
select sno, max(grade), mgrade
from sc
group by sno;

select sc.sno, cno
from sc, vmgrade
where sc.sno = vmgrade.sno and sc.grade = vmgrade.mgrade;


grant select
on table student
to scq;

grant all privileges
on table student, course
to scq, scq1;

grant select
on table student
to public;

grant update(sno), select
on table student
to scq;

grant insert
on table sc
to scq
with grant option;

grant insert
on table sc
to scq;

revoke update(sno)
on table student
from scq;

revoke select
on table sc
from public;

revoke insert
on table sc
from scq cascade;

create role r1;

grant select, update, insert
on table student
to r1;

grant r1
to scq, scq1, scq2;

revoke r1
from scq;

grant delete
on table student
to r1;

revoke select
on table student
from r1;

create view cs_student
as
select *
from student
where sdept = 'CS';

grant select
on cs_student
to 'scq';

grant all privileges
on cs_student
to 'scq';

audit alter, update
on sc;

noaudit alter, update
on sc;


