//#1
alter table drug add column isdeleted BOOLEAN NOT NULL DEFAULT 0
alter table interaction add column isdeleted BOOLEAN NOT NULL DEFAULT 0
alter table medicationorder add column isdeleted BOOLEAN NOT NULL DEFAULT 0
alter table ordercatalog add column isdeleted BOOLEAN NOT NULL DEFAULT 0
alter table person add column isdeleted BOOLEAN NOT NULL DEFAULT 0
alter table multiint add column isdeleted BOOLEAN NOT NULL DEFAULT 0

//#2
create table multiint(drugId int, InteractionId int, Foreign key (DrugId) References Drug(DrugId), Foreign key (InteractionId) References Interaction(InteractionId));
Insert into multiint values(2,1)
Insert into multiint values(2,3)
Insert into multiint values(1,3)

//#3
select FirstName, MiddleName, LastName from person where PersonId in(select m.PersonId from medicationorder  m ,drug d ,ordercatalog o where GenericName="haloperidol" and d. DrugId=o. DrugId and o.CatalogId=m.CatalogId)


//#4
select * from medicationorder m , person p where p.PersonId=m.PersonId and LastName="Cat"


//#5
select InteractionId,Outcome from interaction i join multiint mi using (InteractionId) group by interactionId,Outcome having count(mi.DrugId)>=2;