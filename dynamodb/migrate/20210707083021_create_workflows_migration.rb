# frozen_string_literal: true

class CreateWorkflowsMigration < Dynomite::Migration
  def up
    create_table :workflows do |t|
      t.partition_key 'id:string' # required
      t.sort_key 'name:string' # optional
      # t.attribute_definitions([
      #   { attribute_name: 'created_at', attribute_type: 'S' },
      #   { attribute_name: 'updated_at', attribute_type: 'S' }
      # ])
      t.billing_mode(:PROVISIONED)
      t.provisioned_throughput(5) # sets both read and write, defaults to 5 when not set

      # Instead of using partition_key and sort_key you can set the
      # key schema directly also
      # t.key_schema([
      #     {attribute_name: 'id', :key_type=>'HASH'},
      #     {attribute_name: 'created_at', :key_type=>'RANGE'}
      #   ])
      # t.attribute_definitions([
      #   {attribute_name: 'id', attribute_type: 'N'},
      #   {attribute_name: 'created_at', attribute_type: 'S'}
      # ])

      # other ways to set provisioned_throughput
      # t.provisioned_throughput(:read, 10)
      # t.provisioned_throughput(:write, 10)
      # t.provisioned_throughput(
      #   read_capacity_units: 5,
      #   write_capacity_units: 5
      # )
    end
  end
end
