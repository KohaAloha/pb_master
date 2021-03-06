use utf8;
package Koha::Schema::Result::ReturnClaim;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Koha::Schema::Result::ReturnClaim

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<return_claims>

=cut

__PACKAGE__->table("return_claims");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 itemnumber

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 issue_id

  data_type: 'integer'
  is_nullable: 1

=head2 borrowernumber

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 notes

  data_type: 'mediumtext'
  is_nullable: 1

=head2 created_on

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 created_by

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 updated_on

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 updated_by

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 resolution

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 resolved_on

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 resolved_by

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "itemnumber",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "issue_id",
  { data_type => "integer", is_nullable => 1 },
  "borrowernumber",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "notes",
  { data_type => "mediumtext", is_nullable => 1 },
  "created_on",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "created_by",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "updated_on",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "updated_by",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "resolution",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "resolved_on",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "resolved_by",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<issue_id>

=over 4

=item * L</issue_id>

=back

=cut

__PACKAGE__->add_unique_constraint("issue_id", ["issue_id"]);

=head1 RELATIONS

=head2 borrowernumber

Type: belongs_to

Related object: L<Koha::Schema::Result::Borrower>

=cut

__PACKAGE__->belongs_to(
  "borrowernumber",
  "Koha::Schema::Result::Borrower",
  { borrowernumber => "borrowernumber" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 created_by

Type: belongs_to

Related object: L<Koha::Schema::Result::Borrower>

=cut

__PACKAGE__->belongs_to(
  "created_by",
  "Koha::Schema::Result::Borrower",
  { borrowernumber => "created_by" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
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

=head2 resolved_by

Type: belongs_to

Related object: L<Koha::Schema::Result::Borrower>

=cut

__PACKAGE__->belongs_to(
  "resolved_by",
  "Koha::Schema::Result::Borrower",
  { borrowernumber => "resolved_by" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);

=head2 updated_by

Type: belongs_to

Related object: L<Koha::Schema::Result::Borrower>

=cut

__PACKAGE__->belongs_to(
  "updated_by",
  "Koha::Schema::Result::Borrower",
  { borrowernumber => "updated_by" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2022-02-23 19:37:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3V5bUmu5W3+XS0fa8uR04w

=head2 checkout

Type: belongs_to

Related object: L<Koha::Schema::Result::Issue>

=cut

__PACKAGE__->belongs_to(
    "checkout",
    "Koha::Schema::Result::Issue",
    { issue_id => "issue_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
    },
);

=head2 old_checkout

Type: belongs_to

Related object: L<Koha::Schema::Result::OldIssue>

=cut

__PACKAGE__->belongs_to(
    "old_checkout",
    "Koha::Schema::Result::OldIssue",
    { issue_id => "issue_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
    },
);

sub koha_objects_class {
    'Koha::Checkouts::ReturnClaims';
}
sub koha_object_class {
    'Koha::Checkouts::ReturnClaim';
}

1;
