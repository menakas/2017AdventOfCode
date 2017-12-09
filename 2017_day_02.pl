
$sum = 0;
while ( $input = <> ) {
	@nums = split /\s+/, $input;
	
	$max = $min = $nums [0];
	for ( $i = 0; $i < @nums ; $i++ ) {
		$max = $nums[ $i ] if ( $nums[ $i ] > $max );
		$min = $nums[ $i ] if ( $nums[ $i ] < $min );
	}
	$sum += $max - $min
}
print $sum;
