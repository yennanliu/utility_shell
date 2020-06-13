-- 0)
select * from YENNANL_DEVELOPMENT_DATAWAREHOUSE.ADYEN.YEN_DEV31;


-- 2)
SELECT value:"json":"url"::varchar AS url,
                    value:"json":"cropHintsAnnotation" AS json_,
                                 value:"json":"cropHintsAnnotation":"cropHints" AS cropHints
FROM YENNANL_DEVELOPMENT_DATAWAREHOUSE.ADYEN.YEN_DEV31 "a",
     LATERAL FLATTEN(INPUT => "a"."json", OUTER => TRUE) b

-- 3) 
SELECT value:"json":"url"::varchar AS url,
                    value:"json":"cropHintsAnnotation" AS json_,
                                 value:"json":"cropHintsAnnotation":"cropHints" AS cropHints
FROM YENNANL_DEVELOPMENT_DATAWAREHOUSE.ADYEN.YEN_DEV31 "a",
     LATERAL FLATTEN(INPUT => "a"."json", OUTER => TRUE) "b",
             LATERAL FLATTEN(INPUT => "b":"boundingPoly", OUTER => TRUE) "c"
             