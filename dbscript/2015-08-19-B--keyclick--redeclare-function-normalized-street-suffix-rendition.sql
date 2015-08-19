START TRANSACTION
;
DELIMITER $$

DROP FUNCTION IF EXISTS `NORMALIZED_STREET_SUFFIX_RENDITION`
$$
CREATE FUNCTION `NORMALIZED_STREET_SUFFIX_RENDITION`(name VARCHAR(127)) RETURNS varchar(127)
  NO SQL
  SQL SECURITY INVOKER
BEGIN
  DECLARE the_normalized_street_suffix_rendition VARCHAR(127) DEFAULT '';
  DECLARE impure_simplified_name VARCHAR(127) DEFAULT '';
  DECLARE i TINYINT UNSIGNED DEFAULT 1;
  DECLARE c VARCHAR(1) DEFAULT ''; -- do not define as CHAR(1)!
  DECLARE simplified_name VARCHAR(127) DEFAULT '';
  DECLARE simplified_name_len TINYINT UNSIGNED;
  DECLARE last_space_pos TINYINT UNSIGNED;
  DECLARE name_proper VARCHAR(127);
  DECLARE last_word VARCHAR(127);
  --
  SET impure_simplified_name = TRIM(UPPER(REPLACE(name,'  ',' ')));
  --
  -- Without a REGEXP_REPLACE function, we must Safe()/whitelist by scanning the string and copying acceptable characters.
  --
  WHILE i <= LENGTH(impure_simplified_name) DO
    SET c = SUBSTRING(impure_simplified_name,i,1);
    IF c REGEXP '[0-9a-zA-Z/ -]' THEN
      SET simplified_name = CONCAT(simplified_name,c);
    END IF;
    SET i = i + 1;
  END WHILE;
  --
  SET simplified_name_len = LENGTH(simplified_name);
  SET last_space_pos = simplified_name_len + 1 - LOCATE(' ',REVERSE(simplified_name));
  IF last_space_pos > simplified_name_len THEN
    SET the_normalized_street_suffix_rendition = simplified_name;
  ELSE
    SET name_proper = SUBSTRING(simplified_name,1,last_space_pos - 1);
    SET last_word = SUBSTRING(simplified_name,last_space_pos + 1);
    if last_word = 'AR' THEN
      SET last_word = 'ARCH';
    elseif last_word in ('AV','AVENUE') THEN
      SET last_word = 'AVE';
    elseif last_word = 'BEND' THEN
      SET last_word = 'BND';
    elseif last_word = 'BOULEVARD' THEN
      SET last_word = 'BLVD';
    elseif last_word = 'CENTER' THEN
      SET last_word = 'CTR';
    elseif last_word = 'CIRCLE' THEN
      SET last_word = 'CIR';
    elseif last_word = 'COMMON' THEN
      SET last_word = 'CMN';
    elseif last_word = 'CMNS' THEN
      SET last_word = 'COMMONS';
    elseif last_word = 'COURT' THEN
      SET last_word = 'CT';
    elseif last_word = 'CREST' THEN
      SET last_word = 'CRST';
    elseif last_word = 'COVE' THEN
      SET last_word = 'CV';
    elseif last_word = 'COVES' THEN
      SET last_word = 'CVS';
    elseif last_word = 'CRESCENT' THEN
      SET last_word = 'CRES';
    elseif last_word = 'DRIVE' THEN
      SET last_word = 'DR';
    elseif last_word = 'GARDEN' THEN
      SET last_word = 'GDN';
    elseif last_word = 'GARDENS' THEN
      SET last_word = 'GDNS';
    elseif last_word = 'GLEN' THEN
      SET last_word = 'GLN';
    elseif last_word = 'GLENS' THEN
      SET last_word = 'GLNS';
    elseif last_word = 'GREEN' THEN
      SET last_word = 'GRN';
    elseif last_word = 'GREENS' THEN
      SET last_word = 'GRNS';
    elseif last_word = 'GROVE' THEN
      SET last_word = 'GRV';
    elseif last_word = 'GROVES' THEN
      SET last_word = 'GRVS';
    elseif last_word = 'HIGHWAY' THEN
      SET last_word = 'HWY';
    elseif last_word = 'HIWAY' THEN
      SET last_word = 'HWY';
    elseif last_word in ('LANDING','LDNG') THEN
      SET last_word = 'LNDG';
    elseif last_word = 'LANE' THEN
      SET last_word = 'LN';
    elseif last_word = 'PA' THEN
      SET last_word = 'PATH';
    elseif last_word in ('PARKWAY','PWKY') THEN
      SET last_word = 'PKWY';
    elseif last_word = 'PLACE' THEN
      SET last_word = 'PL';
    elseif last_word = 'POINT' THEN
      SET last_word = 'PT';
    elseif last_word = 'ROAD' THEN
      SET last_word = 'RD';
    elseif last_word = 'RIDGE' THEN
      SET last_word = 'RDG';
    elseif last_word in ('SQUARE','SQR') THEN
      SET last_word = 'SQ';
    elseif last_word = 'STREET' THEN
      SET last_word = 'ST';
    elseif last_word = 'TERRACE' THEN
      SET last_word = 'TER';
    elseif last_word = 'TURNPIKE' THEN
      SET last_word = 'TPKE';
    elseif last_word = 'TRAIL' THEN
      SET last_word = 'TRL';
    elseif last_word = 'TRACE' THEN
      SET last_word = 'TRCE';
    elseif last_word = 'WY' THEN
      SET last_word = 'WAY';
    elseif last_word = 'CROSSING' THEN
      SET last_word = 'XING';
    END IF;
    --
    SET the_normalized_street_suffix_rendition = CONCAT(name_proper,' ',last_word);
  END IF;
  --
  RETURN the_normalized_street_suffix_rendition;
END
$$
DELIMITER ;

COMMIT
