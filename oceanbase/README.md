https://open.oceanbase.com/quickStart

```sh
$ docker compose up -d

$ docker compose logs -f

$ docker compose exec oceanbase ob-mysql sys
$ docker compose exec oceanbase ob-mysql root
$ docker compose exec oceanbase ob-mysql test
```

```sql
> CREATE TABLE fyi_links (
  id INTEGER PRIMARY KEY,
  url VARCHAR(80) NOT NULL,
  notes VARCHAR(1024),
  counts INTEGER,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
  );

> INSERT INTO fyi_links 
  VALUES (101, 
  'dev.fyicenter.com', 
  NULL,
  0,
  '2006-04-30');

> INSERT INTO fyi_links VALUES (102, 
  'dba.fyicenter.com', 
  NULL,
  0,
  DEFAULT);

> INSERT INTO fyi_links (url, id) 
  VALUES ('sqa.fyicenter.com', 103);

> select * from fyi_links;

> desc fyi_links;
```
