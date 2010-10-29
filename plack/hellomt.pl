use strict;
use warnings;
use Data::Dump qw(dump);

use utf8;
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
				{title => 'curry', body=>"<p style='font-size:300px;'>I'm malicious str!</p>"},
				{title => 'naan', body=>"I'm まるちばいともじ〠"},
			],
			fn => {
				'utf8safe' => sub {
					my $str = shift;
					utf8::encode($str);
					$str;
				},
				'upper' => sub {
					uc shift;
				},
			},
		},
	);
	$mt->render('ext');
}

