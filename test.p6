use lib 'lib';
use Fluent::Logger;

my $logger = Fluent::Logger.new;

$logger.post( 'test.test', { "agent" => "foo from perl6" } );
