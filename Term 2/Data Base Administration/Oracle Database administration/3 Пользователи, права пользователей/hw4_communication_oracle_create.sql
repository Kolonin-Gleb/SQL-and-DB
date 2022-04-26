CREATE TABLE "hw4_abonents" (
	"id" INT NOT NULL,
	"tel" VARCHAR2(30) NOT NULL,
	"name" VARCHAR2(100) NOT NULL,
	"lastname" VARCHAR2(100) NOT NULL,
	"surname" VARCHAR2(100) NOT NULL,
	"operator_id" INT NOT NULL,
	constraint HW4_ABONENTS_PK PRIMARY KEY ("id"));

CREATE sequence "HW4_ABONENTS_ID_SEQ";

CREATE trigger "BI_HW4_ABONENTS_ID"
  before insert on "hw4_abonents"
  for each row
begin
  select "HW4_ABONENTS_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "hw4_operators" (
	"id" INT NOT NULL,
	"name" VARCHAR2(255) NOT NULL,
	constraint HW4_OPERATORS_PK PRIMARY KEY ("id"));

CREATE sequence "HW4_OPERATORS_ID_SEQ";

CREATE trigger "BI_HW4_OPERATORS_ID"
  before insert on "hw4_operators"
  for each row
begin
  select "HW4_OPERATORS_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
ALTER TABLE "hw4_abonents" ADD CONSTRAINT "hw4_abonents_fk0" FOREIGN KEY ("operator_id") REFERENCES "hw4_operators"("id");


