{{ config(materialized='view') }}

select cf.analytics_id,
       cfs.phase_sort
FROM analytics_prod.case_files cf
LEFT JOIN {{ ref('cf_states') }} cfs ON cf.state_id = cfs.id