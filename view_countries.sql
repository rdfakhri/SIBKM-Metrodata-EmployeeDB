CREATE VIEW view_all_countries AS
SELECT c.id, c.name, r.name AS region_name
FROM tbl_countries c
INNER JOIN tbl_regions r ON c.region = r.id;
