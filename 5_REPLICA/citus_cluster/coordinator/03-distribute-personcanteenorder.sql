SET citus.shard_count = 2;
SET citus.shard_replication_factor = 1;

DO $$
BEGIN
   IF NOT EXISTS (
      SELECT 1 FROM pg_dist_partition WHERE logicalrelid = 'personcanteenorder'::regclass
   ) THEN
      PERFORM create_distributed_table('personcanteenorder', 'personid');
   END IF;
END$$;
