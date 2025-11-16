DO $$
DECLARE
  target_nodes text[] := ARRAY['citus-worker1', 'citus-worker2'];
  target_ports integer[] := ARRAY[5432, 5432];
  idx integer := 1;
  shard_record record;
  src record;
BEGIN
  FOR shard_record IN
    SELECT shardid
    FROM pg_dist_shard
    WHERE logicalrelid = 'personcanteenorder'::regclass
    ORDER BY shardid
  LOOP
    EXIT WHEN idx > array_length(target_nodes, 1);

    SELECT nodename, nodeport INTO src
    FROM pg_dist_shard_placement
    WHERE shardid = shard_record.shardid
    LIMIT 1;

    IF src.nodename IS NOT NULL AND src.nodename <> target_nodes[idx] THEN
      PERFORM master_move_shard_placement(
        shard_record.shardid,
        src.nodename,
        src.nodeport,
        target_nodes[idx],
        target_ports[idx]
      );
    END IF;

    idx := idx + 1;
  END LOOP;
END$$;
