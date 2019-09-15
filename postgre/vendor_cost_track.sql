CREATE OR REPLACE VIEW rw.vendor_cost_track AS
 WITH code_clean_ticket AS (
         SELECT split_part(cleaning_tickets.subject, '-'::text, 1) AS code,
            cleaning_tickets.subject AS subject_,
            cleaning_tickets.closed_date,
            cleaning_tickets.date_entered,
            cleaning_tickets.categories,
            cleaning_tickets.ticket_id::text AS ticket_id
           FROM rw.cleaning_tickets
          WHERE cleaning_tickets.subject ~~ '%-%'::text AND cleaning_tickets.status = 'Done'::text AND (cleaning_tickets.subject ~~ 'SC%'::text OR cleaning_tickets.subject ~~ 'SR%'::text OR cleaning_tickets.subject ~~ 'SF%'::text OR cleaning_tickets.subject ~~ 'DCR%'::text OR cleaning_tickets.subject ~~ 'DCF%'::text OR cleaning_tickets.subject ~~ 'DFR%'::text OR cleaning_tickets.subject ~~ 'TRIO%'::text OR cleaning_tickets.subject ~~ 'MHZ%'::text OR cleaning_tickets.subject ~~ 'MHV%'::text OR cleaning_tickets.subject ~~ 'MHE%'::text OR cleaning_tickets.subject ~~ 'MEV%'::text OR cleaning_tickets.subject ~~ 'MAV%'::text OR cleaning_tickets.subject ~~ 'ICP%'::text OR cleaning_tickets.subject ~~ 'TR%'::text OR cleaning_tickets.subject ~~ 'TDR%'::text OR cleaning_tickets.subject ~~ 'SMC%'::text OR cleaning_tickets.subject ~~ 'REP%'::text OR cleaning_tickets.subject ~~ 'BR%'::text OR cleaning_tickets.subject ~~ 'VC%'::text OR cleaning_tickets.subject ~~ 'CAL%'::text OR cleaning_tickets.subject ~~ 'CWAQ2%'::text OR cleaning_tickets.subject ~~ 'CWV%'::text OR cleaning_tickets.subject ~~ 'CWO%'::text OR cleaning_tickets.subject ~~ 'SRA%'::text OR cleaning_tickets.subject ~~ 'INAP%'::text OR cleaning_tickets.subject ~~ 'P123%'::text)
        ), code_rebalance_ticket AS (
         SELECT unnest(string_to_array(split_part(rebalance_tickets.subject::text, '-'::text, 1), '/'::text)) AS code,
            rebalance_tickets.subject AS subject_,
            rebalance_tickets.closed_date,
            rebalance_tickets.creation_date AS date_entered,
            rebalance_tickets.categories::text AS categories,
            rebalance_tickets.ticket_id::text AS ticket_id
           FROM rw.rebalance_tickets
          WHERE rebalance_tickets.subject::text ~~ '%-%'::text AND (rebalance_tickets.subject::text ~~ 'SC%'::text OR rebalance_tickets.subject::text ~~ 'SR%'::text OR rebalance_tickets.subject::text ~~ 'SF%'::text OR rebalance_tickets.subject::text ~~ 'DCR%'::text OR rebalance_tickets.subject::text ~~ 'DCF%'::text OR rebalance_tickets.subject::text ~~ 'DFR%'::text OR rebalance_tickets.subject::text ~~ 'TRIO%'::text OR rebalance_tickets.subject::text ~~ 'MHZ%'::text OR rebalance_tickets.subject::text ~~ 'MHV%'::text OR rebalance_tickets.subject::text ~~ 'MHE%'::text OR rebalance_tickets.subject::text ~~ 'MEV%'::text OR rebalance_tickets.subject::text ~~ 'MAV%'::text OR rebalance_tickets.subject::text ~~ 'ICP%'::text OR rebalance_tickets.subject::text ~~ 'TR%'::text OR rebalance_tickets.subject::text ~~ 'TDR%'::text OR rebalance_tickets.subject::text ~~ 'SMC%'::text OR rebalance_tickets.subject::text ~~ 'REP%'::text OR rebalance_tickets.subject::text ~~ 'BR%'::text OR rebalance_tickets.subject::text ~~ 'VC%'::text OR rebalance_tickets.subject::text ~~ 'CAL%'::text OR rebalance_tickets.subject::text ~~ 'CWAQ2%'::text OR rebalance_tickets.subject::text ~~ 'CWV%'::text OR rebalance_tickets.subject::text ~~ 'CWO%'::text OR rebalance_tickets.subject::text ~~ 'SRA%'::text OR rebalance_tickets.subject::text ~~ 'INAP%'::text OR rebalance_tickets.subject::text ~~ 'P123%'::text)
        ), all_ AS (
         SELECT code_clean_ticket.code,
            code_clean_ticket.subject_,
            code_clean_ticket.closed_date,
            code_clean_ticket.date_entered,
            code_clean_ticket.categories,
            code_clean_ticket.ticket_id
           FROM code_clean_ticket
        UNION ALL
         SELECT code_rebalance_ticket.code,
            code_rebalance_ticket.subject_,
            code_rebalance_ticket.closed_date,
            code_rebalance_ticket.date_entered,
            code_rebalance_ticket.categories,
            code_rebalance_ticket.ticket_id
           FROM code_rebalance_ticket
        )
 SELECT DISTINCT ON (all_.ticket_id) all_.ticket_id,
    all_.subject_ AS subject,
    all_.closed_date,
    all_.date_entered
   FROM all_
     JOIN rw.price_task_scheme price_task ON price_task.code = all_.code
  WHERE all_.closed_date IS NOT NULL
  ORDER BY all_.ticket_id;