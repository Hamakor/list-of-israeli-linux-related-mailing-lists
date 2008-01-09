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

my @rejects = 
(
    {
        'id' => "ivrix-announce",
        'class' => $ivrix_class,
        'group_base' => "ivrix-announce",
        'title' => "Ivrix Announce",
        'description' => ("Announcments mailing list for the Ivrix " . 
            "Project, a project that aims to create a complete " .
            "Hebrew-enabled Linux distributions.\n\n" .
            "Being on this mailing list makes you an ". 
            "\"Ivrix member\". The Ivrix-announce mailing list is a " . 
            "very low volume mailing list (1-2 messages per " . 
            "month), moderated, and will contain announcements of " . 
            "new Ivrix projects, and follow progress of existing " . 
            "ones, and will contain other important information which " . 
            "should be of interest to all Ivrix members. "),
        'guidelines' => ("Only Ivrix announcements or other announcements " .
            "related to Hebrew/BiDi/i18n support on Linux."),
     },

     {
        'id' => "ivrix-steering-committee",
        'class' => $ivrix_class,
        'group_base' => "isc",
        'title' => "Ivrix Steering Committee discussions",
        'description' => ("This is the mailing list for Ivrix Steering " . 
            "Committee discussions. While only Ivrix Steering Committee " . 
            "members can post to it, anyone can subscribe to it for " . 
            "reading."),
        'guidelines' => ("None, as only committee members can post to " . 
            "this mailing list."),
     }, 
    {
        'id' => 'iglu',
        #'class' => $egroups_class,
        'class' => $iglu_class,
        'group_base' => 'iglu',
        'description' => ("A mailing-list dedicated to announcement and " .
            "other administrativia of the Israeli Group of Linux Users."),
        'title' => "IGLU",
        'guidelines' => ("Linux-IL announcements and administrative only."),
    },
    {
        'id' => 'israel-pm-list',
        'hostname' => 'hfb.pm.org',
        'class' => $majordomo_class,
        'title' => "Israel Perl Mongers List",
        'group_base' => 'israel-pm-list',
        'description' => ("The Israeli Perl-Mongers list is dedicated to " .
            "questions, answers and discussions regarding the perl " .
            "programming language."),
        'owner' => [ "gaal", "forum2.org" ],
        'homepage' => "http://israel.pm.org/",
        'guidelines' => ("Anything that is perl-related is acceptable."),
    },
    {
        'id' => 'perl-il',
        'hostname' => 'perl.org.il',
        'class' => $mailman_class,
        'title' => "Israel Perl Mongers List",
        'group_base' => 'perl',
        'description' => ("The Israeli Perl-Mongers list is dedicated to " .
            "questions, answers and discussions regarding the perl " .
            "programming language."),
        'owner' => [ "gabor", "perl.org.il"],
        'homepage' => "http://www.perl.org.il/",
        'guidelines' => ("Anything that is perl-related is acceptable."),
        'online_archive' => "http://www.perl.org.il/pipermail/perl/",
    },
    {
        'id' => 'linuxology',
        'class' => $linuxology_class,
        'hostname' => "netvision.net.il",
        'title' => "The Linuxology Newsletter",
        'group_base' => "linuxmag",
        'description' => ("An Israeli Newsletter (in Hebrew) dedicated " . 
            "to news and URLS relating to Linux."),
        'homepage' => "http://members.iol.co.il/Tux/",
        'online_archive' => "http://members.iol.co.il/Tux/linuxology.htm",
        'guidelines' => ("Send Linux News and Interesting URLs."),
    },
    {
        'id' => "python-il",
        'hostname' => "linux.org.il",
        'class' => 'ezmlm',
        'title' => "Python-IL",
        'group_base' => "python",
        'description' => ("Discussions, questions and answers regarding the " .
            "Python programming language."),
        'guidelines' => ("Whatever is related to Python."),
        'online_archive' => sub {
            my $self = shift;
            my $r = shift;
            
            $r->start_para();
            $r->text("Mail-Archive: ");
            $r->url("http://www.mail-archive.com/python%40linux.org.il/");
            $r->text("\n");
            $r->text("Gmane: ");
            $r->url("http://dir.gmane.org/gmane.comp.python.israel");
            $r->text("\n");
            $r->end_para();
        }, 
    },    
);
