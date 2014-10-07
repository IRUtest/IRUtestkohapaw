use utf8;
package Koha::Schema::Result::Branchtransfer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Koha::Schema::Result::Branchtransfer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<branchtransfers>

=cut

__PACKAGE__->table("branchtransfers");

=head1 ACCESSORS

=head2 itemnumber

  data_type: 'integer'
  default_value: 0
  is_foreign_key: 1
  is_nullable: 0

=head2 datesent

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 frombranch

  data_type: 'varchar'
  default_value: (empty string)
  is_foreign_key: 1
  is_nullable: 0
  size: 10

=head2 datearrived

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 tobranch

  data_type: 'varchar'
  default_value: (empty string)
  is_foreign_key: 1
  is_nullable: 0
  size: 10

=head2 comments

  data_type: 'mediumtext'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemnumber",
  {
    data_type      => "integer",
    default_value  => 0,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "datesent",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "frombranch",
  {
    data_type => "varchar",
    default_value => "",
    is_foreign_key => 1,
    is_nullable => 0,
    size => 10,
  },
  "datearrived",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "tobranch",
  {
    data_type => "varchar",
    default_value => "",
    is_foreign_key => 1,
    is_nullable => 0,
    size => 10,
  },
  "comments",
  { data_type => "mediumtext", is_nullable => 1 },
);

=head1 RELATIONS

=head2 frombranch

Type: belongs_to

Related object: L<Koha::Schema::Result::Branch>

=cut

__PACKAGE__->belongs_to(
  "frombranch",
  "Koha::Schema::Result::Branch",
  { branchcode => "frombranch" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 itemnumber

Type: belongs_to

Related object: L<Koha::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "itemnumber",
  "Koha::Schema::Result::Item",
  { itemnumber => "itemnumber" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 tobranch

Type: belongs_to

Related object: L<Koha::Schema::Result::Branch>

=cut

__PACKAGE__->belongs_to(
  "tobranch",
  "Koha::Schema::Result::Branch",
  { branchcode => "tobranch" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2013-10-14 20:56:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NPbH+5o2BVPj8yeoUqEavw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
