@input = <> ;
chomp @input;
$index = 0;
$steps = 0;
while( $index < @input && $index >= 0 ) {
	#print "$index ", scalar @input, "\n";
	$temp = $index;
	$index += $input[ $index ];
	if( $input[ $temp ] >= 3) {
		$input[ $temp ]--;
	} else {
		$input[ $temp ]++;
	}
	$steps++;
}

print "$steps\n";
