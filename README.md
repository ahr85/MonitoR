MonitoR
=======

Using R (with knitr, ggplot and RSQLite) for (Server) Monitoring

Referencing blog post: http://www.ahschulz.de/2013/04/01/monitor-using-r-for-server-monitoring/

## Usage
* cron.sh collects the data and stores it in the sqlite database
* executing the command in generate_report.txt generates the report

## License
MIT License. See LICENSE for details

## Copyright
Copyright (c) 2014 Arne Hendrik Schulz

## Changes
* 2014-01-18: Codes updated to use reshape2 instead of reshape