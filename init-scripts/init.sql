CREATE SCHEMA IF NOT EXISTS analytics_prod;
CREATE SCHEMA IF NOT EXISTS dev_bi;

CREATE TABLE analytics_prod.case_file_states (
    id BIGINT PRIMARY KEY,
    phase VARCHAR(1224)
);

CREATE TABLE dev_bi.cf_states (
    id BIGINT PRIMARY KEY,
    phase_sort INT
);

CREATE TABLE analytics_prod.case_files (
    analytics_id BIGINT NOT NULL,
    state_id BIGINT,
    FOREIGN KEY (state_id) REFERENCES analytics_prod.case_file_states(id)
);

INSERT INTO analytics_prod.case_file_states (id, phase) VALUES
(1, 'dunning'),
(2, 'pre_court'),
(3, 'in_court'),
(4, 'after_court'),
(5, 'monitoring'),
(6, NULL);

INSERT INTO analytics_prod.case_files (analytics_id, state_id) VALUES
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 4),
(1005, 5),
(1006, 6),
(1007, 1),
(1008, 3),
(1009, 5),
(1010, 2),
(1011, 4),
(1012, 6);