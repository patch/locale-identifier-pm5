use utf8;
use open qw( :encoding(UTF-8) :std );
use Test::Most tests => 16;
use Unicode::Locale;

# Tests adapted from examples in:
# UTS #35: Unicode LDML, Part 1: Core
# http://www.unicode.org/reports/tr35/tr35.html

# 3.1 Unicode Language Identifier

subtest "from_string('root')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('root');
    is $locale->language,  'und',  'language';
    is $locale->script,    undef,  'script';
    is $locale->region,    undef,  'region';
    is $locale->to_string, 'root', 'to_string';
};

subtest "from_string('en-US')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('en-US');
    is $locale->language,  'en',    'language';
    is $locale->script,    undef,   'script';
    is $locale->region,    'US',    'region';
    is $locale->to_string, 'en_US', 'to_string';
};

subtest "from_string('en_GB')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('en_GB');
    is $locale->language,  'en',    'language';
    is $locale->script,    undef,   'script';
    is $locale->region,    'GB',    'region';
    is $locale->to_string, 'en_GB', 'to_string';
};

subtest "from_string('es-419')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('es-419');
    is $locale->language,  'es',     'language';
    is $locale->script,    undef,    'script';
    is $locale->region,    '419',    'region';
    is $locale->to_string, 'es_419', 'to_string';
};

subtest "from_string('uz-Cyrl')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('uz-Cyrl');
    is $locale->language,  'uz',      'language';
    is $locale->script,    'Cyrl',    'script';
    is $locale->region,    undef,     'region';
    is $locale->to_string, 'uz_Cyrl', 'to_string';
};

# 3.3.1 BCP 47 Language Tag Conversion

subtest "from_string('und-US')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('und-US');
    is $locale->language,  'und',    'language';
    is $locale->script,    undef,    'script';
    is $locale->region,    'US',     'region';
    is $locale->to_string, 'und_US', 'to_string';
};

subtest "from_string('und-u-cu-USD')" => sub {
    plan tests => 5;
    my $locale = Unicode::Locale->from_string('und-u-cu-USD');
    is $locale->language,    'und',           'language';
    is $locale->script,      undef,           'script';
    is $locale->region,      undef,           'region';
    is $locale->u_extension, 'cu_usd',        'u_extension';
    is $locale->to_string,   'root_u_cu_usd', 'to_string';
};

# 3.4 Language Identifier Field Definitions

subtest "from_string('en')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('en');
    is $locale->language,  'en',  'language';
    is $locale->script,    undef, 'script';
    is $locale->region,    undef, 'region';
    is $locale->to_string, 'en',  'to_string';
};

subtest "from_string('fr_BE')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('fr_BE');
    is $locale->language,  'fr',    'language';
    is $locale->script,    undef,   'script';
    is $locale->region,    'BE',    'region';
    is $locale->to_string, 'fr_BE', 'to_string';
};

subtest "from_string('zh-Hant-HK')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('zh-Hant-HK');
    is $locale->language,  'zh',         'language';
    is $locale->script,    'Hant',       'script';
    is $locale->region,    'HK',         'region';
    is $locale->to_string, 'zh_Hant_HK', 'to_string';
};

# 3.5.1 Unknown or Invalid Identifiers

subtest "from_string('und')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('und');
    is $locale->language,  'und',  'language';
    is $locale->script,    undef,  'script';
    is $locale->region,    undef,  'region';
    is $locale->to_string, 'root', 'to_string';
};

subtest "from_string('und_Grek')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('und_Grek');
    is $locale->language,  'und',      'language';
    is $locale->script,    'Grek',     'script';
    is $locale->region,    undef,      'region';
    is $locale->to_string, 'und_Grek', 'to_string';
};

subtest "from_string('und_US')" => sub {
    plan tests => 4;
    my $locale = Unicode::Locale->from_string('und_US');
    is $locale->language,  'und',    'language';
    is $locale->script,    undef,    'script';
    is $locale->region,    'US',     'region';
    is $locale->to_string, 'und_US', 'to_string';
};

# 3.6 Unicode BCP 47 U Extension

subtest "from_string('und-u-foo-bar-nu-thai-ca-buddhist-kk-true')" => sub {
    plan tests => 5;
    my $locale = Unicode::Locale->from_string('und-u-foo-bar-nu-thai-ca-buddhist-kk-true');
    is $locale->language,    'und',                                  'language';
    is $locale->script,      undef,                                  'script';
    is $locale->region,      undef,                                  'region';
    is $locale->u_extension, 'bar_foo_ca_buddhist_kk_nu_thai',       'u_extension';
    is $locale->to_string,   'und_u_bar_foo_ca_buddhist_kk_nu_thai', 'to_string';
};

# 3.6.4 U Extension Data Files

subtest "from_string('en-u-vt-00A4')" => sub {
    plan tests => 5;
    my $locale = Unicode::Locale->from_string('en-u-vt-00A4');
    is $locale->language,    'en',           'language';
    is $locale->script,      undef,          'script';
    is $locale->region,      undef,          'region';
    is $locale->u_extension, 'vt_00a4',      'u_extension';
    is $locale->to_string,   'en_u_vt_00a4', 'to_string';
};

# 5 XML Format

subtest "from_string('af-t-k0-android')" => sub {
    plan tests => 5;
    my $locale = Unicode::Locale->from_string('af-t-k0-android');
    is $locale->language,    'af',              'language';
    is $locale->script,      undef,             'script';
    is $locale->region,      undef,             'region';
    is $locale->t_extension, 'k0_android',      't_extension';
    is $locale->to_string,   'af_t_k0_android', 'to_string';
};
