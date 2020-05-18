#resource "outscale_volume" "volume01" {
#  subregion_name = "eu-west-2a"
#  size           = 40
#}

#resource "outscale_snapshot" "snapshot01" {
#  volume_id = outscale_volume.volume01.volume_id
#  tags {
#    key   = "name"
#    value = "terraform-snapshot-test"
#  }
#}

# Add permissions

resource "outscale_snapshot_attributes" "snapshot_attributes01" {
  snapshot_id = outscale_snapshot.snapshot01.snapshot_id
  permissions_to_create_volume_additions {
    account_ids = ["012345678910"]
  }
}

# Remove permissions

resource "outscale_snapshot_attributes" "snapshot_attributes02" {
  snapshot_id = outscale_snapshot.snapshot01.snapshot_id
  permissions_to_create_volume_removals {
    account_ids = ["012345678910"]
  }
}