
$sum = 0;
while ( $input = <> ) {
	@nums = split /\s+/, $input;
	
	for ( $i = 0; $i < @nums ; $i++ ) {
		for ( $j = 0; $j < @nums ; $j++ ) {
			next if ( $i == $j );
			if ( ( $nums[ $i ] % $nums[ $j ] ) == 0 ) {
				$sum += $nums[ $i ] / $nums[ $j ];
				break;
			}
		}
	}
}
print $sum;
