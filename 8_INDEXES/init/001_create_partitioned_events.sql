-- Create a partitioned table that splits data by event_time
CREATE TABLE IF NOT EXISTS events (
    event_id      BIGSERIAL,
    event_time    TIMESTAMPTZ NOT NULL,
    metric_1      INTEGER NOT NULL,
    metric_2      INTEGER NOT NULL,
    metric_3      INTEGER NOT NULL,
    metric_4      INTEGER NOT NULL,
    payload       JSONB DEFAULT '{}'::JSONB,
    PRIMARY KEY (event_id, event_time)
) PARTITION BY RANGE (event_time);

-- Indexes on the parent table (apply ONLY here so child partitions can diverge)
CREATE INDEX IF NOT EXISTS events_idx_1 ON ONLY events (metric_1);
CREATE INDEX IF NOT EXISTS events_idx_2 ON ONLY events (metric_2);
CREATE INDEX IF NOT EXISTS events_idx_3 ON ONLY events (metric_3);

-- Create 3 monthly partitions
CREATE TABLE IF NOT EXISTS events_2024_01 PARTITION OF events
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');
CREATE TABLE IF NOT EXISTS events_2024_02 PARTITION OF events
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');
CREATE TABLE IF NOT EXISTS events_2024_03 PARTITION OF events
    FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');

-- Partition-specific indexes to match the requested combinations
CREATE INDEX IF NOT EXISTS events_2024_01_idx_1 ON events_2024_01 (metric_1);
CREATE INDEX IF NOT EXISTS events_2024_01_idx_2 ON events_2024_01 (metric_2);

CREATE INDEX IF NOT EXISTS events_2024_02_idx_1 ON events_2024_02 (metric_1);
CREATE INDEX IF NOT EXISTS events_2024_02_idx_2 ON events_2024_02 (metric_2);
CREATE INDEX IF NOT EXISTS events_2024_02_idx_3 ON events_2024_02 (metric_3);
CREATE INDEX IF NOT EXISTS events_2024_02_idx_23 ON events_2024_02 (metric_2, metric_3);

CREATE INDEX IF NOT EXISTS events_2024_03_idx_2 ON events_2024_03 (metric_2);
CREATE INDEX IF NOT EXISTS events_2024_03_idx_3 ON events_2024_03 (metric_3);
CREATE INDEX IF NOT EXISTS events_2024_03_idx_4 ON events_2024_03 (metric_4);

-- Additional composite index on the parent only to avoid automatic propagation to partitions
CREATE INDEX IF NOT EXISTS events_idx_24 ON ONLY events (metric_2, metric_4);
