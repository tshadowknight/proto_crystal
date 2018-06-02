use JSON::XS;

my $translationFile = "docs/pokemon const translations.json";
my $translationJSON = do {
    local $/ = undef;
    open my $fh, "<", $translationFile
        or die "could not open $translationFile: $!";
    <$fh>;
};

my %translations = %{decode_json $translationJSON};

#rename gfx folders

for my $id (keys %translations){
	my $old = " ".(uc $translations{$id}->{"old"});
	my $new = " ".(uc $translations{$id}->{"new"});
	if($new eq ""){
		$new = "BULBASAUR";
	}
	my $cmd = "grep -rl $old --include \\*asm | xargs sed -i 's/$old/$new/g'";
	print "$cmd\n";
	
}