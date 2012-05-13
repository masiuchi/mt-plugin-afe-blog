package MT::Plugin::AFEBlog;
use strict;
use warnings;
use base 'MT::Plugin';

our $VERSION = '0.01';
our $NAME = ( split /::/, __PACKAGE__ )[-1];

my $plugin = __PACKAGE__->new(
    {   name        => $NAME,
        id          => lc $NAME,
        key         => lc $NAME,
        version     => $VERSION,
        author_name => 'masiuchi',
        author_link => 'https://github.com/masiuchi',
        plugin_link => 'https://github.com/masiuchi/mt-plugin-afe-blog',
        description => 'Configure (Denied)AssetFileExtensions for each blog.',
        init_request => \&_init_request,
    }
);
MT->add_plugin($plugin);

sub _init_request {
    my $blog_id = MT->app()->param('blog_id');
    if ($blog_id) {
        my $afe_blog_name = 'AssetFileExtensionsBlog' . $blog_id;
        my $afe_blog      = MT->config->$afe_blog_name;
        if ($afe_blog) {
            MT->config->AssetFileExtensions($afe_blog);
        }

        my $dafe_blog_name = 'DeniedAssetFileExtensionsBlog' . $blog_id;
        my $dafe_blog      = MT->config->$dafe_blog_name;
        if ($dafe_blog) {
            MT->config->DeniedAssetFileExtensions($dafe_blog);
        }
    }
}

1;
__END__
