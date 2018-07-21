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
my @newDexEntries;
my @newDexEntryPointers;
my @newMoveHeaders;
my @newMovePointers;
my @newPalettePointers;
my @newPartyIconsPlaceHolders;
for my $id (sort keys %translations){
	push(@newBSTStrings, "INCLUDE \"data/pokemon/base_stats/".(lc $translations{$id}->{"new"}).".asm\"	;$id - ".(lc $translations{$id}->{"old"}));
	push(@newPokeConstants, "\tconst ".(uc $translations{$id}->{"new"})." ; ".$id);
	my $name = uc $translations{$id}->{"new"};
	$name .= '@' while 10 > length $name;
	push(@newPokeNames, "\tdb \"".($name)."\"");
	
	push(@newDexEntries, (ucfirst $translations{$id}->{"new"})."PokedexEntry::     INCLUDE \"data/pokemon/dex_entries/".(lc $translations{$id}->{"new"}).".asm\"");
	push(@newDexEntryPointers, "\tdw ".(ucfirst $translations{$id}->{"new"})."PokedexEntry");
	push(@newMoveHeaders,  (ucfirst $translations{$id}->{"new"})."EvosAttacks:\n\tdb 0 ; no more evolutions\n\tdb 0 ; no more level-up moves\n");
	push(@newMovePointers,  "\tdw ".(ucfirst $translations{$id}->{"new"})."EvosAttacks");
	push(@newPalettePointers,  "INCLUDE \"gfx/pokemon/".(lc $translations{$id}->{"new"})."/normal.pal\"");
	push(@newPalettePointers,  "INCLUDE \"gfx/pokemon/".(lc $translations{$id}->{"new"})."/shiny.pal\"");
	push(@newPartyIconsPlaceHolders,  "\tdb ICON_ODDISH      ; ".$translations{$id}->{"new"});
		
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

my $filename = 'newDexEntries.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newDexEntries);
close $fh;

my $filename = 'newDexEntryPointers.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newDexEntryPointers);
close $fh;

my $filename = 'newMoveHeaders.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newMoveHeaders);
close $fh;

my $filename = 'newMovePointers.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newMovePointers);
close $fh;

my $filename = 'newPalettePointers.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newPalettePointers);
close $fh;

my $filename = 'newPartyIconsPlaceHolders.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh join("\n", @newPartyIconsPlaceHolders);
close $fh;
