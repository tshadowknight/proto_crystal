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
	my $old = lc $translations{$id}->{"old"};
	my $new = lc $translations{$id}->{"new"};
	my $cmd = "grep -rl gfx/pokemon/$old --include \\*asm | xargs sed -i 's/gfx\\/pokemon\\/$old/gfx\\/pokemon\\/$new/g'";
	print "$cmd\n";
	#`$cmd`
}