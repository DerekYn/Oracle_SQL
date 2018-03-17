--================= *** ���̺� �����ϱ� *** =====================

-- 1.      1 : 1 ������ ���̺� �����ϱ�

 create table tbl_userlogin
 (
    userid  varchar2(20)   not null,
    passwd  varchar2(20)   not null,
    name    varchar2(30)   not null,
    constraint PK_tbl_userlogin_userid primary key(userid)
 );
 
 create table tbl_userdetail
 (
    userid  varchar2(20)   not null,
    gender  number(1)      not null,
    birth   varchar2(10)   not null,
    address varchar2(200)  not null,
    tel     varchar2(20),
    registerday  date default sysdate,
    constraint PK_tbl_userdetail_userid primary key(userid),
    constraint FK_tbl_userdetail_userid foreign key(userid)
               references tbl_userlogin(userid)                      -- �����޴� �÷��� �����ϸ鼭 not null �̾�� �ϸ�,
                on delete cascade,                                   -- �θ����̺��� tbl_userlogin ���̺����� 
    constraint CK_tbl_userdetail_gender check( gender in(1, 2) )     -- � ���� ����(delete)�ϸ� �ڵ������� 
 );                                                                    -- �ڽ����̺��� tbl_userdetail ���̺�������
                                                                     -- userid�� ������ �൵ �����ȴ�.
                                                                     -- �׷��� ���̺��� ���̺��� ���谡 1 : 1�̶��
                                                                     -- foreign key ������ on delete cascade�� ���ش�.


 insert into tbl_userlogin(userid, passwd, name)
 values('superman', 'qewr1234$', '������');
  
 insert into tbl_userdetail(userid, gender, birth, address, tel)
 values('superman', 1, '1992-04-20', '��⵵ ���ν�', '010-3223-4813');

 insert into tbl_userlogin(userid, passwd, name)
 values('wonderwoman', 'qewr1234$', '������');
 
 insert into tbl_userdetail(userid, gender, birth, address, tel)
 values('wonderwoman', 2, '1993-09-14', '��⵵ ���ν�', '010-9348-2187');
 
 
 select *
 from tbl_userlogin;
 
 select *
 from tbl_userdetail;
 
 
 -- ȸ�� Ż��
 delete from tbl_userlogin
 where userid = 'superman';

 rollback;


--  3506