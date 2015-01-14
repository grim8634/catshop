use utf8;
package CatShop::Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'CatShop::Schema::Base';
__PACKAGE__->load_components(
  "TimeStamp",
  "InflateColumn::Authen::Passphrase",
  "DynamicDefault",
);
__PACKAGE__->table("products");
__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "products_id_seq",
  },
  "sku",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "normalized_name",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "created_at",
  {
    data_type     => "timestamp with time zone",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
    set_on_create => 1,
  },
  "updated_at",
  {
    data_type     => "timestamp with time zone",
    is_nullable   => 1,
    set_on_update => 1,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("products_sku", ["sku"]);
__PACKAGE__->has_many(
  "product_categories",
  "CatShop::Schema::Result::ProductCategory",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "product_metas",
  "CatShop::Schema::Result::ProductMeta",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-01-14 23:32:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cMOANPlUOa6I+eMKecltAw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
