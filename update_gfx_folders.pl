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

for my $id (keys %translations){
	#rename ("gfx/pokemon/".(lc $translations{$id}->{"old"}), "gfx/pokemon/".(lc $translations{$id}->{"new"}));
}