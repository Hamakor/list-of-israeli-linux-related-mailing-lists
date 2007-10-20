#!/usr/bin/perl 

use strict;
use warnings;

my @lists = 
(
    {
        'id' => 'haifa-linux-club-projects',
        'class' => 'ezmlm',
        'group_base' => 'lin-prj',
        'hostname' => "haifux.org",
        'homepage' => "http://www.haifux.org/",
        'title' => "Haifa Linux Club's Projects Mailing-list",
        'description' => ("The Linux Club's programming projects are discussed " . 
            "here.")
        ,
        'guidelines' => ("Anything that is related to the Linux Club's Programming Projects"),
        'online_archive' => "http://www.mail-archive.com/lin-prj\@vipe.technion.ac.il/",
    },
    {
        'id' => 'gamla-devel',
        'class' => 'egroups',
        'group_base' => 'gamla-devel',
        'title' => "Gamla Development",
        'description' => sub {
            
            my $self = shift;
            my $r = shift;

            $r->start_para();
            $r->text("This mailing-list is dedicated to the development of ");
            $r->url("http://gamla.iglu.org.il/", "Gamla");
            $r->text(", the RAD and WWW application server for perl.");
            $r->end_para();
            
            },
        'guidelines' => ("Whatever is related to the development and " .
            "usage of Gamla: discussions, suggestions, questions, " .
            "answers, ideas, RFCs, and so on."),
    },
    
);
