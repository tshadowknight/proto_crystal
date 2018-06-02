use JSON::XS;

my $translationFile = "docs/pokemon translations.json";
my $translationJSON = do {
    local $/ = undef;
    open my $fh, "<", $translationFile
        or die "could not open $translationFile: $!";
    <$fh>;
};

my %translations = %{decode_json $translationJSON};

#rename gfx folders
my @newBSTStrings;
my @newPokeConstants;
my @newPokeNames;
for my $id (sort keys %translations){
	push(@newBSTStrings, "INCLUDE \"data/pokemon/base_stats/".(lc $translations{$id}->{"new"}).".asm\"	;$id - ".(lc $translations{$id}->{"old"}));
	push(@newPokeConstants, "\tconst ".(uc $translations{$id}->{"new"})." ; ".$id);
	my $name = uc $translations{$id}->{"new"};
	$name .= '@' while 10 > length $name;
	push(@newPokeNames, "\tdb \"".($name)."\"");
}

my $filename = 'new_bst_order.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newBSTStrings);
close $fh;

my $filename = 'newPokeConstants.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newPokeConstants);
close $fh;

my $filename = 'newPokeNames.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newPokeNames);
close $fh;