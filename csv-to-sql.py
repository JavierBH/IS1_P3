#!/usr/bin/env python3

import sys,os
import sqlite3
con = sqlite3.connect("database.db")

cur = con.cursor()
cur.execute("CREATE TABLE IF NOT EXISTS {0} (id,lat,long,name);".format(sys.argv[1]))


to_db = []
for line in sys.stdin:
    print(line)
    if(line[0] != '@'):
        to_db.append(line.split(",",3))

cur.executemany("INSERT INTO {0} (id,lat,long,name) VALUES (?,?,?,?);".format(sys.argv[1]),to_db)
con.commit()
con.close()
