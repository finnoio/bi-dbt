{{ config(materialized='table') }}

SELECT cfs.id,
        CASE
            WHEN cfs.phase IS NULL THEN 1
            WHEN cfs.phase = 'dunning' THEN 2
            WHEN cfs.phase = 'pre_court' THEN 3
            WHEN cfs.phase = 'in_court' THEN 4
            WHEN cfs.phase = 'after_court' THEN 5
            WHEN cfs.phase = 'monitoring' THEN 6
        ELSE 7 END AS phase_sort
from analytics_prod.case_file_states cfs