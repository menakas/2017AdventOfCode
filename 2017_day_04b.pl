$valid = 0;
while( $input = <> ) {
	chomp $input;
	@phrases = split( /\s+/, $input );
	for ( $i = 0; $i < @phrases; $i++ ) {
		$phrases[ $i ] = join "", sort { $a cmp $b } split( //, $phrases[ $i ]);	
	}

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
