-- Example query that benefits from the composite (metric_2, metric_3) index on events_2024_02
SELECT event_id, event_time, metric_2, metric_3
FROM events
WHERE event_time >= '2024-02-01'::timestamptz
  AND event_time <  '2024-03-01'::timestamptz
  AND metric_2 BETWEEN 100 AND 200
  AND metric_3 IN (5, 6, 7)
ORDER BY metric_2, metric_3;
