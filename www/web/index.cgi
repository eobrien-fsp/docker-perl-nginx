#!/usr/bin/perl

main();

sub main {
    print "Content-type:text/html\n\n";
    foreach my $key (sort(keys(%ENV))) {
        print "$key = $ENV{$key}<br>\n";
    }
}
