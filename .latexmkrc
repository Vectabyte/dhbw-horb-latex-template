# Glossary support für LaTeX documents using makeglossaries.

add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');

$clean_ext .= ' acr acn alg glo gls glg';

sub run_makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    return system 'makeglossaries', '-d', $path, $base_name;
}

# Keep generated files out of the source tree.

$out_dir = '.';
$aux_dir = 'build';

$emulate_aux = 1; # Needed for TeX Live (Doesn't support separate output and auxiliary directories).