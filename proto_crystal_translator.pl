use JSON::XS;

my $translationFile = "docs/pokemon_translations.json";
my $translationJSON = do {
    local $/ = undef;
    open my $fh, "<", $file
        or die "could not open $file: $!";
    <$fh>;
};

my %translations = ${decode_json $translationJSON};

#rename gfx folders

for my $id (keys %translations){
	
}