use strict;
use warnings;
use Data::Dump qw(dump);

use Text::MicroTemplate;
use Text::MicroTemplate::Extended;

my $app = sub {
	my $env = shift;
	return [
		200, 
		['Content-Type' => 'text/html'], 
		[render($env)],
	];
};

sub render {
	my $env = shift;
	
	my $mt = Text::MicroTemplate::Extended->new(
		include_path => ['./tpl'],
		use_cache => 1,
		template_args => {
			blog_entries => [
				{title => 'curry', body=>"hoehoe"},
				{title => 'naan', body=>"fugafuga"},
			],
		},
	);
	$mt->render('ext');
}

