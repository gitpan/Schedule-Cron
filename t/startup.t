#!perl -w

# Startup Test:
# $Id: startup.t,v 1.3 2000/01/04 11:57:21 roland Exp $

use Schedule::Cron;

$| = 1;
print "1..1\n";
print STDERR " (may take a minute) ";

$SIG{QUIT} = sub { 
  alarm(0);
  print "ok 1\n";
  exit;
};

$SIG{ALRM} = sub { 
  print "not ok 1\n";
  exit;
};

$cron = new Schedule::Cron(sub { kill QUIT, shift });
$cron->add_entry("* * * * *",$$);

alarm(90);
$cron->run;



