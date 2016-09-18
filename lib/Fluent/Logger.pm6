use v6.c;
use Data::MessagePack;

unit class Fluent::Logger;
has $.tag-prefix;
has $.host = '127.0.0.1';
has $.port = 24224;

method post(Str $tag, $msg) {
    await IO::Socket::Async.connect($.host, $.port).then( -> $prom {
        if $prom.status {
            my $socket = $prom.result;
            #await 
            $socket.write( Data::MessagePack::pack( [ $tag, now.Rat, $msg ] ) );
        }
    });
}
