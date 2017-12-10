$valid = 0;
while( $input = <> ) {
	chomp $input;
	@phrases = split( /\s+/, $input );

	$input_num = scalar( @phrases );	
	my @uniq_phrases = uniq(@phrases);
	$uniq_num = scalar( @uniq_phrases );
	if( $input_num == $uniq_num ) {
		$valid++;
	}
}
print "$valid\n";

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}
