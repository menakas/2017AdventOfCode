$input = <>;
chomp $input;

#hardcoding a max value for size of grid. Not ideal
$size = 15;

#Initialize
for( $i = 0; $i < $size; $i++ ) {
	for( $j = 0; $j < $size; $j++ ) {
		$grid[ $i ][ $j ] = 0;
	}
}

$x = $y = int ( $size / 2 );
$grid[ $x ][ $y ] = 1;
$bound = -1;

do {
	#one step to the right
	++$y; $grid[ $x ][ $y ] = calculate_num( @grid, $x, $y);
	$bound++;
	#to the top
	while ( $x > int( $size / 2 ) - $bound ) { 
		--$x; $sum = calculate_num(  @grid, $x, $y);
		$grid[ $x ][ $y ] = $sum;
		if( $grid[ $x ][ $y ] > $input) {
			print $grid[ $x ][ $y ], "\n";
			exit;
		}
	}
	#to the left
	while ( $y > int( $size / 2 ) - $bound ) { 
		--$y; $grid[ $x ][ $y ] = calculate_num(  @grid, $x, $y);
		if( $grid[ $x ][ $y ] > $input) {
			print $grid[ $x ][ $y ], "\n";
			exit;
		}
	}
	
	#to the bottom
	while ( $x < ( int( $size / 2 ) + $bound ) ) {
		++$x; $grid[ $x ][ $y ] = calculate_num(  @grid, $x, $y);
		if( $grid[ $x ][ $y ] > $input) {
			print $grid[ $x ][ $y ], "\n";
			exit;
		}
	}
			
	#to the right
	while ( $y < ( int( $size / 2 ) + $bound ) ) {
		++$y; $grid[ $x ][ $y ] = calculate_num(  @grid, $x, $y);
		if( $grid[ $x ][ $y ] > $input) {
			print $grid[ $x ][ $y ], "\n";
			exit;
		}
	}
} while( $grid[ $x ][ $y ] < $input );


sub calculate_num( @grid, $x, $y ) {

	$sum = 0;
	$sum += $grid[ $x - 1 ][ $y ] if $x > 0;
	$sum += $grid[ $x - 1 ][ $y - 1  ] if ( $x > 0 && $y > 0 );
	$sum += $grid[ $x ][ $y - 1 ] if $y > 0;
	$sum += $grid[ $x + 1 ][ $y - 1 ] if ( $x < $size - 1 && $y > 0 );
	$sum += $grid[ $x + 1 ][ $y ] if $x < $size - 1;
	$sum += $grid[ $x - 1 ][ $y + 1 ] if ( $x > 0 && $y < $size - 1 );
	$sum += $grid[ $x ][ $y + 1 ] if $y < $size - 1;
	$sum += $grid[ $x + 1][ $y + 1 ] if ( $x < $size - 1 && $y < $size - 1 );
	return $sum;
}

sub printgrid(@grid) {
	for( $i = 0; $i < @grid; $i++ ) {
		for( $j = 0; $j < @grid; $j++ ) {
			print $grid[ $i ][ $j ], " ";
		}
		print "\n";
	}
}
