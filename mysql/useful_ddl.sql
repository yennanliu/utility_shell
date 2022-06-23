# 1) AUTO INCREMENT (SQL AUTO INCREMENT column)
# https://www.fooish.com/sql/auto-increment.html
#
# DDL
CREATE TABLE customers (
  C_Id INT AUTO_INCREMENT,
  Name varchar(50),
  Address varchar(255),
  Phone varchar(20),
  PRIMARY KEY (C_Id)
);

INSERT INTO customers (Name, Address, Phone)
VALUES ('姓名XXX', '地址XXX', '電話XXX');
