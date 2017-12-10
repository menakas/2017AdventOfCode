$input_line = <>;
chomp $input_line;
@input = split /\s+/, $input_line;

$input_num = $uniq_num = 0;
$i = 0;
$config[ $i ] = join "", @input;

while( $input_num == $uniq_num ) {
	
	#redistribute
	my $idxMax = maxindex( \@input );
#	print "Max $idxMax\n";
	$j = $idxMax == $#input ? 0 : $idxMax + 1;
	$redistribute = $input[ $idxMax ];
	$input[ $idxMax ] = 0;
	while( $redistribute-- > 0 ) {
		$input[ $j ]++; 
		$j = $j == $#input ? 0 : $j + 1;

		break if ($redistribute < 0) ;
	}

	$config[ ++$i ] = join "", @input;

	#print "$config[ $i ]\n";
	$input_num = scalar( @config );	
	my @uniq_config = uniq(@config);
	$uniq_num = scalar( @uniq_config );
}
$idx = 0;
++$idx until $config[$idx] == $config[ $i ];
print $i - $idx,"\n";

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

sub maxindex {
  my( $aref, $idxMax ) = ( shift, 0 );
  $aref->[$idxMax] >= $aref->[$_] or $idxMax = $_ for 1 .. $#{$aref};
  return $idxMax;
}
