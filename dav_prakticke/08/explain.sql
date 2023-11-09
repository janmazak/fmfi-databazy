drop table if exists ab;
create table ab (
        a integer,
        b integer NOT NULL
);

drop table if exists bc;
create table bc (
        b integer NOT NULL,
        c integer NOT NULL,
	data text
);

drop table if exists cd;
create table cd (
        c integer,
        d integer
);

insert into ab select x.id, x.id from generate_series(1, 1000) as x(id);

insert into bc select x.id, x.id + 1, md5(random()::text) from generate_series(1, 1000) as x(id);

insert into cd values (1, 21), (2, 22), (11, 31);

