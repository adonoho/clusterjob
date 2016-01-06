package CJ::CJVars;
# This is part of Clusterjob 
# Copyright 2015 Hatef Monajemi (monajemi@stanford.edu) 

use strict;
use warnings;
use parent 'Exporter'; # imports and subclasses Exporter
use File::Basename qw(dirname);
use File::Spec;
use IO::Socket::INET;



my $sock = IO::Socket::INET->new(
    PeerAddr=> "example.com",
    PeerPort=> 80,
    Proto   => "tcp");
if (!defined($sock)){
	print "No internet connection!\n";exit 0;
}	
our $localIP = $sock->sockhost; chomp($localIP);

our $localUserName = `id -un`;chomp($localUserName);  # Later on add the CJusername
our $localHostName = `uname -n`;chomp($localHostName);


my  $CJ_dir = File::Basename::dirname(File::Spec->rel2abs(__FILE__));
my  @CJ_dir_array = split '/',$CJ_dir;
my  $lastone = pop @CJ_dir_array;
our $install_dir  = join '/', @CJ_dir_array;


our $HOME            = $ENV{"HOME"};
our $localPrefix     = "$HOME/RunRepo_local/";
our $savePrefix      = "$HOME/Dropbox/clusterjob_saveRepo/";

our $last_instance_file = "$install_dir/.info/last_instance.info";
our $CJlog             = "$install_dir/.info/CJcall.log";

our $get_tmp_dir        = "$install_dir/../CJ_get_tmp";
our $history_file       = "$install_dir/.info/history.info";
our $cmd_history_file= "$install_dir/.info/cmd_history.info";
our $run_history_file   = "$install_dir/.info/run_history.info";
our $save_info_file     = "$install_dir/.info/save.info";
our $ssh_config_file    = "$install_dir/.ssh_config";


# Export global variables
our @EXPORT = qw($install_dir $remotePrefix $localPrefix $savePrefix $last_instance_file $get_tmp_dir $history_file $cmd_history_file $run_history_file $save_info_file $ssh_config_file $CJlog $localIP $localHostName $localUserName);




1;
