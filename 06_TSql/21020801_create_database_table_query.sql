use tempdb;
go

create database sqlDB;
go

--DB���� 
use sqlDB;

 create table userTBL --ȸ�� ���̺�
 (
	userID	char(8) not null primary key, --����� ���̵� ',' �߿�! �������� (pk)
	userName	nvarchar(10) not null, --�̸�
	birthYear	int not null, --����⵵
	addr	nchar(2) not null, --����
	mobile1		char(3), --�޴��� ���� (010~019)
	mobile2		char(8), --�޴��� ������ (0000-0000, ������ ����)
	height	smallint, --Ű
	mDate	date -- ������ �ʵ� (ȸ�� ������)
 );
 go -- ���� �������� Ű����
 create table buyTbl -- �������̺�
 (
	num int identity not null primary key, --���� (pk)
	userID char(8) not null --����� ���̵�(fk)
		foreign key references userTbl(userID),
	prodName	nvarchar(20) not null, --��ǰ�� 
	groupName	nchar(4),  --�з�
	price int not null, --�ܰ�
	amount	smallint not null --����
 );
 go