# SQL

For most purposes, you can use both [SQLite](#sqlite) and [PostgreSQL](#postgresql). However, SQLite is lightweight and does not provide all the features we want to explore (e.g. older versions lack support for regular expressions).

For checking syntax of your SQL statements, there are online tools available, e.g. [EverSQL](https://www.eversql.com/sql-syntax-check-validator/).

There is a server `cvika.dcs.fmph.uniba.sk` that allows you to use both the mentioned database systems. Account and password are the same as for the university account.

## SQLite
<a name="sqlite"></a>

Essentially, an [SQLite database](https://www.sqlite.org/about.html) is just a regular file, and using it requires no configuration.
It is available on the server `cvika`, or you can install it on your computer. There is an [online environment](https://sqliteonline.com/) available, too.


* To create a database from a file containing SQL commands, say, `emp.sql`, just run
```
	sqlite3 emp.db < emp.sql
```
The resulting file is `emp.db`.

* You can access the database by running
```
	sqlite3 emp.db
```
and then running `SELECT * FROM emp;` in the interactive terminal that opens. Don't forget the ending semicolon for all the SQL statements.

* To run SQL queries written in a file `queries.sql`, use 
```
	sqlite3 emp.db < queries.sql
```

* There are special ["dot commands"](https://www.sqlite.org/cli.html) to investigate the database structure or set various options. E.g.
	- `.tables` shows a list of tables,
	- `.schema <tablename>` gives you details about a particular table,
	- `.headers on` adds the list of column names to the output.

For a graphical interface to interact with an SQLite database, we suggest [sqlitebrowser](https://sqlitebrowser.org/). The tab `Execute SQL` allows you to run SQL commands.

## PostgreSQL
<a name="postgresql"></a>

PostgreSQL is available on the server `cvika`, or you can install it on your computer. On `cvika`, you have a single database (its name is identical with your username). PostgreSQL is known for its user-friendly [documentation](http://www.postgresql.org/docs/current/interactive/index.html).

There is an [online environment](https://onecompiler.com/postgresql/3xk8tb9w4) available, too. (We don't know about its capabilities, and suggest that you do not use online environments exclusively.)

* To fill an existing database with tables from a file containing SQL commands, say, `employee.sql`, run
```
	psql -f employee.sql
```

* To access your database, run `psql` in the terminal. It opens the interactive PostgreSQL terminal. The SQL commands you write into it should end with semicolon.

* To run SQL queries written in a file `queries.sql`, use
```
	psql -f queries.sql
```

* There are special ["meta commands"](https://dataschool.com/learn-sql/meta-commands-in-psql/) to investigate the database structure. E.g.
	- `\d` shows a list of tables,
	- `\d <tablename>` or `\d+ <tablename>` gives you details about a particular table.
These only work with the interactive `psql` terminal.

* For more on `psql`, see the [documentation](http://www.postgresql.org/docs/current/static/app-psql.html).
