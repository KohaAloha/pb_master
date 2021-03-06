use utf8;
package Koha::Schema::Result::Aqbudget;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Koha::Schema::Result::Aqbudget

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<aqbudgets>

=cut

__PACKAGE__->table("aqbudgets");

=head1 ACCESSORS

=head2 budget_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 budget_parent_id

  data_type: 'integer'
  is_nullable: 1

=head2 budget_code

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 budget_name

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 budget_branchcode

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 budget_amount

  data_type: 'decimal'
  default_value: 0.000000
  is_nullable: 1
  size: [28,6]

=head2 budget_encumb

  data_type: 'decimal'
  default_value: 0.000000
  is_nullable: 1
  size: [28,6]

=head2 budget_expend

  data_type: 'decimal'
  default_value: 0.000000
  is_nullable: 1
  size: [28,6]

=head2 budget_notes

  data_type: 'longtext'
  is_nullable: 1

=head2 timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 budget_period_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 sort1_authcat

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 sort2_authcat

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 budget_owner_id

  data_type: 'integer'
  is_nullable: 1

=head2 budget_permission

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "budget_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "budget_parent_id",
  { data_type => "integer", is_nullable => 1 },
  "budget_code",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "budget_name",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "budget_branchcode",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "budget_amount",
  {
    data_type => "decimal",
    default_value => "0.000000",
    is_nullable => 1,
    size => [28, 6],
  },
  "budget_encumb",
  {
    data_type => "decimal",
    default_value => "0.000000",
    is_nullable => 1,
    size => [28, 6],
  },
  "budget_expend",
  {
    data_type => "decimal",
    default_value => "0.000000",
    is_nullable => 1,
    size => [28, 6],
  },
  "budget_notes",
  { data_type => "longtext", is_nullable => 1 },
  "timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "budget_period_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "sort1_authcat",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "sort2_authcat",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "budget_owner_id",
  { data_type => "integer", is_nullable => 1 },
  "budget_permission",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</budget_id>

=back

=cut

__PACKAGE__->set_primary_key("budget_id");

=head1 RELATIONS

=head2 aqbudgetborrowers

Type: has_many

Related object: L<Koha::Schema::Result::Aqbudgetborrower>

=cut

__PACKAGE__->has_many(
  "aqbudgetborrowers",
  "Koha::Schema::Result::Aqbudgetborrower",
  { "foreign.budget_id" => "self.budget_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 aqbudgets_plannings

Type: has_many

Related object: L<Koha::Schema::Result::AqbudgetsPlanning>

=cut

__PACKAGE__->has_many(
  "aqbudgets_plannings",
  "Koha::Schema::Result::AqbudgetsPlanning",
  { "foreign.budget_id" => "self.budget_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 aqinvoice_adjustments

Type: has_many

Related object: L<Koha::Schema::Result::AqinvoiceAdjustment>

=cut

__PACKAGE__->has_many(
  "aqinvoice_adjustments",
  "Koha::Schema::Result::AqinvoiceAdjustment",
  { "foreign.budget_id" => "self.budget_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 aqinvoices

Type: has_many

Related object: L<Koha::Schema::Result::Aqinvoice>

=cut

__PACKAGE__->has_many(
  "aqinvoices",
  "Koha::Schema::Result::Aqinvoice",
  { "foreign.shipmentcost_budgetid" => "self.budget_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 aqorders

Type: has_many

Related object: L<Koha::Schema::Result::Aqorder>

=cut

__PACKAGE__->has_many(
  "aqorders",
  "Koha::Schema::Result::Aqorder",
  { "foreign.budget_id" => "self.budget_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 budget_period

Type: belongs_to

Related object: L<Koha::Schema::Result::Aqbudgetperiod>

=cut

__PACKAGE__->belongs_to(
  "budget_period",
  "Koha::Schema::Result::Aqbudgetperiod",
  { budget_period_id => "budget_period_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 suggestions

Type: has_many

Related object: L<Koha::Schema::Result::Suggestion>

=cut

__PACKAGE__->has_many(
  "suggestions",
  "Koha::Schema::Result::Suggestion",
  { "foreign.budgetid" => "self.budget_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vendor_edi_accounts

Type: has_many

Related object: L<Koha::Schema::Result::VendorEdiAccount>

=cut

__PACKAGE__->has_many(
  "vendor_edi_accounts",
  "Koha::Schema::Result::VendorEdiAccount",
  { "foreign.shipment_budget" => "self.budget_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vendor_edi_accounts_2s

Type: has_many

Related object: L<Koha::Schema::Result::VendorEdiAccount>

=cut

__PACKAGE__->has_many(
  "vendor_edi_accounts_2s",
  "Koha::Schema::Result::VendorEdiAccount",
  { "foreign.shipment_budget" => "self.budget_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 borrowernumbers

Type: many_to_many

Composing rels: L</aqbudgetborrowers> -> borrowernumber

=cut

__PACKAGE__->many_to_many("borrowernumbers", "aqbudgetborrowers", "borrowernumber");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2022-02-22 14:08:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:79woPPrp25KW0ndxVWXQQQ

__PACKAGE__->belongs_to(
  "budget",
  "Koha::Schema::Result::Aqbudgetperiod",
  { "foreign.budget_period_id" => "self.budget_period_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

sub koha_object_class {
    'Koha::Acquisition::Fund';
}
sub koha_objects_class {
    'Koha::Acquisition::Funds';
}

1;
