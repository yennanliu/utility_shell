


-- 1)
SELECT value:"json":"url"::varchar,
                    value:"json":"cropHintsAnnotation"
FROM YENNANL_DEVELOPMENT_DATAWAREHOUSE.ADYEN.YEN_DEV31 "a",
     LATERAL FLATTEN(INPUT => "a"."json", OUTER => TRUE) b


-- 2)