use ExtUtils::MakeMaker;
WriteMakefile
  (
   NAME => "Schedule::Cron",
   VERSION_FROM => "Cron.pm",
   ($] >= 5.005
      ? (ABSTRACT   => 'Crontab like scheduler',
         AUTHOR     => 'Roland Huss (roland@consol.de)')
      : ()),
  'dist' => {COMPRESS=>'gzip',SUFFIX=>'gz'}
  );
