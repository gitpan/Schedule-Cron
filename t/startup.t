#!perl -w

# Startup Test:
# $Id: startup.t,v 1.5 2004/01/30 19:59:33 roland Exp $

use Schedule::Cron;
use Test::More tests => 1;

$| = 1;
#print STDERR " (may take a minute) ";

$SIG{QUIT} = sub { 
  alarm(0);
  pass;
  exit;
};

$SIG{ALRM} = sub { 
    fail;
    exit;
};

$cron = new Schedule::Cron(sub { kill QUIT, shift; alarm 0; });
$cron->add_entry("* * * * * */2",$$);

alarm(90);
$cron->run;



