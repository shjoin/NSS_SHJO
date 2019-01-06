CREATE OR REPLACE PACKAGE pkg_def_income_trans
AS
   p_step            NUMBER (2);
   p_message         VARCHAR2 (100);
   p_error_id        CHAR (18);
   p_error_message   VARCHAR2 (4000);

   --
   -----------------------------------------------------------------
   -- Function Name: fn_find_max_batch_ctl_id
   --
   -- Created by: Kristen Markarian
   --
   -- Objective: This function will return max etl_batch_ctl_id
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 02/27/2014   Kristen Markarian        Created.
   -----------------------------------------------------------------
   --
   FUNCTION fn_find_max_batch_ctl_id (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE,
      pv_source_system_id   IN NUMBER)
      RETURN NUMBER;

   --
   -----------------------------------------------------------------
   -- Function Name: fn_find_run_date
   --
   -- Created by: Kristen Markarian
   --
   -- Objective: This function will return data range to run the process
   --
   --

   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 02/27/2014   Kristen Markarian        Created.
   -----------------------------------------------------------------
   --
   FUNCTION fn_find_run_date (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE,
      pv_date_flag          IN VARCHAR2,
      pv_source_system_id   IN NUMBER)
      RETURN DATE;

   -----------------------------------------------------------------
   -- Procedure Name: prc_ins_backout_reversal
   --
   -- Created by: KRM
   --
   -- Objective: This procedure will insert data into the TR_DI_TRANSACTION WHEN A
   --            FULFILLMENT_BACKOUT has been performed.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 0907/2014   KRM                     Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_ins_backout_reversal (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);


   -----------------------------------------------------------------
   -- Procedure Name: prc_build_di_schedule
   --
   -- Created by: RAF
   --
   -- Objective: This procedure will insert data into the TR_DI_SCHEDULE(O,R) and
   --  TR_DI_SCHEDULE_OVERRIDE(T) tables based on trans_type
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 04/07/2014   RAF                      Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_build_di_schedule (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);

   -----------------------------------------------------------------
   -- Procedure Name: prc_build_remit_schedule
   --
   -- Created by: RAF
   --
   -- Objective: This procedure will insert data into the TR_REMIT_SCHEDULE table
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 04/15/2014   RAF                      Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_build_remit_schedule (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);

   -----------------------------------------------------------------
   -- Procedure Name:  prc_build_remit_transactions
   --
   -- Created by: RAF
   --
   -- Objective: This procedure will insert remit transactions into TR_REMIT_ADJUST_TRANSACTIONS table.
   --
   --
   -- Modifications
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 04/24/2014   RAF                      Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_build_remit_transactions (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);

   -----------------------------------------------------------------
   -- Procedure Name: prc_ins_di_recog_override
   --
   -- Created by: Duane Diniz
   --
   -- Objective: This procedure will insert derived income transactions into DI transaction table.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 04/02/2014   Duane Diniz               Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_ins_di_recog_override (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);

   -----------------------------------------------------------------
   -- Procedure Name: prc_ins_di_recognition
   --
   -- Created by: Duane Diniz
   --
   -- Objective: This procedure will insert derived income transactions into DI transaction table.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 04/02/2014   Duane Diniz               Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_ins_di_recognition (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);

   -----------------------------------------------------------------
   -- Procedure Name: prc_ins_di_remainder
   --
   -- Created by: Duane Diniz
   --
   -- Objective: This procedure will insert derived income transactions into DI transaction table.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 05/02/2014   Duane Diniz               Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_ins_di_remainder (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);

   -----------------------------------------------------------------
   -- Procedure Name: prc_ins_di_billing
   --
   -- Created by: Duane Diniz
   --
   -- Objective: This procedure will insert submitted billing transactions into DI transaction table.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 04/02/2014   Duane Diniz               Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_ins_di_billing (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);

   /*
   -----------------------------------------------------------------
   -- Procedure Name: prc_ins_di_recog_onhold
   --
   -- Created by: Duane Diniz
   --
   -- Objective: This procedure will insert on hold derived income transactions into DI transaction table.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 08/06/2014   Duane Diniz               Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_ins_di_recog_onhold (pv_application_id_i IN ex_error_log.application_id%TYPE,
                                        pv_process_name_i IN ex_error_log.process_name%TYPE,
                                        pv_function_name_i IN ex_error_log.function_name%TYPE
   );
*/
   -----------------------------------------------------------------
   -- Procedure Name: prc_ins_di_sched_remainder
   --
   -- Created by: Duane Diniz
   --
   -- Objective: This procedure will insert any remaining dollars to be recognized into DI schedule remainder table
   --                            after a fulfillment cancel occurs.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 04/28/2014   Duane Diniz               Created.
   -- 05/08/2017   Duane Diniz               US12216 - Accounting rules 606 adding revenue recognition.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_ins_di_sched_remainder (
      pv_application_id_i       IN ex_error_log.application_id%TYPE,
      pv_process_name_i         IN ex_error_log.process_name%TYPE,
      pv_function_name_i        IN ex_error_log.function_name%TYPE,
      pv_order_id_i             IN tr_di_transactions.order_id%TYPE,
      pv_line_item_i            IN tr_di_transactions.line_item%TYPE,
      pv_cust_contract_term_i   IN tr_di_transactions.cust_contract_term%TYPE,
      pv_ff_cancel_date_i       IN tr_fulfillment.sent_fulfillment_date%TYPE,
      pv_balance_amt_i          IN NUMBER,
      pv_balance_rec_amt_i      IN NUMBER);

   -----------------------------------------------------------------
   -- Procedure Name: prc_order_cancel_di_trueup
   --
   -- Created by: Duane Diniz
   --
   -- Objective: This procedure will insert cancel line true up transactions into DI transaction table.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 04/17/2014   Duane Diniz               Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_order_cancel_di_trueup (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);


   -----------------------------------------------------------------
   -- Procedure Name: prc_dnr_schedule_di_trueup
   --
   -- Created by: Duane Diniz
   --
   -- Objective: This procedure will true up DNR scheduled orders that get created after DNR cancels.
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 10/13/2014   Duane Diniz               Created.
   -----------------------------------------------------------------
   --

   PROCEDURE prc_dnr_schedule_di_trueup (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);


   -----------------------------------------------------------------
   -- Procedure Name: prc_ins_post_cancel_rfd
   --
   -- Created by: Rohit Aswal
   --
   -- Objective: This procedure will insert post cancel refund data into the tr_di_transactions
   --
   --
   -- Modifications:
   -- Date:        Created By:                Description:
   -- ------------ ----------------------- -------------------------
   -- 05/26/2015   Rohit Aswal              Created
   -------------------------------------------------------------


   PROCEDURE prc_ins_post_cancel_rfd (
      pv_application_id_i   IN ex_error_log.application_id%TYPE,
      pv_process_name_i     IN ex_error_log.process_name%TYPE,
      pv_function_name_i    IN ex_error_log.function_name%TYPE);
END pkg_def_income_trans;
/