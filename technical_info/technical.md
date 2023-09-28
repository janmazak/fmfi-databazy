# How to setup a database

## Server cvika

You can connect via ssh to `cvika.dcs.fmph.uniba.sk`, with username and password as for the Comenius University account (e.g. AIS).
General instructions: [Linux (ssh)](https://www.ssh.com/ssh/command/#using-the-linux-client), [Windows (putty)](https://www.ssh.com/ssh/putty/windows/).

There should be SQLite and Postgresql available.

To download files from the web to the server cvika, use [wget](https://www.gnu.org/software/wget/manual/wget.html). You might want to get some experience with efficient file transfer by using [rsync](https://linuxtechlab.com/files-transfer-scp-rsync-commands/) too (it's not needed for this course).

If you have never tried it, we strongly encourage you to try setting up [ssh key authentication](https://www.ssh.com/ssh/key/) instead of using a password.

For viewing the contents of a file `abc.xyz`, use `cat abc.xyz` or `less abc.xyz`. For editing it, choose your favourite command-line editor --- but we suggest you at least learn the very basics of [vim](https://opensource.com/article/19/3/getting-started-vim). You might be interested in [Midnight Commander](https://midnight-commander.org/) too.

The work on a remote server is more comfortable if you open several terminals. For simple database work, you might use three windows: one terminal for general operating system commands, one to view the database, and one to write your queries.

## Datalog

See [datalog.md](./datalog.md).

## SQL

See [sql.md](./sql.md).

