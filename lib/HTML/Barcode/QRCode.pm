package HTML::Barcode::QRCode;
use Mouse;
extends 'HTML::Barcode::2D';
use Text::QRCode;

has '+module_size' => ( default => '3px' );
has '_qrcode' => (
    is      => 'ro',
    default => sub { Text::QRCode->new },
);

sub barcode_data {
    my ($self) = @_;
    my $data = $self->_qrcode->plot($self->text);

    return [ map { [ map { $_ eq '*' ? 1 : 0 } @$_ ] } @$data ];
}

=head1 NAME

HTML::Barcode::QRCode - Generate HTML representations of QR codes

=head1 SYNOPSIS

L<Text::QRCode> and libqrencode are required by this class, so please install
them first.

  my $code = HTML::Barcode::QRCode->new(text => 'http://search.cpan.org');
  print $code->render;

=head1 DESCRIPTION

This class allows you easily create HTML representations of QR codes. These
are two-dimensional scan codes commonly used to allow people to quickly input
a URL into their phone or other mobile device.

=begin html

<p>Here is an example of a QR code rendered with this module:</p>
<style type="text/css">table.hbc{border-width:0;border-spacing:0;}table.hbc{border-width:0;border-spacing:0;}table.hbc tr, table.hbc td{border:0;margin:0;padding:0;}table.hbc td{text-align:center;}table.hbc td.hbc_on,table.hbc td.hbc_off{width:3px;height:3px;}table.hbc td.hbc_on{background-color:#000;color:inherit;}table.hbc td.hbc_off{background-color:#fff;color:inherit;}</style><table class="hbc"><tr><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td></tr><tr><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td></tr><tr><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td></tr><tr><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td></tr><tr><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td></tr><tr><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr></table>

=end html

This B<requires> L<Text::QRCode>.

You can read more about QR codes online (e.g. L<http://en.wikipedia.org/wiki/QR_code>).

=head1 METHODS

=head2 new (%attributes)

Instantiate a new HTML::Barcode::QRCode object. The C<%attributes> hash
requires the L</text> attribute, and can take any of the other
L<attributes|/ATTRIBUTES> listed below.

=head2 render

This is a convenience routine which returns C<< <style>...</style> >> tags
and the rendered QR code.

If you are printing multiple QR codes or want to ensure your C<style> tags
are in your HTML headers, then you probably want to output the QR code
and style separately with L</render_barcode> and
L</css>.

=head2 render_barcode

Returns only the rendered QR code.  You will need to provide stylesheets
separately, either writing them yourself or using the output of L</css>.

=head2 css

Returns CSS needed to properly display your rendered QR code.  This is
only necessary if you are using L</render_barcode> instead of the
easier L</render> method.

=head1 ATTRIBUTES

These attributes can be passed to L<new|/"new (%attributes)">, or used
as accessors.

=head2 text

B<Required> - The information to put into the QR code.

=head2 foreground_color

A CSS color value (e.g. '#000' or 'black') for the foreground. Default is '#000'.

=head2 background_color

A CSS color value background. Default is '#fff'.

=head2 module_size

A CSS value for the width and height of an individual module (a dot) in the
code. Default is '3px'.

=head2 css_class

The value for the C<class> attribute applied to any container tags
in the HTML (e.g. C<table> or C<div>).
C<td> tags within the table will have either css_class_on or css_class_off
classes applied to them.

For example, if css_class is "barcode", you will get C<< <table class="barcode"> >> and its cells will be either C<< <td class="barcode_on"> >> or
C<< <td class="barcode_off"> >>.

=head1 AUTHOR

Mark A. Stratman, C<< <stratman@gmail.com> >>

=head1 SOURCE REPOSITORY

L<http://github.com/mstratman/HTML-Barcode>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Mark A. Stratman.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;
