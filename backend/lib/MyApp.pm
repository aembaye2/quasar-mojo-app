package MyApp;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;

  my $r = $self->routes;

  $r->get('/api/hello')->to(cb => sub {
    my $c = shift;
    $c->render(json => { message => 'Hello from Mojolicious!' });
  });

  $self->hook(before_render => sub {
    my ($c, $args) = @_;
    $c->res->headers->header('Access-Control-Allow-Origin' => '*');
  });

  $r->options('/api/*')->to(cb => sub {
    my $c = shift;
    $c->res->headers->header('Access-Control-Allow-Origin' => '*');
    $c->res->headers->header('Access-Control-Allow-Methods' => 'GET, POST, OPTIONS');
    $c->res->headers->header('Access-Control-Allow-Headers' => 'Content-Type');
    $c->render(text => '', status => 200);
  });
}

1;  # ← This is required!

