? extends 'base'

<? block title => sub { ?>My amazing blog<? } ?>

? block content => sub {
? for my $entry (@$blog_entries) {
 	<h2><?= $entry->{title} ?></h2>
    <p><?= $fn->{utf8safe}->($entry->{body}) ?></p>
? } # endfor
<div>foobar</div>
<p>
	<?= $fn->{upper}->('convert to upper case by helper') ?>
</p>
? } # endblock

